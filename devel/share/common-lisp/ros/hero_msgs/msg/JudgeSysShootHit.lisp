; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude JudgeSysShootHit.msg.html

(cl:defclass <JudgeSysShootHit> (roslisp-msg-protocol:ros-message)
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

(cl:defclass JudgeSysShootHit (<JudgeSysShootHit>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JudgeSysShootHit>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JudgeSysShootHit)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<JudgeSysShootHit> is deprecated: use hero_msgs-msg:JudgeSysShootHit instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <JudgeSysShootHit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:command-val is deprecated.  Use hero_msgs-msg:command instead.")
  (command m))

(cl:ensure-generic-function 'robot_name-val :lambda-list '(m))
(cl:defmethod robot_name-val ((m <JudgeSysShootHit>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:robot_name-val is deprecated.  Use hero_msgs-msg:robot_name instead.")
  (robot_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JudgeSysShootHit>) ostream)
  "Serializes a message object of type '<JudgeSysShootHit>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JudgeSysShootHit>) istream)
  "Deserializes a message object of type '<JudgeSysShootHit>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JudgeSysShootHit>)))
  "Returns string type for a message object of type '<JudgeSysShootHit>"
  "hero_msgs/JudgeSysShootHit")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JudgeSysShootHit)))
  "Returns string type for a message object of type 'JudgeSysShootHit"
  "hero_msgs/JudgeSysShootHit")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JudgeSysShootHit>)))
  "Returns md5sum for a message object of type '<JudgeSysShootHit>"
  "33ff8353b267f35f5b5ffce93cd8fb0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JudgeSysShootHit)))
  "Returns md5sum for a message object of type 'JudgeSysShootHit"
  "33ff8353b267f35f5b5ffce93cd8fb0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JudgeSysShootHit>)))
  "Returns full string definition for message of type '<JudgeSysShootHit>"
  (cl:format cl:nil "int32 command~%string robot_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JudgeSysShootHit)))
  "Returns full string definition for message of type 'JudgeSysShootHit"
  (cl:format cl:nil "int32 command~%string robot_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JudgeSysShootHit>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'robot_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JudgeSysShootHit>))
  "Converts a ROS message object to a list"
  (cl:list 'JudgeSysShootHit
    (cl:cons ':command (command msg))
    (cl:cons ':robot_name (robot_name msg))
))
