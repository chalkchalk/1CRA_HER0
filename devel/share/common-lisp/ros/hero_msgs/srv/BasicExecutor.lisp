; Auto-generated. Do not edit!


(cl:in-package hero_msgs-srv)


;//! \htmlinclude BasicExecutor-request.msg.html

(cl:defclass <BasicExecutor-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0)
   (robot_name
    :reader robot_name
    :initarg :robot_name
    :type cl:string
    :initform "")
   (yaw_control
    :reader yaw_control
    :initarg :yaw_control
    :type cl:boolean
    :initform cl:nil)
   (position_x
    :reader position_x
    :initarg :position_x
    :type cl:float
    :initform 0.0)
   (position_y
    :reader position_y
    :initarg :position_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass BasicExecutor-request (<BasicExecutor-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicExecutor-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicExecutor-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<BasicExecutor-request> is deprecated: use hero_msgs-srv:BasicExecutor-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <BasicExecutor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:command-val is deprecated.  Use hero_msgs-srv:command instead.")
  (command m))

(cl:ensure-generic-function 'robot_name-val :lambda-list '(m))
(cl:defmethod robot_name-val ((m <BasicExecutor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:robot_name-val is deprecated.  Use hero_msgs-srv:robot_name instead.")
  (robot_name m))

(cl:ensure-generic-function 'yaw_control-val :lambda-list '(m))
(cl:defmethod yaw_control-val ((m <BasicExecutor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:yaw_control-val is deprecated.  Use hero_msgs-srv:yaw_control instead.")
  (yaw_control m))

(cl:ensure-generic-function 'position_x-val :lambda-list '(m))
(cl:defmethod position_x-val ((m <BasicExecutor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:position_x-val is deprecated.  Use hero_msgs-srv:position_x instead.")
  (position_x m))

(cl:ensure-generic-function 'position_y-val :lambda-list '(m))
(cl:defmethod position_y-val ((m <BasicExecutor-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:position_y-val is deprecated.  Use hero_msgs-srv:position_y instead.")
  (position_y m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BasicExecutor-request>)))
    "Constants for message type '<BasicExecutor-request>"
  '((:MOVE_TO_POSITION . 1)
    (:ATTACK_ROBOT . 2)
    (:HALT . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BasicExecutor-request)))
    "Constants for message type 'BasicExecutor-request"
  '((:MOVE_TO_POSITION . 1)
    (:ATTACK_ROBOT . 2)
    (:HALT . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicExecutor-request>) ostream)
  "Serializes a message object of type '<BasicExecutor-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'yaw_control) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'position_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicExecutor-request>) istream)
  "Deserializes a message object of type '<BasicExecutor-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'command)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'yaw_control) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'position_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicExecutor-request>)))
  "Returns string type for a service object of type '<BasicExecutor-request>"
  "hero_msgs/BasicExecutorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicExecutor-request)))
  "Returns string type for a service object of type 'BasicExecutor-request"
  "hero_msgs/BasicExecutorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicExecutor-request>)))
  "Returns md5sum for a message object of type '<BasicExecutor-request>"
  "3c53e40ff8af1a43835b3d7ab9ff6623")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicExecutor-request)))
  "Returns md5sum for a message object of type 'BasicExecutor-request"
  "3c53e40ff8af1a43835b3d7ab9ff6623")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicExecutor-request>)))
  "Returns full string definition for message of type '<BasicExecutor-request>"
  (cl:format cl:nil "uint8 MOVE_TO_POSITION = 1~%uint8 ATTACK_ROBOT = 2~%uint8 HALT = 3~%uint8 command~%string robot_name~%bool yaw_control~%float64 position_x~%float64 position_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicExecutor-request)))
  "Returns full string definition for message of type 'BasicExecutor-request"
  (cl:format cl:nil "uint8 MOVE_TO_POSITION = 1~%uint8 ATTACK_ROBOT = 2~%uint8 HALT = 3~%uint8 command~%string robot_name~%bool yaw_control~%float64 position_x~%float64 position_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicExecutor-request>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'robot_name))
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicExecutor-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicExecutor-request
    (cl:cons ':command (command msg))
    (cl:cons ':robot_name (robot_name msg))
    (cl:cons ':yaw_control (yaw_control msg))
    (cl:cons ':position_x (position_x msg))
    (cl:cons ':position_y (position_y msg))
))
;//! \htmlinclude BasicExecutor-response.msg.html

(cl:defclass <BasicExecutor-response> (roslisp-msg-protocol:ros-message)
  ((error_code
    :reader error_code
    :initarg :error_code
    :type cl:fixnum
    :initform 0))
)

(cl:defclass BasicExecutor-response (<BasicExecutor-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicExecutor-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicExecutor-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-srv:<BasicExecutor-response> is deprecated: use hero_msgs-srv:BasicExecutor-response instead.")))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <BasicExecutor-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-srv:error_code-val is deprecated.  Use hero_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<BasicExecutor-response>)))
    "Constants for message type '<BasicExecutor-response>"
  '((:OK . 100)
    (:I_AM_DEAD . 101)
    (:OUT_OF_AMMO . 102)
    (:TARGET_IS_DEAD . 103))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'BasicExecutor-response)))
    "Constants for message type 'BasicExecutor-response"
  '((:OK . 100)
    (:I_AM_DEAD . 101)
    (:OUT_OF_AMMO . 102)
    (:TARGET_IS_DEAD . 103))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicExecutor-response>) ostream)
  "Serializes a message object of type '<BasicExecutor-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicExecutor-response>) istream)
  "Deserializes a message object of type '<BasicExecutor-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicExecutor-response>)))
  "Returns string type for a service object of type '<BasicExecutor-response>"
  "hero_msgs/BasicExecutorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicExecutor-response)))
  "Returns string type for a service object of type 'BasicExecutor-response"
  "hero_msgs/BasicExecutorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicExecutor-response>)))
  "Returns md5sum for a message object of type '<BasicExecutor-response>"
  "3c53e40ff8af1a43835b3d7ab9ff6623")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicExecutor-response)))
  "Returns md5sum for a message object of type 'BasicExecutor-response"
  "3c53e40ff8af1a43835b3d7ab9ff6623")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicExecutor-response>)))
  "Returns full string definition for message of type '<BasicExecutor-response>"
  (cl:format cl:nil "uint8 OK = 100~%uint8 I_AM_DEAD = 101~%uint8 OUT_OF_AMMO = 102~%uint8 TARGET_IS_DEAD = 103~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicExecutor-response)))
  "Returns full string definition for message of type 'BasicExecutor-response"
  (cl:format cl:nil "uint8 OK = 100~%uint8 I_AM_DEAD = 101~%uint8 OUT_OF_AMMO = 102~%uint8 TARGET_IS_DEAD = 103~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicExecutor-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicExecutor-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicExecutor-response
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BasicExecutor)))
  'BasicExecutor-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BasicExecutor)))
  'BasicExecutor-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicExecutor)))
  "Returns string type for a service object of type '<BasicExecutor>"
  "hero_msgs/BasicExecutor")