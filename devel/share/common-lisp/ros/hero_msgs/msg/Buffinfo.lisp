; Auto-generated. Do not edit!


(cl:in-package hero_msgs-msg)


;//! \htmlinclude Buffinfo.msg.html

(cl:defclass <Buffinfo> (roslisp-msg-protocol:ros-message)
  ((buff_data
    :reader buff_data
    :initarg :buff_data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (activated
    :reader activated
    :initarg :activated
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass Buffinfo (<Buffinfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Buffinfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Buffinfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name hero_msgs-msg:<Buffinfo> is deprecated: use hero_msgs-msg:Buffinfo instead.")))

(cl:ensure-generic-function 'buff_data-val :lambda-list '(m))
(cl:defmethod buff_data-val ((m <Buffinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:buff_data-val is deprecated.  Use hero_msgs-msg:buff_data instead.")
  (buff_data m))

(cl:ensure-generic-function 'activated-val :lambda-list '(m))
(cl:defmethod activated-val ((m <Buffinfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader hero_msgs-msg:activated-val is deprecated.  Use hero_msgs-msg:activated instead.")
  (activated m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Buffinfo>)))
    "Constants for message type '<Buffinfo>"
  '((:RED_HEAL . 0)
    (:BLUE_HEAL . 1)
    (:RED_RELOAD . 2)
    (:BLUE_RELOAD . 3)
    (:MOVE_DEBUFF . 4)
    (:SHOOT_DEBUFF . 5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Buffinfo)))
    "Constants for message type 'Buffinfo"
  '((:RED_HEAL . 0)
    (:BLUE_HEAL . 1)
    (:RED_RELOAD . 2)
    (:BLUE_RELOAD . 3)
    (:MOVE_DEBUFF . 4)
    (:SHOOT_DEBUFF . 5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Buffinfo>) ostream)
  "Serializes a message object of type '<Buffinfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'buff_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'buff_data))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'activated))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'activated))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Buffinfo>) istream)
  "Deserializes a message object of type '<Buffinfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'buff_data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'buff_data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'activated) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'activated)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Buffinfo>)))
  "Returns string type for a message object of type '<Buffinfo>"
  "hero_msgs/Buffinfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Buffinfo)))
  "Returns string type for a message object of type 'Buffinfo"
  "hero_msgs/Buffinfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Buffinfo>)))
  "Returns md5sum for a message object of type '<Buffinfo>"
  "1c4f9c4da40ff47acceafd74940384f2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Buffinfo)))
  "Returns md5sum for a message object of type 'Buffinfo"
  "1c4f9c4da40ff47acceafd74940384f2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Buffinfo>)))
  "Returns full string definition for message of type '<Buffinfo>"
  (cl:format cl:nil "uint8 RED_HEAL = 0~%uint8 BLUE_HEAL = 1~%uint8 RED_RELOAD = 2~%uint8 BLUE_RELOAD = 3~%uint8 MOVE_DEBUFF = 4~%uint8 SHOOT_DEBUFF = 5~%uint8[] buff_data~%bool[] activated~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Buffinfo)))
  "Returns full string definition for message of type 'Buffinfo"
  (cl:format cl:nil "uint8 RED_HEAL = 0~%uint8 BLUE_HEAL = 1~%uint8 RED_RELOAD = 2~%uint8 BLUE_RELOAD = 3~%uint8 MOVE_DEBUFF = 4~%uint8 SHOOT_DEBUFF = 5~%uint8[] buff_data~%bool[] activated~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Buffinfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'buff_data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'activated) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Buffinfo>))
  "Converts a ROS message object to a list"
  (cl:list 'Buffinfo
    (cl:cons ':buff_data (buff_data msg))
    (cl:cons ':activated (activated msg))
))
