#! /usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#PDFレポート生成ROSノード
#
#author: Yutaro ISHIDA
#--------------------------------------------------


import sys
import roslib
sys.path.append(roslib.packages.get_pkg_dir('hsr_common_pkg') + '/scripts/common')

from common_import import *
from common_function import *


import Image as Img
from reportlab.pdfgen import canvas


#--------------------------------------------------
#定数
#--------------------------------------------------


#--------------------------------------------------
#グローバル変数
#--------------------------------------------------
now = datetime.datetime.today()    
pdf_file_path = os.path.expanduser('~') + '/athome_cfg_file/pdf_reporter/HM_' + str(now.year) + str(now.month) + str(now.day) + str(now.hour) + str(now.minute) +'_mor.pdf'
pdf = canvas.Canvas(pdf_file_path)


#--------------------------------------------------
#デバイス設定
#--------------------------------------------------


#--------------------------------------------------
#--------------------------------------------------
class PDFReporter():
    #--------------------------------------------------
    #--------------------------------------------------
    def __init__(self):
        self._sub_smi_i = rospy.Subscriber('/obj_proc/obj_all', Image, self.subf_smi_i)
        self._cv_bridge = CvBridge()



    #--------------------------------------------------
    #--------------------------------------------------
    def subf_smi_i(self, smi_i):
        try:
            cv2_i = self._cv_bridge.imgmsg_to_cv2(smi_i, "bgr8")
        except CvBridgeError as e:
            rospy.loginfo('[pdf_reporter]: CV brige FAIL')

        cv2_i = cv2.resize(cv2_i, (640, 480))
        cv2_i = cv2.cvtColor(cv2_i, cv2.COLOR_RGB2BGR)
        pdf.drawInlineImage(Img.fromarray(cv2_i), 10, 460) #左下が原点
    
        obj_description = '1: Green tea  2: Cafe au lait  3: Iced tea  4: Orange juice'
        pdf.drawString(10, 440, obj_description)
        obj_description = '5: Strawberry juice  6: Potato chips  7: Cookie(Vertical)'
        pdf.drawString(10, 420, obj_description)
        obj_description = '8: Cookie(Horizon)  9: Potato stick  10: Potage soup  11: Egg soup'
        pdf.drawString(10, 400, obj_description)
 
        #1ページ分を保存，次のページを作成
        pdf.showPage()
 

#--------------------------------------------------
#メイン関数
#--------------------------------------------------
if __name__ == '__main__':
    node_name = os.path.basename(__file__)
    node_name = node_name.split('.')
    rospy.init_node(node_name[0])
    
    pdf_reporter = PDFReporter()
    
    main_rate = rospy.Rate(30)
    while not rospy.is_shutdown():
        main_rate.sleep()

    # pdfを保存
    pdf.save()
