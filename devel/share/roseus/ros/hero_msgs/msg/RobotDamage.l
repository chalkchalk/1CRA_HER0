;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::RobotDamage)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'RobotDamage (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::ROBOTDAMAGE")
  (make-package "HERO_MSGS::ROBOTDAMAGE"))

(in-package "ROS")
;;//! \htmlinclude RobotDamage.msg.html


(intern "*ARMOR*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*ARMOR* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*ARMOR* 0)
(intern "*OFFLINE*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*OFFLINE* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*OFFLINE* 1)
(intern "*EXCEED_HEAT*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*EXCEED_HEAT* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*EXCEED_HEAT* 2)
(intern "*EXCEED_POWER*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*EXCEED_POWER* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*EXCEED_POWER* 3)
(intern "*FORWARD*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*FORWARD* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*FORWARD* 0)
(intern "*LEFT*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*LEFT* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*LEFT* 1)
(intern "*BACKWARD*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*BACKWARD* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*BACKWARD* 2)
(intern "*RIGHT*" (find-package "HERO_MSGS::ROBOTDAMAGE"))
(shadow '*RIGHT* (find-package "HERO_MSGS::ROBOTDAMAGE"))
(defconstant hero_msgs::RobotDamage::*RIGHT* 3)
(defclass hero_msgs::RobotDamage
  :super ros::object
  :slots (_damage_type _damage_source ))

(defmethod hero_msgs::RobotDamage
  (:init
   (&key
    ((:damage_type __damage_type) 0)
    ((:damage_source __damage_source) 0)
    )
   (send-super :init)
   (setq _damage_type (round __damage_type))
   (setq _damage_source (round __damage_source))
   self)
  (:damage_type
   (&optional __damage_type)
   (if __damage_type (setq _damage_type __damage_type)) _damage_type)
  (:damage_source
   (&optional __damage_source)
   (if __damage_source (setq _damage_source __damage_source)) _damage_source)
  (:serialization-length
   ()
   (+
    ;; uint8 _damage_type
    1
    ;; uint8 _damage_source
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _damage_type
       (write-byte _damage_type s)
     ;; uint8 _damage_source
       (write-byte _damage_source s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _damage_type
     (setq _damage_type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _damage_source
     (setq _damage_source (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hero_msgs::RobotDamage :md5sum-) "effef5d3b7e81a8189f62bb1e64ada64")
(setf (get hero_msgs::RobotDamage :datatype-) "hero_msgs/RobotDamage")
(setf (get hero_msgs::RobotDamage :definition-)
      "#robot damage
uint8 ARMOR = 0
uint8 OFFLINE = 1
uint8 EXCEED_HEAT = 2
uint8 EXCEED_POWER = 3
uint8 damage_type
uint8 FORWARD = 0
uint8 LEFT = 1
uint8 BACKWARD = 2
uint8 RIGHT = 3
uint8 damage_source



")



(provide :hero_msgs/RobotDamage "effef5d3b7e81a8189f62bb1e64ada64")


