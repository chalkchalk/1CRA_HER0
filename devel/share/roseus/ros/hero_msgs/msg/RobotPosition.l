;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::RobotPosition)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'RobotPosition (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::ROBOTPOSITION")
  (make-package "HERO_MSGS::ROBOTPOSITION"))

(in-package "ROS")
;;//! \htmlinclude RobotPosition.msg.html


(defclass hero_msgs::RobotPosition
  :super ros::object
  :slots (_robot_name _position _armor_plates _health ))

(defmethod hero_msgs::RobotPosition
  (:init
   (&key
    ((:robot_name __robot_name) "")
    ((:position __position) (instance hero_msgs::Position :init))
    ((:armor_plates __armor_plates) (let (r) (dotimes (i 4) (push (instance hero_msgs::Position :init) r)) r))
    ((:health __health) 0)
    )
   (send-super :init)
   (setq _robot_name (string __robot_name))
   (setq _position __position)
   (setq _armor_plates __armor_plates)
   (setq _health (round __health))
   self)
  (:robot_name
   (&optional __robot_name)
   (if __robot_name (setq _robot_name __robot_name)) _robot_name)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:armor_plates
   (&rest __armor_plates)
   (if (keywordp (car __armor_plates))
       (send* _armor_plates __armor_plates)
     (progn
       (if __armor_plates (setq _armor_plates (car __armor_plates)))
       _armor_plates)))
  (:health
   (&optional __health)
   (if __health (setq _health __health)) _health)
  (:serialization-length
   ()
   (+
    ;; string _robot_name
    4 (length _robot_name)
    ;; hero_msgs/Position _position
    (send _position :serialization-length)
    ;; hero_msgs/Position[4] _armor_plates
    (apply #'+ (send-all _armor_plates :serialization-length))
    ;; int32 _health
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_name
       (write-long (length _robot_name) s) (princ _robot_name s)
     ;; hero_msgs/Position _position
       (send _position :serialize s)
     ;; hero_msgs/Position[4] _armor_plates
     (dolist (elem _armor_plates)
       (send elem :serialize s)
       )
     ;; int32 _health
       (write-long _health s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; hero_msgs/Position _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; hero_msgs/Position[4] _armor_plates
   (dotimes (i 4)
     (send (elt _armor_plates i) :deserialize buf ptr-) (incf ptr- (send (elt _armor_plates i) :serialization-length))
     )
   ;; int32 _health
     (setq _health (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hero_msgs::RobotPosition :md5sum-) "1b53db4978d8547fbe7a70a9e519607a")
(setf (get hero_msgs::RobotPosition :datatype-) "hero_msgs/RobotPosition")
(setf (get hero_msgs::RobotPosition :definition-)
      "string robot_name
hero_msgs/Position position
hero_msgs/Position[4] armor_plates
int32 health

================================================================================
MSG: hero_msgs/Position
float64 x
float64 y
float64 yaw

")



(provide :hero_msgs/RobotPosition "1b53db4978d8547fbe7a70a9e519607a")


