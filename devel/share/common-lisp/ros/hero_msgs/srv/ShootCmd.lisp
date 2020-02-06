; Auto-generated. Do not edit!


(cl:in-package hero_msgs-srv)


;//! \htmlinclude ShootCmd-request.msg.html

(cl:defclass <ShootCmd-request> (roslisp-msg-protocol:ros-message)
  ((robot_num
    :reader robot_num
    :initarg :robot_num
    :type cl:string
    :initform "")
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (number
    :reader number
    :initarg :number
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ShootCmd-request (<ShootCmd-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShootCmd-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShootCmd-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<ShootCmd-request> is deprecated: use hero_msgs-srv:ShootCmd-request instead.")))

(cl:ensure-generic-function 'robot_num-val :lambda-list '(m))
(cl:defmethod robot_num-val ((m <ShootCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:robot_num-val is deprecated.  Use hero_msgs-srv:robot_num instead.")
  (robot_num m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <ShootCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:mode-val is deprecated.  Use hero_msgs-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'number-val :lambda-list '(m))
(cl:defmethod number-val ((m <ShootCmd-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:number-val is deprecated.  Use hero_msgs-srv:number instead.")
  (number m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ShootCmd-request>)))
    "Constants for message type '<ShootCmd-request>"
  '((:STOP . 0)
    (:ONCE . 1)
    (:CONTINUOUS . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ShootCmd-request)))
    "Constants for message type 'ShootCmd-request"
  '((:STOP . 0)
    (:ONCE . 1)
    (:CONTINUOUS . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShootCmd-request>) ostream)
  "Serializes a message object of type '<ShootCmd-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_num))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_num))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShootCmd-request>) istream)
  "Deserializes a message object of type '<ShootCmd-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_num) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_num) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'number)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShootCmd-request>)))
  "Returns string type for a service object of type '<ShootCmd-request>"
  "hero_msgs/ShootCmdRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShootCmd-request)))
  "Returns string type for a service object of type 'ShootCmd-request"
  "hero_msgs/ShootCmdRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShootCmd-request>)))
  "Returns md5sum for a message object of type '<ShootCmd-request>"
  "4adbabcc97afbd3e618602740ecc0659")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShootCmd-request)))
  "Returns md5sum for a message object of type 'ShootCmd-request"
  "4adbabcc97afbd3e618602740ecc0659")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShootCmd-request>)))
  "Returns full string definition for message of type '<ShootCmd-request>"
  (cl:format cl:nil "uint8 STOP = 0~%uint8 ONCE = 1~%uint8 CONTINUOUS = 2~%string robot_num~%uint8 mode~%uint8 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShootCmd-request)))
  "Returns full string definition for message of type 'ShootCmd-request"
  (cl:format cl:nil "uint8 STOP = 0~%uint8 ONCE = 1~%uint8 CONTINUOUS = 2~%string robot_num~%uint8 mode~%uint8 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShootCmd-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robot_num))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShootCmd-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ShootCmd-request
    (cl:cons ':robot_num (robot_num msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':number (number msg))
))
;//! \htmlinclude ShootCmd-response.msg.html

(cl:defclass <ShootCmd-response> (roslisp-msg-protocol:ros-message)
  ((received
    :reader received
    :initarg :received
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ShootCmd-response (<ShootCmd-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ShootCmd-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ShootCmd-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<ShootCmd-response> is deprecated: use hero_msgs-srv:ShootCmd-response instead.")))

(cl:ensure-generic-function 'received-val :lambda-list '(m))
(cl:defmethod received-val ((m <ShootCmd-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:received-val is deprecated.  Use hero_msgs-srv:received instead.")
  (received m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ShootCmd-response>) ostream)
  "Serializes a message object of type '<ShootCmd-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'received) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ShootCmd-response>) istream)
  "Deserializes a message object of type '<ShootCmd-response>"
    (cl:setf (cl:slot-value msg 'received) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ShootCmd-response>)))
  "Returns string type for a service object of type '<ShootCmd-response>"
  "hero_msgs/ShootCmdResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShootCmd-response)))
  "Returns string type for a service object of type 'ShootCmd-response"
  "hero_msgs/ShootCmdResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ShootCmd-response>)))
  "Returns md5sum for a message object of type '<ShootCmd-response>"
  "4adbabcc97afbd3e618602740ecc0659")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ShootCmd-response)))
  "Returns md5sum for a message object of type 'ShootCmd-response"
  "4adbabcc97afbd3e618602740ecc0659")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ShootCmd-response>)))
  "Returns full string definition for message of type '<ShootCmd-response>"
  (cl:format cl:nil "bool received~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ShootCmd-response)))
  "Returns full string definition for message of type 'ShootCmd-response"
  (cl:format cl:nil "bool received~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ShootCmd-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ShootCmd-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ShootCmd-response
    (cl:cons ':received (received msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ShootCmd)))
  'ShootCmd-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ShootCmd)))
  'ShootCmd-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ShootCmd)))
  "Returns string type for a service object of type '<ShootCmd>"
  "hero_msgs/ShootCmd")