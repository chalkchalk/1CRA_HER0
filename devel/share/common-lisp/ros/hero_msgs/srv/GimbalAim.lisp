; Auto-generated. Do not edit!


(cl:in-package hero_msgs-srv)


;//! \htmlinclude GimbalAim-request.msg.html

(cl:defclass <GimbalAim-request> (roslisp-msg-protocol:ros-message)
  ((set_angle_absolute
    :reader set_angle_absolute
    :initarg :set_angle_absolute
    :type cl:float
    :initform 0.0))
)

(cl:defclass GimbalAim-request (<GimbalAim-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalAim-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalAim-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<GimbalAim-request> is deprecated: use hero_msgs-srv:GimbalAim-request instead.")))

(cl:ensure-generic-function 'set_angle_absolute-val :lambda-list '(m))
(cl:defmethod set_angle_absolute-val ((m <GimbalAim-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:set_angle_absolute-val is deprecated.  Use hero_msgs-srv:set_angle_absolute instead.")
  (set_angle_absolute m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalAim-request>) ostream)
  "Serializes a message object of type '<GimbalAim-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'set_angle_absolute))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalAim-request>) istream)
  "Deserializes a message object of type '<GimbalAim-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_angle_absolute) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalAim-request>)))
  "Returns string type for a service object of type '<GimbalAim-request>"
  "hero_msgs/GimbalAimRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalAim-request)))
  "Returns string type for a service object of type 'GimbalAim-request"
  "hero_msgs/GimbalAimRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalAim-request>)))
  "Returns md5sum for a message object of type '<GimbalAim-request>"
  "092644b5ad06ae027152ed41585220f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalAim-request)))
  "Returns md5sum for a message object of type 'GimbalAim-request"
  "092644b5ad06ae027152ed41585220f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalAim-request>)))
  "Returns full string definition for message of type '<GimbalAim-request>"
  (cl:format cl:nil "float64 set_angle_absolute~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalAim-request)))
  "Returns full string definition for message of type 'GimbalAim-request"
  (cl:format cl:nil "float64 set_angle_absolute~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalAim-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalAim-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalAim-request
    (cl:cons ':set_angle_absolute (set_angle_absolute msg))
))
;//! \htmlinclude GimbalAim-response.msg.html

(cl:defclass <GimbalAim-response> (roslisp-msg-protocol:ros-message)
  ((aimed
    :reader aimed
    :initarg :aimed
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GimbalAim-response (<GimbalAim-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GimbalAim-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GimbalAim-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<GimbalAim-response> is deprecated: use hero_msgs-srv:GimbalAim-response instead.")))

(cl:ensure-generic-function 'aimed-val :lambda-list '(m))
(cl:defmethod aimed-val ((m <GimbalAim-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:aimed-val is deprecated.  Use hero_msgs-srv:aimed instead.")
  (aimed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GimbalAim-response>) ostream)
  "Serializes a message object of type '<GimbalAim-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'aimed) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GimbalAim-response>) istream)
  "Deserializes a message object of type '<GimbalAim-response>"
    (cl:setf (cl:slot-value msg 'aimed) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GimbalAim-response>)))
  "Returns string type for a service object of type '<GimbalAim-response>"
  "hero_msgs/GimbalAimResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalAim-response)))
  "Returns string type for a service object of type 'GimbalAim-response"
  "hero_msgs/GimbalAimResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GimbalAim-response>)))
  "Returns md5sum for a message object of type '<GimbalAim-response>"
  "092644b5ad06ae027152ed41585220f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GimbalAim-response)))
  "Returns md5sum for a message object of type 'GimbalAim-response"
  "092644b5ad06ae027152ed41585220f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GimbalAim-response>)))
  "Returns full string definition for message of type '<GimbalAim-response>"
  (cl:format cl:nil "bool aimed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GimbalAim-response)))
  "Returns full string definition for message of type 'GimbalAim-response"
  (cl:format cl:nil "bool aimed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GimbalAim-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GimbalAim-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GimbalAim-response
    (cl:cons ':aimed (aimed msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GimbalAim)))
  'GimbalAim-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GimbalAim)))
  'GimbalAim-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GimbalAim)))
  "Returns string type for a service object of type '<GimbalAim>"
  "hero_msgs/GimbalAim")