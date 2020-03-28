;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::MovePoint)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'MovePoint (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::MOVEPOINT")
  (make-package "HERO_MSGS::MOVEPOINT"))

(in-package "ROS")
;;//! \htmlinclude MovePoint.msg.html


(intern "*MOVE*" (find-package "HERO_MSGS::MOVEPOINT"))
(shadow '*MOVE* (find-package "HERO_MSGS::MOVEPOINT"))
(defconstant hero_msgs::MovePoint::*MOVE* 0)
(intern "*CANCEL*" (find-package "HERO_MSGS::MOVEPOINT"))
(shadow '*CANCEL* (find-package "HERO_MSGS::MOVEPOINT"))
(defconstant hero_msgs::MovePoint::*CANCEL* 1)
(defclass hero_msgs::MovePoint
  :super ros::object
  :slots (_target_x _target_y _cmd_code ))

(defmethod hero_msgs::MovePoint
  (:init
   (&key
    ((:target_x __target_x) 0.0)
    ((:target_y __target_y) 0.0)
    ((:cmd_code __cmd_code) 0)
    )
   (send-super :init)
   (setq _target_x (float __target_x))
   (setq _target_y (float __target_y))
   (setq _cmd_code (round __cmd_code))
   self)
  (:target_x
   (&optional __target_x)
   (if __target_x (setq _target_x __target_x)) _target_x)
  (:target_y
   (&optional __target_y)
   (if __target_y (setq _target_y __target_y)) _target_y)
  (:cmd_code
   (&optional __cmd_code)
   (if __cmd_code (setq _cmd_code __cmd_code)) _cmd_code)
  (:serialization-length
   ()
   (+
    ;; float64 _target_x
    8
    ;; float64 _target_y
    8
    ;; uint8 _cmd_code
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _target_x
       (sys::poke _target_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _target_y
       (sys::poke _target_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _cmd_code
       (write-byte _cmd_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _target_x
     (setq _target_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _target_y
     (setq _target_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _cmd_code
     (setq _cmd_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hero_msgs::MovePoint :md5sum-) "8332454d4f4776c0538a4b89b1467de8")
(setf (get hero_msgs::MovePoint :datatype-) "hero_msgs/MovePoint")
(setf (get hero_msgs::MovePoint :definition-)
      "float64 target_x
float64 target_y
uint8 cmd_code
uint8 MOVE = 0
uint8 CANCEL = 1



")



(provide :hero_msgs/MovePoint "8332454d4f4776c0538a4b89b1467de8")


