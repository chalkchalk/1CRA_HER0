;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::BulletsInfo)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'BulletsInfo (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BULLETSINFO")
  (make-package "HERO_MSGS::BULLETSINFO"))

(in-package "ROS")
;;//! \htmlinclude BulletsInfo.msg.html


(defclass hero_msgs::BulletsInfo
  :super ros::object
  :slots (_bullet_num _bullets ))

(defmethod hero_msgs::BulletsInfo
  (:init
   (&key
    ((:bullet_num __bullet_num) 0)
    ((:bullets __bullets) (let (r) (dotimes (i 0) (push (instance hero_msgs::BulletMove :init) r)) r))
    )
   (send-super :init)
   (setq _bullet_num (round __bullet_num))
   (setq _bullets __bullets)
   self)
  (:bullet_num
   (&optional __bullet_num)
   (if __bullet_num (setq _bullet_num __bullet_num)) _bullet_num)
  (:bullets
   (&rest __bullets)
   (if (keywordp (car __bullets))
       (send* _bullets __bullets)
     (progn
       (if __bullets (setq _bullets (car __bullets)))
       _bullets)))
  (:serialization-length
   ()
   (+
    ;; uint32 _bullet_num
    4
    ;; hero_msgs/BulletMove[] _bullets
    (apply #'+ (send-all _bullets :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _bullet_num
       (write-long _bullet_num s)
     ;; hero_msgs/BulletMove[] _bullets
     (write-long (length _bullets) s)
     (dolist (elem _bullets)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _bullet_num
     (setq _bullet_num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; hero_msgs/BulletMove[] _bullets
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bullets (let (r) (dotimes (i n) (push (instance hero_msgs::BulletMove :init) r)) r))
     (dolist (elem- _bullets)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get hero_msgs::BulletsInfo :md5sum-) "38e2196c2ea7bf8b960e57cec8261003")
(setf (get hero_msgs::BulletsInfo :datatype-) "hero_msgs/BulletsInfo")
(setf (get hero_msgs::BulletsInfo :definition-)
      "uint32 bullet_num
hero_msgs/BulletMove[] bullets

================================================================================
MSG: hero_msgs/BulletMove
string owner
float64 x
float64 y
float64 x_last
float64 y_last
float64 yaw
float64 speed
float64 covered_distance

")



(provide :hero_msgs/BulletsInfo "38e2196c2ea7bf8b960e57cec8261003")


