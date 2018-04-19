#!/usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#共通関数
#
#author: Yutaro ISHIDA
#--------------------------------------------------


import sys
import roslib
sys.path.append(roslib.packages.get_pkg_dir('hsr_common_pkg') + '/scripts')

from common_import import *


#--------------------------------------------------
#グローバル変数
#--------------------------------------------------
settings = termios.tcgetattr(sys.stdin)

pub_cmd_vel = rospy.Publisher('/hsrb/command_velocity', Twist, queue_size = 1)


#--------------------------------------------------
#音声合成を現スレッドで起動(喋り終わるまで待つ)
#--------------------------------------------------
#TODO:そのうちactionfを名前に入れる
def commonf_speech_single(speech_str):
    if rospy.get_param('/param/dbg/speech/ssynlog') == 1:
        rospy.loginfo(speech_str)
    if rospy.get_param('/param/dbg/sm/flow') == 0:
        talk_request_action_client = actionlib.SimpleActionClient('talk_request_action', TalkRequestAction)
        talk_request_action_client.wait_for_server()
        
        goal = TalkRequestGoal()
        goal.data.interrupting = False
        goal.data.queueing = False
        goal.data.language = 0
        goal.data.sentence = speech_str
        talk_request_action_client.send_goal(goal)
        talk_request_action_client.wait_for_result()


#--------------------------------------------------
#--------------------------------------------------
def commonf_actionf_sound_effect_single(sound_effect_goal):
    if rospy.get_param('/param/dbg/sm/flow') == 0:
        sound_effect_action_client = actionlib.SimpleActionClient('sound_effect_action', SoundEffectAction)
        sound_effect_action_client.wait_for_server()
        
        goal = SoundEffectGoal()
        goal.sound_effect_goal = sound_effect_goal
        sound_effect_action_client.send_goal(goal)
        sound_effect_action_client.wait_for_result()


#--------------------------------------------------
#--------------------------------------------------
def commonf_actionf_sound_effect_multi(sound_effect_goal):
    if rospy.get_param('/param/dbg/sm/flow') == 0:
        sound_effect_action_client = actionlib.SimpleActionClient('sound_effect_action', SoundEffectAction)
        sound_effect_action_client.wait_for_server()
        
        goal = SoundEffectGoal()
        goal.sound_effect_goal = sound_effect_goal
        sound_effect_action_client.send_goal(goal)
        #sound_effect_action_client.wait_for_result()


#--------------------------------------------------
#--------------------------------------------------
def commonf_node_killer(node_name): 
    node_killer_p = Popen(['rosnode','list'], stdout=PIPE) 
    node_killer_p.wait() 
    node_list = node_killer_p.communicate() 
    n = node_list[0] 
    n = n.split("\n") 
    for i in range(len(n)): 
        tmp = n[i]   
        if tmp.find(node_name) == 1: 
            call(['rosnode', 'kill', n[i]]) 
            break


#--------------------------------------------------
#--------------------------------------------------
def commonf_dbg_sm_stepin():
    if rospy.get_param('/param/dbg/sm/stepin') == 1:
        raw_input('#####Type enter key to step in#####')


#--------------------------------------------------
#--------------------------------------------------
def commonf_dbg_sm_stepout():
    if rospy.get_param('/param/dbg/sm/stepout') == 1:
        raw_input('#####Type enter key to step out#####')


#--------------------------------------------------
#--------------------------------------------------
def commonf_actionf_speech_rec(speech_rec_goal):
    speech_rec_action_client = actionlib.SimpleActionClient('speech_rec_action', SpeechRecAction) #音声認識のActionClientを生成
    speech_rec_action_client.wait_for_server() #音声認識ノードのActionServerに接続

    goal = SpeechRecGoal() #ActionのGoalを生成
    goal.speech_rec_goal = speech_rec_goal #ActionのGoalを設定
    speech_rec_action_client.send_goal(goal) #音声認識ノードのActionServerにGoalを送信

    speech_rec_action_client.wait_for_result() #音声認識ノードのActionServerから終了が返って来るまで待つ
    return speech_rec_action_client.get_result().speech_rec_result


#--------------------------------------------------
#--------------------------------------------------
def commonf_pubf_cmd_vel(linear_x, linear_y, linear_z, angular_x, angular_y, angular_z):
    global pub_cmd_vel

    cmd_vel = Twist()
    cmd_vel.linear.x = linear_x
    cmd_vel.linear.y = linear_y
    cmd_vel.linear.z = linear_z
    cmd_vel.angular.x = angular_x
    cmd_vel.angular.y = angular_y
    cmd_vel.angular.z = angular_z
    pub_cmd_vel.publish(cmd_vel)


#--------------------------------------------------
#--------------------------------------------------
def commonf_get_key():
    global settings

    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)

    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

    return key
