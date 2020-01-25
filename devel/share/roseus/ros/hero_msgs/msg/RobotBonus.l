;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::RobotBonus)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'RobotBonus (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::ROBOTBONUS")
  (make-package "HERO_MSGS::ROBOTBONUS"))

(in-package "ROS")
;;//! \htmlinclude RobotBonus.msg.html


(defclass hero_msgs::RobotBonus
  :super ros::object
  :slots (_bonus ))

(defmethod hero_msgs::RobotBonus
  (:init
   (&key
    ((:bonus __bonus) nil)
    )
   (send-super :init)
   (setq _bonus __bonus)
   self)
  (:bonus
   (&optional __bonus)
   (if __bonus (setq _bonus __bonus)) _bonus)
  (:serialization-length
   ()
   (+
    ;; bool _bonus
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _bonus
       (if _bonus (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _bonus
     (setq _bonus (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hero_msgs::RobotBonus :md5sum-) "22365d98c104f9d16cae777ed759cbfe")
(setf (get hero_msgs::RobotBonus :datatype-) "hero_msgs/RobotBonus")
(setf (get hero_msgs::RobotBonus :definition-)
      "#robot bonus
bool bonus

")



(provide :hero_msgs/RobotBonus "22365d98c104f9d16cae777ed759cbfe")


