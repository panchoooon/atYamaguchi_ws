#!/usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#共通import
#
#author: Yutaro ISHIDA
#--------------------------------------------------


#--------------------------------------------------
#Julius関係(from import)
#--------------------------------------------------
from __future__ import print_function
from contextlib import closing
from copy import deepcopy


#--------------------------------------------------
#Julius関係(import)
#--------------------------------------------------
import commands
import copy
import csv
import MeCab
import numpy as np


#--------------------------------------------------
#ROS関係(from import)
#--------------------------------------------------
from cv_bridge import CvBridge

from move_base_msgs.msg import MoveBaseAction
from move_base_msgs.msg import MoveBaseGoal

from hsr_common_pkg.msg import ObjRecAction
from hsr_common_pkg.msg import ObjRecGoal
from hsr_common_pkg.msg import ObjRecFeedback
from hsr_common_pkg.msg import ObjRecResult

from hsr_common_pkg.msg import SoundEffectAction
from hsr_common_pkg.msg import SoundEffectGoal
from hsr_common_pkg.msg import SoundEffectFeedback
from hsr_common_pkg.msg import SoundEffectResult

from hsr_common_pkg.msg import SpeechRecAction
from hsr_common_pkg.msg import SpeechRecGoal
from hsr_common_pkg.msg import SpeechRecFeedback
from hsr_common_pkg.msg import SpeechRecResult

from std_msgs.msg import String
from std_msgs.msg import Bool
from std_msgs.msg import Int64
from std_msgs.msg import Float64
from std_msgs.msg import Float64MultiArray

from sensor_msgs.msg import Image
from sensor_msgs.msg import LaserScan
from sensor_msgs.msg import Joy

from nav_msgs.msg import Odometry

from geometry_msgs.msg import Twist
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Point
from geometry_msgs.msg import Quaternion

from tf.transformations import euler_from_quaternion
from tf.transformations import quaternion_from_euler

from sensor_msgs.msg import Image

from cv_bridge import CvBridge, CvBridgeError


#--------------------------------------------------
#ROS関係(import)
#--------------------------------------------------
import rospy
import rosbag

import tf

import smach
import smach_ros

import actionlib


#--------------------------------------------------
#システム関係(from import)
#--------------------------------------------------
from subprocess import call
from subprocess import Popen
from subprocess import PIPE


#--------------------------------------------------
#システム関係(import)
#--------------------------------------------------
import sys
import os
import termios
import tty
import select
import time
import datetime
import threading
import math
import re
import socket
import struct
import cv2


#--------------------------------------------------
#HSR関係(from import)
#--------------------------------------------------
from tmc_msgs.msg import TalkRequestAction
from tmc_msgs.msg import TalkRequestGoal
from tmc_msgs.msg import TalkRequestResult

from hsrb_interface import geometry


#--------------------------------------------------
#HSR関係(import)
#--------------------------------------------------
import hsrb_interface
