; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude BattlePosition.msg.html

(cl:defclass <BattlePosition> (roslisp-msg-protocol:ros-message)
  ((robots_num
    :reader robots_num
    :initarg :robots_num
    :type cl:fixnum
    :initform 0)
   (robots_position
    :reader robots_position
    :initarg :robots_position
    :type (cl:vector hero_msgs-msg:RobotPosition)
   :initform (cl:make-array 0 :element-type 'hero_msgs-msg:RobotPosition :initial-element (cl:make-instance 'hero_msgs-msg:RobotPosition))))
)

(cl:defclass BattlePosition (<BattlePosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BattlePosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BattlePosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<BattlePosition> is deprecated: use hero_msgs-msg:BattlePosition instead.")))

(cl:ensure-generic-function 'robots_num-val :lambda-list '(m))
(cl:defmethod robots_num-val ((m <BattlePosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:robots_num-val is deprecated.  Use hero_msgs-msg:robots_num instead.")
  (robots_num m))

(cl:ensure-generic-function 'robots_position-val :lambda-list '(m))
(cl:defmethod robots_position-val ((m <BattlePosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:robots_position-val is deprecated.  Use hero_msgs-msg:robots_position instead.")
  (robots_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BattlePosition>) ostream)
  "Serializes a message object of type '<BattlePosition>"
  (cl:let* ((signed (cl:slot-value msg 'robots_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'robots_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'robots_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BattlePosition>) istream)
  "Deserializes a message object of type '<BattlePosition>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robots_num) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'robots_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'robots_position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'hero_msgs-msg:RobotPosition))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BattlePosition>)))
  "Returns string type for a message object of type '<BattlePosition>"
  "hero_msgs/BattlePosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BattlePosition)))
  "Returns string type for a message object of type 'BattlePosition"
  "hero_msgs/BattlePosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BattlePosition>)))
  "Returns md5sum for a message object of type '<BattlePosition>"
  "4cb89422094dbe8ef13eac42ca6ded41")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BattlePosition)))
  "Returns md5sum for a message object of type 'BattlePosition"
  "4cb89422094dbe8ef13eac42ca6ded41")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BattlePosition>)))
  "Returns full string definition for message of type '<BattlePosition>"
  (cl:format cl:nil "int16 robots_num~%hero_msgs/RobotPosition[] robots_position~%~%================================================================================~%MSG: hero_msgs/RobotPosition~%string robot_name~%hero_msgs/Position position~%hero_msgs/Position[4] armor_plates~%int32 health~%int32 ammo~%~%================================================================================~%MSG: hero_msgs/Position~%float64 x~%float64 y~%float64 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BattlePosition)))
  "Returns full string definition for message of type 'BattlePosition"
  (cl:format cl:nil "int16 robots_num~%hero_msgs/RobotPosition[] robots_position~%~%================================================================================~%MSG: hero_msgs/RobotPosition~%string robot_name~%hero_msgs/Position position~%hero_msgs/Position[4] armor_plates~%int32 health~%int32 ammo~%~%================================================================================~%MSG: hero_msgs/Position~%float64 x~%float64 y~%float64 yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BattlePosition>))
  (cl:+ 0
     2
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'robots_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BattlePosition>))
  "Converts a ROS message object to a list"
  (cl:list 'BattlePosition
    (cl:cons ':robots_num (robots_num msg))
    (cl:cons ':robots_position (robots_position msg))
))
