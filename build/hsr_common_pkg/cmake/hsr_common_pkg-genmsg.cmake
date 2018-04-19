# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "hsr_common_pkg: 21 messages, 0 services")

set(MSG_I_FLAGS "-Ihsr_common_pkg:/home/guest/athome_ws/devel/share/hsr_common_pkg/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/indigo/share/actionlib_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(hsr_common_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg" "std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/SoundEffectResult"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg" "hsr_common_pkg/SoundEffectResult:hsr_common_pkg/SoundEffectGoal:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:hsr_common_pkg/SoundEffectActionFeedback:hsr_common_pkg/SoundEffectFeedback:std_msgs/Header:hsr_common_pkg/SoundEffectActionGoal:hsr_common_pkg/SoundEffectActionResult"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/ObjRecFeedback"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/SpeechRecFeedback"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/ObjRecResult"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/SpeechRecGoal"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg" "hsr_common_pkg/ObjRecGoal:actionlib_msgs/GoalID:std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg" "actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/SoundEffectFeedback"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg" "hsr_common_pkg/SpeechRecResult:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:std_msgs/Header"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg" "hsr_common_pkg/ObjRecResult:actionlib_msgs/GoalStatus:actionlib_msgs/GoalID:hsr_common_pkg/ObjRecFeedback:std_msgs/Header:hsr_common_pkg/ObjRecActionGoal:sensor_msgs/Image:hsr_common_pkg/ObjRecGoal:hsr_common_pkg/ObjRecActionFeedback:hsr_common_pkg/ObjRecActionResult"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg" "actionlib_msgs/GoalID:std_msgs/Header:hsr_common_pkg/SoundEffectGoal"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg" "hsr_common_pkg/SpeechRecResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus:hsr_common_pkg/SpeechRecActionGoal:hsr_common_pkg/SpeechRecFeedback:hsr_common_pkg/SpeechRecActionFeedback:std_msgs/Header:hsr_common_pkg/SpeechRecGoal:hsr_common_pkg/SpeechRecActionResult"
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg" ""
)

get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg" NAME_WE)
add_custom_target(_hsr_common_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "hsr_common_pkg" "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_cpp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
)

### Generating Services

### Generating Module File
_generate_module_cpp(hsr_common_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(hsr_common_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(hsr_common_pkg_generate_messages hsr_common_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_cpp _hsr_common_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hsr_common_pkg_gencpp)
add_dependencies(hsr_common_pkg_gencpp hsr_common_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hsr_common_pkg_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_lisp(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
)

### Generating Services

### Generating Module File
_generate_module_lisp(hsr_common_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(hsr_common_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(hsr_common_pkg_generate_messages hsr_common_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_lisp _hsr_common_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hsr_common_pkg_genlisp)
add_dependencies(hsr_common_pkg_genlisp hsr_common_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hsr_common_pkg_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg"
  "${MSG_I_FLAGS}"
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalStatus.msg;/opt/ros/indigo/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)
_generate_msg_py(hsr_common_pkg
  "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
)

### Generating Services

### Generating Module File
_generate_module_py(hsr_common_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(hsr_common_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(hsr_common_pkg_generate_messages hsr_common_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg" NAME_WE)
add_dependencies(hsr_common_pkg_generate_messages_py _hsr_common_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(hsr_common_pkg_genpy)
add_dependencies(hsr_common_pkg_genpy hsr_common_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS hsr_common_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/hsr_common_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(hsr_common_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(hsr_common_pkg_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(hsr_common_pkg_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/hsr_common_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(hsr_common_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(hsr_common_pkg_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(hsr_common_pkg_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/hsr_common_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(hsr_common_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(hsr_common_pkg_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(hsr_common_pkg_generate_messages_py sensor_msgs_generate_messages_py)
endif()
