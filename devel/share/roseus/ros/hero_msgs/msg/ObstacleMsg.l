;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::ObstacleMsg)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'ObstacleMsg (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::OBSTACLEMSG")
  (make-package "HERO_MSGS::OBSTACLEMSG"))

(in-package "ROS")
;;//! \htmlinclude ObstacleMsg.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass hero_msgs::ObstacleMsg
  :super ros::object
  :slots (_header _obstacles _ids _orientations _velocities ))

(defmethod hero_msgs::ObstacleMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:obstacles __obstacles) (let (r) (dotimes (i 0) (push (instance geometry_msgs::PolygonStamped :init) r)) r))
    ((:ids __ids) (make-array 0 :initial-element 0 :element-type :integer))
    ((:orientations __orientations) (let (r) (dotimes (i 0) (push (instance geometry_msgs::QuaternionStamped :init) r)) r))
    ((:velocities __velocities) (let (r) (dotimes (i 0) (push (instance geometry_msgs::TwistWithCovariance :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _obstacles __obstacles)
   (setq _ids __ids)
   (setq _orientations __orientations)
   (setq _velocities __velocities)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:ids
   (&optional __ids)
   (if __ids (setq _ids __ids)) _ids)
  (:orientations
   (&rest __orientations)
   (if (keywordp (car __orientations))
       (send* _orientations __orientations)
     (progn
       (if __orientations (setq _orientations (car __orientations)))
       _orientations)))
  (:velocities
   (&rest __velocities)
   (if (keywordp (car __velocities))
       (send* _velocities __velocities)
     (progn
       (if __velocities (setq _velocities (car __velocities)))
       _velocities)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/PolygonStamped[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ;; uint32[] _ids
    (* 4    (length _ids)) 4
    ;; geometry_msgs/QuaternionStamped[] _orientations
    (apply #'+ (send-all _orientations :serialization-length)) 4
    ;; geometry_msgs/TwistWithCovariance[] _velocities
    (apply #'+ (send-all _velocities :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/PolygonStamped[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;; uint32[] _ids
     (write-long (length _ids) s)
     (dotimes (i (length _ids))
       (write-long (elt _ids i) s)
       )
     ;; geometry_msgs/QuaternionStamped[] _orientations
     (write-long (length _orientations) s)
     (dolist (elem _orientations)
       (send elem :serialize s)
       )
     ;; geometry_msgs/TwistWithCovariance[] _velocities
     (write-long (length _velocities) s)
     (dolist (elem _velocities)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/PolygonStamped[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance geometry_msgs::PolygonStamped :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; uint32[] _ids
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ids (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _ids i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; geometry_msgs/QuaternionStamped[] _orientations
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _orientations (let (r) (dotimes (i n) (push (instance geometry_msgs::QuaternionStamped :init) r)) r))
     (dolist (elem- _orientations)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/TwistWithCovariance[] _velocities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocities (let (r) (dotimes (i n) (push (instance geometry_msgs::TwistWithCovariance :init) r)) r))
     (dolist (elem- _velocities)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get hero_msgs::ObstacleMsg :md5sum-) "a537b0b7fce70da7b78c2df042f56aa2")
(setf (get hero_msgs::ObstacleMsg :datatype-) "hero_msgs/ObstacleMsg")
(setf (get hero_msgs::ObstacleMsg :definition-)
      "# Message that contains a list of polygon shaped obstacles.
# Special types:
# Polygon with 1 vertex: Point obstacle
# Polygon with 2 vertices: Line obstacle
# Polygon with more than 2 vertices: First and last points are assumed to be connected
#
# If optional properties (orientaions or velocities) are provided,
# each container size must match the number of obstacles
# otherwise let them empty.


std_msgs/Header header

# Actual obstacle positions (polygon descriptions)
geometry_msgs/PolygonStamped[] obstacles

# Obstacle IDs [optional]
# Specify IDs in order to provide (temporal) relationships
# between obstacles among multiple messages.
# If provided it must be size(ids) = size(obstacles)
uint32[] ids

# Individual orientations (centroid) [optional]
# If provided it must be size(orientations) = size(obstacles) 
geometry_msgs/QuaternionStamped[] orientations

# Individual velocities (centroid) [optional]
# If provided it must be size(velocities) = size(obstacles)
geometry_msgs/TwistWithCovariance[] velocities


================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/PolygonStamped
# This represents a Polygon with reference coordinate frame and timestamp
Header header
Polygon polygon

================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
================================================================================
MSG: geometry_msgs/QuaternionStamped
# This represents an orientation with reference coordinate frame and timestamp.

Header header
Quaternion quaternion

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :hero_msgs/ObstacleMsg "a537b0b7fce70da7b78c2df042f56aa2")


