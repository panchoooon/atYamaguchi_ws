; Auto-generated. Do not edit!


(cl:in-package hsr_common_pkg-msg)


;//! \htmlinclude SpeechRecResult.msg.html

(cl:defclass <SpeechRecResult> (roslisp-msg-protocol:ros-message)
  ((speech_rec_result
    :reader speech_rec_result
    :initarg :speech_rec_result
    :type cl:string
    :initform ""))
)

(cl:defclass SpeechRecResult (<SpeechRecResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpeechRecResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpeechRecResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hsr_common_pkg-msg:<SpeechRecResult> is deprecated: use hsr_common_pkg-msg:SpeechRecResult instead.")))

(cl:ensure-generic-function 'speech_rec_result-val :lambda-list '(m))
(cl:defmethod speech_rec_result-val ((m <SpeechRecResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hsr_common_pkg-msg:speech_rec_result-val is deprecated.  Use hsr_common_pkg-msg:speech_rec_result instead.")
  (speech_rec_result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpeechRecResult>) ostream)
  "Serializes a message object of type '<SpeechRecResult>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'speech_rec_result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'speech_rec_result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpeechRecResult>) istream)
  "Deserializes a message object of type '<SpeechRecResult>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speech_rec_result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'speech_rec_result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpeechRecResult>)))
  "Returns string type for a message object of type '<SpeechRecResult>"
  "hsr_common_pkg/SpeechRecResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpeechRecResult)))
  "Returns string type for a message object of type 'SpeechRecResult"
  "hsr_common_pkg/SpeechRecResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpeechRecResult>)))
  "Returns md5sum for a message object of type '<SpeechRecResult>"
  "3eb279cc2d028658fce18c90636f4e20")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpeechRecResult)))
  "Returns md5sum for a message object of type 'SpeechRecResult"
  "3eb279cc2d028658fce18c90636f4e20")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpeechRecResult>)))
  "Returns full string definition for message of type '<SpeechRecResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string speech_rec_result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpeechRecResult)))
  "Returns full string definition for message of type 'SpeechRecResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%string speech_rec_result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpeechRecResult>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'speech_rec_result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpeechRecResult>))
  "Converts a ROS message object to a list"
  (cl:list 'SpeechRecResult
    (cl:cons ':speech_rec_result (speech_rec_result msg))
))
