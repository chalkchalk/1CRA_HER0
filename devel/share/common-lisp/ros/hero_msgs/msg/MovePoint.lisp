; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude MovePoint.msg.html

(cl:defclass <MovePoint> (roslisp-msg-protocol:ros-message)
  ((target_x
    :reader target_x
    :initarg :target_x
    :type cl:float
    :initform 0.0)
   (target_y
    :reader target_y
    :initarg :target_y
    :type cl:float
    :initform 0.0)
   (cmd_code
    :reader cmd_code
    :initarg :cmd_code
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MovePoint (<MovePoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<MovePoint> is deprecated: use hero_msgs-msg:MovePoint instead.")))

(cl:ensure-generic-function 'target_x-val :lambda-list '(m))
(cl:defmethod target_x-val ((m <MovePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:target_x-val is deprecated.  Use hero_msgs-msg:target_x instead.")
  (target_x m))

(cl:ensure-generic-function 'target_y-val :lambda-list '(m))
(cl:defmethod target_y-val ((m <MovePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:target_y-val is deprecated.  Use hero_msgs-msg:target_y instead.")
  (target_y m))

(cl:ensure-generic-function 'cmd_code-val :lambda-list '(m))
(cl:defmethod cmd_code-val ((m <MovePoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:cmd_code-val is deprecated.  Use hero_msgs-msg:cmd_code instead.")
  (cmd_code m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MovePoint>)))
    "Constants for message type '<MovePoint>"
  '((:MOVE . 0)
    (:CANCEL . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MovePoint)))
    "Constants for message type 'MovePoint"
  '((:MOVE . 0)
    (:CANCEL . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePoint>) ostream)
  "Serializes a message object of type '<MovePoint>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'target_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'target_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePoint>) istream)
  "Deserializes a message object of type '<MovePoint>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cmd_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePoint>)))
  "Returns string type for a message object of type '<MovePoint>"
  "hero_msgs/MovePoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePoint)))
  "Returns string type for a message object of type 'MovePoint"
  "hero_msgs/MovePoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePoint>)))
  "Returns md5sum for a message object of type '<MovePoint>"
  "8332454d4f4776c0538a4b89b1467de8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePoint)))
  "Returns md5sum for a message object of type 'MovePoint"
  "8332454d4f4776c0538a4b89b1467de8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePoint>)))
  "Returns full string definition for message of type '<MovePoint>"
  (cl:format cl:nil "float64 target_x~%float64 target_y~%uint8 cmd_code~%uint8 MOVE = 0~%uint8 CANCEL = 1~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePoint)))
  "Returns full string definition for message of type 'MovePoint"
  (cl:format cl:nil "float64 target_x~%float64 target_y~%uint8 cmd_code~%uint8 MOVE = 0~%uint8 CANCEL = 1~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePoint>))
  (cl:+ 0
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePoint>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePoint
    (cl:cons ':target_x (target_x msg))
    (cl:cons ':target_y (target_y msg))
    (cl:cons ':cmd_code (cmd_code msg))
))
