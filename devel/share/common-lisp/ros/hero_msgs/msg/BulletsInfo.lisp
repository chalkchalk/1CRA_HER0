; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude BulletsInfo.msg.html

(cl:defclass <BulletsInfo> (roslisp-msg-protocol:ros-message)
  ((bullet_num
    :reader bullet_num
    :initarg :bullet_num
    :type cl:integer
    :initform 0)
   (bullets
    :reader bullets
    :initarg :bullets
    :type (cl:vector hero_msgs-msg:BulletMove)
   :initform (cl:make-array 0 :element-type 'hero_msgs-msg:BulletMove :initial-element (cl:make-instance 'hero_msgs-msg:BulletMove))))
)

(cl:defclass BulletsInfo (<BulletsInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BulletsInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BulletsInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<BulletsInfo> is deprecated: use hero_msgs-msg:BulletsInfo instead.")))

(cl:ensure-generic-function 'bullet_num-val :lambda-list '(m))
(cl:defmethod bullet_num-val ((m <BulletsInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:bullet_num-val is deprecated.  Use hero_msgs-msg:bullet_num instead.")
  (bullet_num m))

(cl:ensure-generic-function 'bullets-val :lambda-list '(m))
(cl:defmethod bullets-val ((m <BulletsInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:bullets-val is deprecated.  Use hero_msgs-msg:bullets instead.")
  (bullets m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BulletsInfo>) ostream)
  "Serializes a message object of type '<BulletsInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bullet_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'bullet_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'bullet_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'bullet_num)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bullets))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bullets))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BulletsInfo>) istream)
  "Deserializes a message object of type '<BulletsInfo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'bullet_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'bullet_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'bullet_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'bullet_num)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bullets) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bullets)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'hero_msgs-msg:BulletMove))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BulletsInfo>)))
  "Returns string type for a message object of type '<BulletsInfo>"
  "hero_msgs/BulletsInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BulletsInfo)))
  "Returns string type for a message object of type 'BulletsInfo"
  "hero_msgs/BulletsInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BulletsInfo>)))
  "Returns md5sum for a message object of type '<BulletsInfo>"
  "bdf8108add47e44ea1df95423235ef9c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BulletsInfo)))
  "Returns md5sum for a message object of type 'BulletsInfo"
  "bdf8108add47e44ea1df95423235ef9c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BulletsInfo>)))
  "Returns full string definition for message of type '<BulletsInfo>"
  (cl:format cl:nil "uint32 bullet_num~%hero_msgs/BulletMove[] bullets~%~%================================================================================~%MSG: hero_msgs/BulletMove~%string owner~%float64 x~%float64 y~%float64 x_last~%float64 y_last~%float64 yaw~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BulletsInfo)))
  "Returns full string definition for message of type 'BulletsInfo"
  (cl:format cl:nil "uint32 bullet_num~%hero_msgs/BulletMove[] bullets~%~%================================================================================~%MSG: hero_msgs/BulletMove~%string owner~%float64 x~%float64 y~%float64 x_last~%float64 y_last~%float64 yaw~%float64 speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BulletsInfo>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bullets) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BulletsInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'BulletsInfo
    (cl:cons ':bullet_num (bullet_num msg))
    (cl:cons ':bullets (bullets msg))
))
