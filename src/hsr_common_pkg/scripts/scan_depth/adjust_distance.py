#!/usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#近づくROSノード
#
#author: Yutaro ISHIDA
#--------------------------------------------------


import sys
import roslib
sys.path.append(roslib.packages.get_pkg_dir('hsr_common_pkg') + '/scripts/common')

from common_import import *
from common_function import *


#--------------------------------------------------
#定数
#--------------------------------------------------


#--------------------------------------------------
#グローバル変数
#--------------------------------------------------
scan_depth = LaserScan()


#--------------------------------------------------
#デバイス設定
#--------------------------------------------------
robot = hsrb_interface.Robot()
whole_body = robot.get('whole_body')
gripper = robot.get('gripper')
omni_base = robot.get('omni_base')
tts = robot.get('default_tts')

rospy.sleep(0.5) #HSRのハードウェアAPIが立ち上がるまで待つ


#--------------------------------------------------
#--------------------------------------------------
def subf_scan_depth(sub_scan_depth):
    global scan_depth
    scan_depth = sub_scan_depth


#--------------------------------------------------
#--------------------------------------------------
if __name__ == '__main__':
    #node_name = os.path.basename(__file__)
    #node_name = node_name.split('.')
    #rospy.init_node(node_name[0])

    if rospy.get_param('/param/dbg/sm/flow') == 0 and rospy.get_param('/param/dbg/speech/onlyspeech') == 0:
        rospy.Subscriber("/scan/depth", LaserScan, subf_scan_depth)

        whole_body.move_to_joint_positions({'arm_lift_joint': rospy.get_param('/param/adjust/arm_lift_joint')})
        whole_body.move_to_joint_positions({'head_pan_joint': 1.57})
        whole_body.move_to_joint_positions({'head_tilt_joint': rospy.get_param('/param/adjust/head_tilt_joint')})

        target_distance = rospy.get_param('/param/adjust_distance/distance')

        cnt_end = 0

        main_rate = rospy.Rate(100)
        while not rospy.is_shutdown():
            angle_cur = scan_depth.angle_min
            range_array = []


            for scan_depth_range in scan_depth.ranges:
                if angle_cur > 3.14 / 180 * -10 and angle_cur < 3.14 / 180 * 10:
                    if scan_depth_range == scan_depth_range: #nanチェック
                        #nanでない時
                        range_array.append(scan_depth_range)

                angle_cur = angle_cur + scan_depth.angle_increment


            if len(range_array) == 0: #0除算防止
                continue
            else:
                range_ave = sum(range_array) / len(range_array)


            if range_ave > target_distance + 0.05:
                commonf_pubf_cmd_vel(0, 0.15, 0, 0, 0, 0)
                cnt_end = 0
            elif range_ave < target_distance - 0.05:
                commonf_pubf_cmd_vel(0, -0.05, 0, 0, 0, 0)
                cnt_end = 0
            else:
                commonf_pubf_cmd_vel(0, 0, 0, 0, 0, 0)
                if cnt_end < 0:
                    cnt_end = cnt_end + 1
                else:
                    sys.exit(0)


            main_rate.sleep()
