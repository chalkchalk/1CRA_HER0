; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude RobotPosition.msg.html

(cl:defclass <RobotPosition> (roslisp-msg-protocol:ros-message)
  ((robot_name
    :reader robot_name
    :initarg :robot_name
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type hero_msgs-msg:Position
    :initform (cl:make-instance 'hero_msgs-msg:Position))
   (armor_plates
    :reader armor_plates
    :initarg :armor_plates
    :type (cl:vector hero_msgs-msg:Position)
   :initform (cl:make-array 4 :element-type 'hero_msgs-msg:Position :initial-element (cl:make-instance 'hero_msgs-msg:Position)))
   (health
    :reader health
    :initarg :health
    :type cl:integer
    :initform 0)
   (ammo
    :reader ammo
    :initarg :ammo
    :type cl:integer
    :initform 0))
)

(cl:defclass RobotPosition (<RobotPosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotPosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotPosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<RobotPosition> is deprecated: use hero_msgs-msg:RobotPosition instead.")))

(cl:ensure-generic-function 'robot_name-val :lambda-list '(m))
(cl:defmethod robot_name-val ((m <RobotPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:robot_name-val is deprecated.  Use hero_msgs-msg:robot_name instead.")
  (robot_name m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <RobotPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:position-val is deprecated.  Use hero_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'armor_plates-val :lambda-list '(m))
(cl:defmethod armor_plates-val ((m <RobotPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:armor_plates-val is deprecated.  Use hero_msgs-msg:armor_plates instead.")
  (armor_plates m))

(cl:ensure-generic-function 'health-val :lambda-list '(m))
(cl:defmethod health-val ((m <RobotPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:health-val is deprecated.  Use hero_msgs-msg:health instead.")
  (health m))

(cl:ensure-generic-function 'ammo-val :lambda-list '(m))
(cl:defmethod ammo-val ((m <RobotPosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:ammo-val is deprecated.  Use hero_msgs-msg:ammo instead.")
  (ammo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotPosition>) ostream)
  "Serializes a message object of type '<RobotPosition>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_name))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'armor_plates))
  (cl:let* ((signed (cl:slot-value msg 'health)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'ammo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotPosition>) istream)
  "Deserializes a message object of type '<RobotPosition>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (cl:setf (cl:slot-value msg 'armor_plates) (cl:make-array 4))
  (cl:let ((vals (cl:slot-value msg 'armor_plates)))
    (cl:dotimes (i 4)
    (cl:setf (cl:aref vals i) (cl:make-instance 'hero_msgs-msg:Position))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'health) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ammo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotPosition>)))
  "Returns string type for a message object of type '<RobotPosition>"
  "hero_msgs/RobotPosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotPosition)))
  "Returns string type for a message object of type 'RobotPosition"
  "hero_msgs/RobotPosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotPosition>)))
  "Returns md5sum for a message object of type '<RobotPosition>"
  "7d821070cef65bd1dbcfa6be273d43f8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotPosition)))
  "Returns md5sum for a message object of type 'RobotPosition"
  "7d821070cef65bd1dbcfa6be273d43f8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotPosition>)))
  "Returns full string definition for message of type '<RobotPosition>"
  (cl:format cl:nil "string robot_name~%hero_msgs/Position position~%hero_msgs/Position[4] armor_plates~%int32 health~%int32 ammo~%~%================================================================================~%MSG: hero_msgs/Position~%float64 x~%float64 y~%float64 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotPosition)))
  "Returns full string definition for message of type 'RobotPosition"
  (cl:format cl:nil "string robot_name~%hero_msgs/Position position~%hero_msgs/Position[4] armor_plates~%int32 health~%int32 ammo~%~%================================================================================~%MSG: hero_msgs/Position~%float64 x~%float64 y~%float64 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotPosition>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robot_name))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'armor_plates) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotPosition>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotPosition
    (cl:cons ':robot_name (robot_name msg))
    (cl:cons ':position (position msg))
    (cl:cons ':armor_plates (armor_plates msg))
    (cl:cons ':health (health msg))
    (cl:cons ':ammo (ammo msg))
))
