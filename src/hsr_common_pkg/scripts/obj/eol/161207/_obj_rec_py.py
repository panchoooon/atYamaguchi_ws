#! /usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#物体認識（caffeラッパー）ROSノード
#
#author: Yutaro ISHIDA
#--------------------------------------------------


import sys
import roslib
sys.path.append(roslib.packages.get_pkg_dir('hsr_common_pkg') + '/scripts/common')

from common_import import *
from common_function import *


import cv2
import numpy as np
import skimage.data

import caffe
from caffe.proto import caffe_pb2


#array for detected image
croped_width   = 224
croped_height  = 224

names = [
	'Green_tea/',           #0
    'Cafe_au_lait/',        #1
    'Iced_tea/',            #2
	'Orange_juice/',        #3
	'Strawberry_juice/',    #4
	'Potato_chips/',        #5
	'Cookie/',              #6
	'Potato_stick/',        #7
	'Potage_soup/',         #8
	'Egg_soup/',            #9
	'Orange/',              #10
	'Apple/',               #11
	'Bawl/',                #12
	'Tray/',                #13
	'Cup/'                  #14
]

'''
group = [
    #aspect < aspectTH
    [
        'Potato_stick/',
        'Potage_soup/',
        'Egg_soup/',
        'Orange/',
        'Apple/',
        'Bawl/',
        'Tray/',
        'Cup/'
    ],
    #aspect >= aspectTH
    [
        'Green_tea/',
        'Cafe_au_lait/',
        'Iced_tea/',
        'Potato_chips/'
    ]
    #both
    #'Cookie/'
    #'Orange_juice/'
    #'Strawberry_juice/'
]

aspectTH = 1.4
'''

#--------------------------------------------------
#物体認識Class
#--------------------------------------------------
class ObjRec(object):
    def __init__(self):
        #caffe classifier of shape
        learned_path    = os.path.abspath(os.path.dirname(__file__)) + '/learned_160324_googlenet_jo2016/'
        
        caffe.set_mode_gpu()
        prototxt_path   = learned_path + 'const.prototxt'
        caffemodel_path = learned_path + 'model.caffemodel'
        self.classifier = caffe.Classifier(prototxt_path, caffemodel_path, raw_scale = 255, channel_swap = (2, 1, 0))

        self._obj_rec_action_server = actionlib.SimpleActionServer('obj_rec_action', ObjRecAction, execute_cb = self.obj_rec)
        self._obj_rec_action_server.start()
        self._cv_bridge = CvBridge()
            

    def obj_rec(self, goal):
        goal.obj_rec_goal.encoding = 'bgr8'

        #convert image
        cv2img = self._cv_bridge.imgmsg_to_cv2(goal.obj_rec_goal, 'bgr8')
        cv2img_array = np.array(cv2img, dtype = np.uint8)
        cv2.normalize(cv2img_array, cv2img_array, 0, 255, cv2.NORM_MINMAX)

        #check aspect propotion
        '''
        aim_obj = rospy.get_param('/param/op/obj/rec/target/id') - 1
        aspect = float(cv2img_array.shape[0]) / cv2img_array.shape[1]
        if aspect < aspectTH:
            if names[aim_obj] in group[1]:
                rospy.loginfo('Image size is not size of ' + names[aim_obj])
                result = ObjRecResult(obj_rec_result = -1)
                self._obj_rec_action_server.set_succeeded(result)
                return
        else:
            if names[aim_obj] in group[0]:
                rospy.loginfo('Image size is not size of ' + names[aim_obj])
                result = ObjRecResult(obj_rec_result = -1)
                self._obj_rec_action_server.set_succeeded(result)
                return
        '''

        #resize image
        image = cv2.resize(cv2img_array, (croped_width, croped_height))  
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        image = skimage.img_as_float(image).astype(np.float32)
        
        out   = self.classifier.predict([image], oversample = False)
        pred  = np.argmax(out)

        rospy.loginfo(names[pred])

        result = ObjRecResult(obj_rec_result = pred + 1)
        self._obj_rec_action_server.set_succeeded(result)
    
    
    def obj_rec_dammy(self, img, label):
        '''
        aspect = float(img.shape[0]) / img.shape[1]
        if aspect < aspectTH:
            if names[label] in group[1]:
                rospy.loginfo('Image size is not size of ' + names[label])
                return
        else:
            if names[label] in group[0]:
                rospy.loginfo('Image size is not size of ' + names[label])
                return
        '''

        image = cv2.resize(img, (croped_width, croped_height))  
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        image = skimage.img_as_float(image).astype(np.float32)

        out = self.classifier.predict([image], oversample = False)
        pred = np.argmax(out)

        rospy.loginfo(names[pred])
    

#--------------------------------------------------
#メイン関数
#--------------------------------------------------
if __name__ == '__main__':
    node_name = os.path.basename(__file__)
    node_name = node_name.split('.')
    rospy.init_node(node_name[0])
    
    obj_rec = ObjRec()
    
    main_rate = rospy.Rate(30)
    while not rospy.is_shutdown():
        main_rate.sleep()
