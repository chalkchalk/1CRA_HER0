;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::BulletMove)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'BulletMove (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BULLETMOVE")
  (make-package "HERO_MSGS::BULLETMOVE"))

(in-package "ROS")
;;//! \htmlinclude BulletMove.msg.html


(defclass hero_msgs::BulletMove
  :super ros::object
  :slots (_owner _x _y _x_last _y_last _yaw _speed _covered_distance ))

(defmethod hero_msgs::BulletMove
  (:init
   (&key
    ((:owner __owner) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:x_last __x_last) 0.0)
    ((:y_last __y_last) 0.0)
    ((:yaw __yaw) 0.0)
    ((:speed __speed) 0.0)
    ((:covered_distance __covered_distance) 0.0)
    )
   (send-super :init)
   (setq _owner (string __owner))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _x_last (float __x_last))
   (setq _y_last (float __y_last))
   (setq _yaw (float __yaw))
   (setq _speed (float __speed))
   (setq _covered_distance (float __covered_distance))
   self)
  (:owner
   (&optional __owner)
   (if __owner (setq _owner __owner)) _owner)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:x_last
   (&optional __x_last)
   (if __x_last (setq _x_last __x_last)) _x_last)
  (:y_last
   (&optional __y_last)
   (if __y_last (setq _y_last __y_last)) _y_last)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:covered_distance
   (&optional __covered_distance)
   (if __covered_distance (setq _covered_distance __covered_distance)) _covered_distance)
  (:serialization-length
   ()
   (+
    ;; string _owner
    4 (length _owner)
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _x_last
    8
    ;; float64 _y_last
    8
    ;; float64 _yaw
    8
    ;; float64 _speed
    8
    ;; float64 _covered_distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _owner
       (write-long (length _owner) s) (princ _owner s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x_last
       (sys::poke _x_last (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y_last
       (sys::poke _y_last (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _covered_distance
       (sys::poke _covered_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _owner
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _owner (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x_last
     (setq _x_last (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y_last
     (setq _y_last (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _covered_distance
     (setq _covered_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get hero_msgs::BulletMove :md5sum-) "549805474b46a9047454c7d22f3cd2ad")
(setf (get hero_msgs::BulletMove :datatype-) "hero_msgs/BulletMove")
(setf (get hero_msgs::BulletMove :definition-)
      "string owner
float64 x
float64 y
float64 x_last
float64 y_last
float64 yaw
float64 speed
float64 covered_distance

")



(provide :hero_msgs/BulletMove "549805474b46a9047454c7d22f3cd2ad")


