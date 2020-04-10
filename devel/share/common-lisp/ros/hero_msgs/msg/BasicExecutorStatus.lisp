; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude BasicExecutorStatus.msg.html

(cl:defclass <BasicExecutorStatus> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0)
   (saying
    :reader saying
    :initarg :saying
    :type cl:string
    :initform "")
   (robot_name
    :reader robot_name
    :initarg :robot_name
    :type cl:string
    :initform "")
   (target_name
    :reader target_name
    :initarg :target_name
    :type cl:string
    :initform "")
   (move_x
    :reader move_x
    :initarg :move_x
    :type cl:float
    :initform 0.0)
   (move_y
    :reader move_y
    :initarg :move_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass BasicExecutorStatus (<BasicExecutorStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicExecutorStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicExecutorStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<BasicExecutorStatus> is deprecated: use hero_msgs-msg:BasicExecutorStatus instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <BasicExecutorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:state-val is deprecated.  Use hero_msgs-msg:state instead.")
  (state m))

(cl:ensure-generic-function 'saying-val :lambda-list '(m))
(cl:defmethod saying-val ((m <BasicExecutorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:saying-val is deprecated.  Use hero_msgs-msg:saying instead.")
  (saying m))

(cl:ensure-generic-function 'robot_name-val :lambda-list '(m))
(cl:defmethod robot_name-val ((m <BasicExecutorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:robot_name-val is deprecated.  Use hero_msgs-msg:robot_name instead.")
  (robot_name m))

(cl:ensure-generic-function 'target_name-val :lambda-list '(m))
(cl:defmethod target_name-val ((m <BasicExecutorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:target_name-val is deprecated.  Use hero_msgs-msg:target_name instead.")
  (target_name m))

(cl:ensure-generic-function 'move_x-val :lambda-list '(m))
(cl:defmethod move_x-val ((m <BasicExecutorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:move_x-val is deprecated.  Use hero_msgs-msg:move_x instead.")
  (move_x m))

(cl:ensure-generic-function 'move_y-val :lambda-list '(m))
(cl:defmethod move_y-val ((m <BasicExecutorStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:move_y-val is deprecated.  Use hero_msgs-msg:move_y instead.")
  (move_y m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BasicExecutorStatus>)))
    "Constants for message type '<BasicExecutorStatus>"
  '((:MOVE_TO_POSITION . 1)
    (:ATTACK_ROBOT . 2)
    (:IDLE . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BasicExecutorStatus)))
    "Constants for message type 'BasicExecutorStatus"
  '((:MOVE_TO_POSITION . 1)
    (:ATTACK_ROBOT . 2)
    (:IDLE . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicExecutorStatus>) ostream)
  "Serializes a message object of type '<BasicExecutorStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'saying))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'saying))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'target_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'target_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'move_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'move_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicExecutorStatus>) istream)
  "Deserializes a message object of type '<BasicExecutorStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'saying) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'saying) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'target_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'target_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'move_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'move_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicExecutorStatus>)))
  "Returns string type for a message object of type '<BasicExecutorStatus>"
  "hero_msgs/BasicExecutorStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicExecutorStatus)))
  "Returns string type for a message object of type 'BasicExecutorStatus"
  "hero_msgs/BasicExecutorStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicExecutorStatus>)))
  "Returns md5sum for a message object of type '<BasicExecutorStatus>"
  "6355e6033a487f335fe4d99196ec3f6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicExecutorStatus)))
  "Returns md5sum for a message object of type 'BasicExecutorStatus"
  "6355e6033a487f335fe4d99196ec3f6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicExecutorStatus>)))
  "Returns full string definition for message of type '<BasicExecutorStatus>"
  (cl:format cl:nil "uint8 MOVE_TO_POSITION = 1~%uint8 ATTACK_ROBOT = 2~%uint8 IDLE = 3~%uint8 state~%string saying~%string robot_name~%string target_name~%float64 move_x~%float64 move_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicExecutorStatus)))
  "Returns full string definition for message of type 'BasicExecutorStatus"
  (cl:format cl:nil "uint8 MOVE_TO_POSITION = 1~%uint8 ATTACK_ROBOT = 2~%uint8 IDLE = 3~%uint8 state~%string saying~%string robot_name~%string target_name~%float64 move_x~%float64 move_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicExecutorStatus>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'saying))
     4 (cl:length (cl:slot-value msg 'robot_name))
     4 (cl:length (cl:slot-value msg 'target_name))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicExecutorStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicExecutorStatus
    (cl:cons ':state (state msg))
    (cl:cons ':saying (saying msg))
    (cl:cons ':robot_name (robot_name msg))
    (cl:cons ':target_name (target_name msg))
    (cl:cons ':move_x (move_x msg))
    (cl:cons ':move_y (move_y msg))
))
