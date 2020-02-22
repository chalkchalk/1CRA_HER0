;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::BattlePosition)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'BattlePosition (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BATTLEPOSITION")
  (make-package "HERO_MSGS::BATTLEPOSITION"))

(in-package "ROS")
;;//! \htmlinclude BattlePosition.msg.html


(defclass hero_msgs::BattlePosition
  :super ros::object
  :slots (_robots_num _robots_position ))

(defmethod hero_msgs::BattlePosition
  (:init
   (&key
    ((:robots_num __robots_num) 0)
    ((:robots_position __robots_position) (let (r) (dotimes (i 0) (push (instance hero_msgs::RobotPosition :init) r)) r))
    )
   (send-super :init)
   (setq _robots_num (round __robots_num))
   (setq _robots_position __robots_position)
   self)
  (:robots_num
   (&optional __robots_num)
   (if __robots_num (setq _robots_num __robots_num)) _robots_num)
  (:robots_position
   (&rest __robots_position)
   (if (keywordp (car __robots_position))
       (send* _robots_position __robots_position)
     (progn
       (if __robots_position (setq _robots_position (car __robots_position)))
       _robots_position)))
  (:serialization-length
   ()
   (+
    ;; int16 _robots_num
    2
    ;; hero_msgs/RobotPosition[] _robots_position
    (apply #'+ (send-all _robots_position :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _robots_num
       (write-word _robots_num s)
     ;; hero_msgs/RobotPosition[] _robots_position
     (write-long (length _robots_position) s)
     (dolist (elem _robots_position)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _robots_num
     (setq _robots_num (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; hero_msgs/RobotPosition[] _robots_position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _robots_position (let (r) (dotimes (i n) (push (instance hero_msgs::RobotPosition :init) r)) r))
     (dolist (elem- _robots_position)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get hero_msgs::BattlePosition :md5sum-) "489a047d00172221ccddcce4b5adc631")
(setf (get hero_msgs::BattlePosition :datatype-) "hero_msgs/BattlePosition")
(setf (get hero_msgs::BattlePosition :definition-)
      "int16 robots_num
hero_msgs/RobotPosition[] robots_position

================================================================================
MSG: hero_msgs/RobotPosition
string robot_name
hero_msgs/Position position
hero_msgs/Position[4] armor_plates
int32 health

================================================================================
MSG: hero_msgs/Position
float64 x
float64 y
float64 yaw

")



(provide :hero_msgs/BattlePosition "489a047d00172221ccddcce4b5adc631")


