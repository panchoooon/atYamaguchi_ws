; Auto-generated. Do not edit!


(cl:in-package hsr_common_pkg-msg)


;//! \htmlinclude SpeechRecGoal.msg.html

(cl:defclass <SpeechRecGoal> (roslisp-msg-protocol:ros-message)
  ((speech_rec_goal
    :reader speech_rec_goal
    :initarg :speech_rec_goal
    :type cl:string
    :initform ""))
)

(cl:defclass SpeechRecGoal (<SpeechRecGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpeechRecGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpeechRecGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hsr_common_pkg-msg:<SpeechRecGoal> is deprecated: use hsr_common_pkg-msg:SpeechRecGoal instead.")))

(cl:ensure-generic-function 'speech_rec_goal-val :lambda-list '(m))
(cl:defmethod speech_rec_goal-val ((m <SpeechRecGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hsr_common_pkg-msg:speech_rec_goal-val is deprecated.  Use hsr_common_pkg-msg:speech_rec_goal instead.")
  (speech_rec_goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpeechRecGoal>) ostream)
  "Serializes a message object of type '<SpeechRecGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'speech_rec_goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'speech_rec_goal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpeechRecGoal>) istream)
  "Deserializes a message object of type '<SpeechRecGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speech_rec_goal) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'speech_rec_goal) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpeechRecGoal>)))
  "Returns string type for a message object of type '<SpeechRecGoal>"
  "hsr_common_pkg/SpeechRecGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpeechRecGoal)))
  "Returns string type for a message object of type 'SpeechRecGoal"
  "hsr_common_pkg/SpeechRecGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpeechRecGoal>)))
  "Returns md5sum for a message object of type '<SpeechRecGoal>"
  "8b6bf800318b350fcfba951224e46594")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpeechRecGoal)))
  "Returns md5sum for a message object of type 'SpeechRecGoal"
  "8b6bf800318b350fcfba951224e46594")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpeechRecGoal>)))
  "Returns full string definition for message of type '<SpeechRecGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string speech_rec_goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpeechRecGoal)))
  "Returns full string definition for message of type 'SpeechRecGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string speech_rec_goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpeechRecGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'speech_rec_goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpeechRecGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'SpeechRecGoal
    (cl:cons ':speech_rec_goal (speech_rec_goal msg))
))
