#!/usr/bin/env python
# -*- coding: utf-8 -*-


#--------------------------------------------------
#共通パラメータ
#
#author: Yutaro ISHIDA
#--------------------------------------------------


import sys
import roslib
sys.path.append(roslib.packages.get_pkg_dir('hsr_common_pkg') + '/scripts')

from common_import import *


#--------------------------------------------------
#デバッグ
#--------------------------------------------------
rospy.set_param('/param/dbg/sm/all', 0) #bool    

#選択されたデバッグモードを使う
if rospy.get_param('/param/dbg/sm/all') == 0:
    rospy.set_param('/param/dbg/sm/flow', 0) #bool 全ての機能なしでsmを流す
    rospy.set_param('/param/dbg/sm/stepin', 0) #bool ステートごとにキー入力を促す
    rospy.set_param('/param/dbg/sm/stepout', 0) #bool ステートごとにキー入力を促す
    rospy.set_param('/param/dbg/speech/onlyspeech', 0) #bool 音声認識のみのデバッグ
    rospy.set_param('/param/dbg/speech/ssynlog', 0) #bool 音声合成の文章をデバッグ表示
else:
    #else以下は触らない
    rospy.set_param('/param/dbg/sm/flow', 1) #bool
    rospy.set_param('/param/dbg/sm/stepin', 1) #bool ステートごとにキー入力を促す
    rospy.set_param('/param/dbg/sm/stepout', 1) #bool ステートごとにキー入力を促す
    rospy.set_param('/param/dbg/speech/onlyspeech', 1) #bool 音声認識のみのデバッグ
    rospy.set_param('/param/dbg/speech/ssynlog', 1) #bool 音声合成の文章をデバッグ表示


#--------------------------------------------------
#物体認識対象id
#--------------------------------------------------
rospy.set_param('/param/op/obj/rec/target/id', 0) #unsigned int


#--------------------------------------------------
#把持対象座標
#--------------------------------------------------
rospy.set_param('/param/ctrl/arm/grasp/target/id', 0) #int
rospy.set_param('/param/ctrl/arm/grasp/target/pos/x', 0.0) #double
rospy.set_param('/param/ctrl/arm/grasp/target/pos/y', 0.0) #double
rospy.set_param('/param/ctrl/arm/grasp/target/pos/z', 0.0) #double


#--------------------------------------------------
#オブジェクトのDB
#--------------------------------------------------
rospy.set_param('/param/db/obj',
[
{'id':1, 'name_j':'グリーンティ', 'name_e':'Green tea', 'class':'drink', 'dir':'v'},
{'id':2, 'name_j':'カフェオレ', 'name_e':'Cafe au lait', 'class':'drink', 'dir':'v'},
{'id':3, 'name_j':'アイスティ', 'name_e':'Iced tea', 'class':'drink', 'dir':'v'},
{'id':4, 'name_j':'オレンジジュース', 'name_e':'Orange juice', 'class':'drink', 'dir':'v'},
{'id':5, 'name_j':'ストロベリージュース', 'name_e':'Strawberry juice', 'class':'drink', 'dir':'v'},
{'id':6, 'name_j':'ポテトチップス', 'name_e':'Potato chips', 'class':'snack', 'dir':'v'},
{'id':7, 'name_j':'クッキー', 'name_e':'Cookie', 'class':'snack', 'dir':'v'},
{'id':8, 'name_j':'クッキー', 'name_e':'Cookie', 'class':'snack', 'dir':'h'},
{'id':9, 'name_j':'ポテトスティック', 'name_e':'Potato stick', 'class':'snack', 'dir':'v'},
{'id':10, 'name_j':'ポタージュスープ', 'name_e':'Potage soup', 'class':'soup', 'dir':'v'},
{'id':11, 'name_j':'エッグスープ', 'name_e':'Egg soup', 'class':'soup', 'dir':'v'},
]
)

#cpp用
rospy.set_param('/param/db/cpp/obj/name_j', []) #string
rospy.set_param('/param/db/cpp/obj/name_e', []) #string
