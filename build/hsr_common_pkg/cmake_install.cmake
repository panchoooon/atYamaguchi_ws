# Install script for directory: /home/guest/athome_ws/src/hsr_common_pkg

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/guest/athome_ws/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/action" TYPE FILE FILES
    "/home/guest/athome_ws/src/hsr_common_pkg/action/ObjRec.action"
    "/home/guest/athome_ws/src/hsr_common_pkg/action/SoundEffect.action"
    "/home/guest/athome_ws/src/hsr_common_pkg/action/SpeechRec.action"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/msg" TYPE FILE FILES
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecAction.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionGoal.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionResult.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecActionFeedback.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecGoal.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecResult.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/ObjRecFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/msg" TYPE FILE FILES
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectAction.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionGoal.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionResult.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectActionFeedback.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectGoal.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectResult.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SoundEffectFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/msg" TYPE FILE FILES
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecAction.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionGoal.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionResult.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecActionFeedback.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecGoal.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecResult.msg"
    "/home/guest/athome_ws/devel/share/hsr_common_pkg/msg/SpeechRecFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/cmake" TYPE FILE FILES "/home/guest/athome_ws/build/hsr_common_pkg/catkin_generated/installspace/hsr_common_pkg-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/guest/athome_ws/devel/include/hsr_common_pkg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/guest/athome_ws/devel/share/common-lisp/ros/hsr_common_pkg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/guest/athome_ws/devel/lib/python2.7/dist-packages/hsr_common_pkg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/guest/athome_ws/devel/lib/python2.7/dist-packages/hsr_common_pkg")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/guest/athome_ws/build/hsr_common_pkg/catkin_generated/installspace/hsr_common_pkg.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/cmake" TYPE FILE FILES "/home/guest/athome_ws/build/hsr_common_pkg/catkin_generated/installspace/hsr_common_pkg-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg/cmake" TYPE FILE FILES
    "/home/guest/athome_ws/build/hsr_common_pkg/catkin_generated/installspace/hsr_common_pkgConfig.cmake"
    "/home/guest/athome_ws/build/hsr_common_pkg/catkin_generated/installspace/hsr_common_pkgConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hsr_common_pkg" TYPE FILE FILES "/home/guest/athome_ws/src/hsr_common_pkg/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

