; Auto-generated. Do not edit!


(cl:in-package hero_msgs-srv)


;//! \htmlinclude JudgeSysControl-request.msg.html

(cl:defclass <JudgeSysControl-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0)
   (robot_name
    :reader robot_name
    :initarg :robot_name
    :type cl:string
    :initform ""))
)

(cl:defclass JudgeSysControl-request (<JudgeSysControl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JudgeSysControl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JudgeSysControl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<JudgeSysControl-request> is deprecated: use hero_msgs-srv:JudgeSysControl-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <JudgeSysControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:command-val is deprecated.  Use hero_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'robot_name-val :lambda-list '(m))
(cl:defmethod robot_name-val ((m <JudgeSysControl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:robot_name-val is deprecated.  Use hero_msgs-srv:robot_name instead.")
  (robot_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JudgeSysControl-request>) ostream)
  "Serializes a message object of type '<JudgeSysControl-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JudgeSysControl-request>) istream)
  "Deserializes a message object of type '<JudgeSysControl-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JudgeSysControl-request>)))
  "Returns string type for a service object of type '<JudgeSysControl-request>"
  "hero_msgs/JudgeSysControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JudgeSysControl-request)))
  "Returns string type for a service object of type 'JudgeSysControl-request"
  "hero_msgs/JudgeSysControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JudgeSysControl-request>)))
  "Returns md5sum for a message object of type '<JudgeSysControl-request>"
  "88842955bcbf0eaf028f22a76f978663")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JudgeSysControl-request)))
  "Returns md5sum for a message object of type 'JudgeSysControl-request"
  "88842955bcbf0eaf028f22a76f978663")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JudgeSysControl-request>)))
  "Returns full string definition for message of type '<JudgeSysControl-request>"
  (cl:format cl:nil "int32 command~%string robot_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JudgeSysControl-request)))
  "Returns full string definition for message of type 'JudgeSysControl-request"
  (cl:format cl:nil "int32 command~%string robot_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JudgeSysControl-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'robot_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JudgeSysControl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'JudgeSysControl-request
    (cl:cons ':command (command msg))
    (cl:cons ':robot_name (robot_name msg))
))
;//! \htmlinclude JudgeSysControl-response.msg.html

(cl:defclass <JudgeSysControl-response> (roslisp-msg-protocol:ros-message)
  ((error_code
    :reader error_code
    :initarg :error_code
    :type cl:integer
    :initform 0))
)

(cl:defclass JudgeSysControl-response (<JudgeSysControl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JudgeSysControl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JudgeSysControl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<JudgeSysControl-response> is deprecated: use hero_msgs-srv:JudgeSysControl-response instead.")))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <JudgeSysControl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:error_code-val is deprecated.  Use hero_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JudgeSysControl-response>) ostream)
  "Serializes a message object of type '<JudgeSysControl-response>"
  (cl:let* ((signed (cl:slot-value msg 'error_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JudgeSysControl-response>) istream)
  "Deserializes a message object of type '<JudgeSysControl-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JudgeSysControl-response>)))
  "Returns string type for a service object of type '<JudgeSysControl-response>"
  "hero_msgs/JudgeSysControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JudgeSysControl-response)))
  "Returns string type for a service object of type 'JudgeSysControl-response"
  "hero_msgs/JudgeSysControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JudgeSysControl-response>)))
  "Returns md5sum for a message object of type '<JudgeSysControl-response>"
  "88842955bcbf0eaf028f22a76f978663")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JudgeSysControl-response)))
  "Returns md5sum for a message object of type 'JudgeSysControl-response"
  "88842955bcbf0eaf028f22a76f978663")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JudgeSysControl-response>)))
  "Returns full string definition for message of type '<JudgeSysControl-response>"
  (cl:format cl:nil "int32 error_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JudgeSysControl-response)))
  "Returns full string definition for message of type 'JudgeSysControl-response"
  (cl:format cl:nil "int32 error_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JudgeSysControl-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JudgeSysControl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'JudgeSysControl-response
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'JudgeSysControl)))
  'JudgeSysControl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'JudgeSysControl)))
  'JudgeSysControl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JudgeSysControl)))
  "Returns string type for a service object of type '<JudgeSysControl>"
  "hero_msgs/JudgeSysControl")