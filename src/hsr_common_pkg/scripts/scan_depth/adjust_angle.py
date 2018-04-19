#!/usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#角度を整えるROSノード
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

        cnt_end = 0

        main_rate = rospy.Rate(100)
        while not rospy.is_shutdown():
            angle_cur = scan_depth.angle_min
            range_array = []

            #最小二乗法で傾きを求めるため
            xy_sigma = 0
            x_sigma = 0
            y_sigma = 0
            x2_sigma = 0

            for scan_depth_range in scan_depth.ranges:
                if angle_cur > 3.14 / 180 * -10 and angle_cur < 3.14 / 180 * 10:
                    if scan_depth_range == scan_depth_range: #nanチェック
                        #nanでない時
                        range_array.append(scan_depth_range)

                        xy_sigma = xy_sigma + scan_depth_range * angle_cur
                        x_sigma = x_sigma + scan_depth_range
                        y_sigma = y_sigma + angle_cur
                        x2_sigma = x2_sigma + scan_depth_range ** 2
                angle_cur = angle_cur + scan_depth.angle_increment


            if len(range_array) == 0: #0除算防止
                continue
            else:
                range_ave = sum(range_array) / len(range_array)


            angle_cur = scan_depth.angle_min
            square_sigma = 0

            for scan_depth_range in scan_depth.ranges:
                if angle_cur > 3.14 / 180 * -10 and angle_cur < 3.14 / 180 * 10:
                    if scan_depth_range == scan_depth_range: #nanチェック
                        #nanでない時
                        square_sigma = square_sigma + (scan_depth_range - range_ave) ** 2
                angle_cur = angle_cur + scan_depth.angle_increment


            if len(range_array) == 0: #0除算防止
                continue
            else:
                #rospy.loginfo('Dispersion: ' + (str)(square_sigma / len(range_array)))

                if square_sigma / len(range_array) > 0.01:
                    commonf_pubf_cmd_vel(0, 0, 0, 0, 0, 0.12)
                else:
                    #y = ax + b
                    a = (len(range_array) * xy_sigma - x_sigma * y_sigma) / (len(range_array) * x2_sigma - x_sigma ** 2)
                    b = (x2_sigma * y_sigma - xy_sigma * x_sigma) / (len(range_array) * x2_sigma - x_sigma ** 2)

                    if a > 1.0:
                        commonf_pubf_cmd_vel(0, 0, 0, 0, 0, -0.12)
                        cnt_end = 0
                    elif a > 0.5:
                        commonf_pubf_cmd_vel(0, 0, 0, 0, 0, -0.1)
                        cnt_end = 0
                    elif a < -1.0:
                        commonf_pubf_cmd_vel(0, 0, 0, 0, 0, 0.12)
                        cnt_end = 0
                    elif a < -0.5:
                        commonf_pubf_cmd_vel(0, 0, 0, 0, 0, 0.1)
                        cnt_end = 0
                    else:
                        commonf_pubf_cmd_vel(0, 0, 0, 0, 0, 0)
                        if cnt_end < 0:
                            cnt_end = cnt_end + 1
                        else:
                            sys.exit(0)


            main_rate.sleep()
