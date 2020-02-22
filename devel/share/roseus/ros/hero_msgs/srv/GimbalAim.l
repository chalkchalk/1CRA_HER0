;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::GimbalAim)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'GimbalAim (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::GIMBALAIM")
  (make-package "HERO_MSGS::GIMBALAIM"))
(unless (find-package "HERO_MSGS::GIMBALAIMREQUEST")
  (make-package "HERO_MSGS::GIMBALAIMREQUEST"))
(unless (find-package "HERO_MSGS::GIMBALAIMRESPONSE")
  (make-package "HERO_MSGS::GIMBALAIMRESPONSE"))

(in-package "ROS")





(defclass hero_msgs::GimbalAimRequest
  :super ros::object
  :slots (_set_angle_absolute ))

(defmethod hero_msgs::GimbalAimRequest
  (:init
   (&key
    ((:set_angle_absolute __set_angle_absolute) 0.0)
    )
   (send-super :init)
   (setq _set_angle_absolute (float __set_angle_absolute))
   self)
  (:set_angle_absolute
   (&optional __set_angle_absolute)
   (if __set_angle_absolute (setq _set_angle_absolute __set_angle_absolute)) _set_angle_absolute)
  (:serialization-length
   ()
   (+
    ;; float64 _set_angle_absolute
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _set_angle_absolute
       (sys::poke _set_angle_absolute (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _set_angle_absolute
     (setq _set_angle_absolute (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass hero_msgs::GimbalAimResponse
  :super ros::object
  :slots (_aimed ))

(defmethod hero_msgs::GimbalAimResponse
  (:init
   (&key
    ((:aimed __aimed) nil)
    )
   (send-super :init)
   (setq _aimed __aimed)
   self)
  (:aimed
   (&optional __aimed)
   (if __aimed (setq _aimed __aimed)) _aimed)
  (:serialization-length
   ()
   (+
    ;; bool _aimed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _aimed
       (if _aimed (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _aimed
     (setq _aimed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hero_msgs::GimbalAim
  :super ros::object
  :slots ())

(setf (get hero_msgs::GimbalAim :md5sum-) "092644b5ad06ae027152ed41585220f2")
(setf (get hero_msgs::GimbalAim :datatype-) "hero_msgs/GimbalAim")
(setf (get hero_msgs::GimbalAim :request) hero_msgs::GimbalAimRequest)
(setf (get hero_msgs::GimbalAim :response) hero_msgs::GimbalAimResponse)

(defmethod hero_msgs::GimbalAimRequest
  (:response () (instance hero_msgs::GimbalAimResponse :init)))

(setf (get hero_msgs::GimbalAimRequest :md5sum-) "092644b5ad06ae027152ed41585220f2")
(setf (get hero_msgs::GimbalAimRequest :datatype-) "hero_msgs/GimbalAimRequest")
(setf (get hero_msgs::GimbalAimRequest :definition-)
      "float64 set_angle_absolute
---
bool aimed

")

(setf (get hero_msgs::GimbalAimResponse :md5sum-) "092644b5ad06ae027152ed41585220f2")
(setf (get hero_msgs::GimbalAimResponse :datatype-) "hero_msgs/GimbalAimResponse")
(setf (get hero_msgs::GimbalAimResponse :definition-)
      "float64 set_angle_absolute
---
bool aimed

")



(provide :hero_msgs/GimbalAim "092644b5ad06ae027152ed41585220f2")


