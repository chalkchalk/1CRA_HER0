;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::ProjectileSupply)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'ProjectileSupply (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::PROJECTILESUPPLY")
  (make-package "HERO_MSGS::PROJECTILESUPPLY"))

(in-package "ROS")
;;//! \htmlinclude ProjectileSupply.msg.html


(defclass hero_msgs::ProjectileSupply
  :super ros::object
  :slots (_number ))

(defmethod hero_msgs::ProjectileSupply
  (:init
   (&key
    ((:number __number) 0)
    )
   (send-super :init)
   (setq _number (round __number))
   self)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; uint8 _number
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _number
       (write-byte _number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _number
     (setq _number (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hero_msgs::ProjectileSupply :md5sum-) "29e94f7568510a2f9241abcc8f191b4f")
(setf (get hero_msgs::ProjectileSupply :datatype-) "hero_msgs/ProjectileSupply")
(setf (get hero_msgs::ProjectileSupply :definition-)
      "#projectile supply
uint8 number

")



(provide :hero_msgs/ProjectileSupply "29e94f7568510a2f9241abcc8f191b4f")


