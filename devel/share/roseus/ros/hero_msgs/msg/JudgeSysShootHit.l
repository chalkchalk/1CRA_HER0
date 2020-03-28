;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::JudgeSysShootHit)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'JudgeSysShootHit (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::JUDGESYSSHOOTHIT")
  (make-package "HERO_MSGS::JUDGESYSSHOOTHIT"))

(in-package "ROS")
;;//! \htmlinclude JudgeSysShootHit.msg.html


(defclass hero_msgs::JudgeSysShootHit
  :super ros::object
  :slots (_command _robot_name ))

(defmethod hero_msgs::JudgeSysShootHit
  (:init
   (&key
    ((:command __command) 0)
    ((:robot_name __robot_name) "")
    )
   (send-super :init)
   (setq _command (round __command))
   (setq _robot_name (string __robot_name))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:robot_name
   (&optional __robot_name)
   (if __robot_name (setq _robot_name __robot_name)) _robot_name)
  (:serialization-length
   ()
   (+
    ;; int32 _command
    4
    ;; string _robot_name
    4 (length _robot_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _command
       (write-long _command s)
     ;; string _robot_name
       (write-long (length _robot_name) s) (princ _robot_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _command
     (setq _command (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _robot_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get hero_msgs::JudgeSysShootHit :md5sum-) "33ff8353b267f35f5b5ffce93cd8fb0b")
(setf (get hero_msgs::JudgeSysShootHit :datatype-) "hero_msgs/JudgeSysShootHit")
(setf (get hero_msgs::JudgeSysShootHit :definition-)
      "int32 command
string robot_name

")



(provide :hero_msgs/JudgeSysShootHit "33ff8353b267f35f5b5ffce93cd8fb0b")


