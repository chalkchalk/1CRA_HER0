;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::Bulletmove)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'Bulletmove (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BULLETMOVE")
  (make-package "HERO_MSGS::BULLETMOVE"))

(in-package "ROS")
;;//! \htmlinclude Bulletmove.msg.html


(defclass hero_msgs::Bulletmove
  :super ros::object
  :slots (_owner _x _y _yaw _speed ))

(defmethod hero_msgs::Bulletmove
  (:init
   (&key
    ((:owner __owner) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:yaw __yaw) 0.0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _owner (string __owner))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _yaw (float __yaw))
   (setq _speed (float __speed))
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
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; string _owner
    4 (length _owner)
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _yaw
    8
    ;; float64 _speed
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
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get hero_msgs::Bulletmove :md5sum-) "d7ddf2ff37c80a428213ceea8ec9382c")
(setf (get hero_msgs::Bulletmove :datatype-) "hero_msgs/Bulletmove")
(setf (get hero_msgs::Bulletmove :definition-)
      "string owner
float64 x
float64 y
float64 yaw
float64 speed

")



(provide :hero_msgs/Bulletmove "d7ddf2ff37c80a428213ceea8ec9382c")


