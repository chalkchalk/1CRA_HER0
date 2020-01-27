;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::JudgeSysControl)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'JudgeSysControl (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::JUDGESYSCONTROL")
  (make-package "HERO_MSGS::JUDGESYSCONTROL"))
(unless (find-package "HERO_MSGS::JUDGESYSCONTROLREQUEST")
  (make-package "HERO_MSGS::JUDGESYSCONTROLREQUEST"))
(unless (find-package "HERO_MSGS::JUDGESYSCONTROLRESPONSE")
  (make-package "HERO_MSGS::JUDGESYSCONTROLRESPONSE"))

(in-package "ROS")





(defclass hero_msgs::JudgeSysControlRequest
  :super ros::object
  :slots (_command _robot_name ))

(defmethod hero_msgs::JudgeSysControlRequest
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

(defclass hero_msgs::JudgeSysControlResponse
  :super ros::object
  :slots (_error_code ))

(defmethod hero_msgs::JudgeSysControlResponse
  (:init
   (&key
    ((:error_code __error_code) 0)
    )
   (send-super :init)
   (setq _error_code (round __error_code))
   self)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:serialization-length
   ()
   (+
    ;; int32 _error_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _error_code
       (write-long _error_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _error_code
     (setq _error_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass hero_msgs::JudgeSysControl
  :super ros::object
  :slots ())

(setf (get hero_msgs::JudgeSysControl :md5sum-) "88842955bcbf0eaf028f22a76f978663")
(setf (get hero_msgs::JudgeSysControl :datatype-) "hero_msgs/JudgeSysControl")
(setf (get hero_msgs::JudgeSysControl :request) hero_msgs::JudgeSysControlRequest)
(setf (get hero_msgs::JudgeSysControl :response) hero_msgs::JudgeSysControlResponse)

(defmethod hero_msgs::JudgeSysControlRequest
  (:response () (instance hero_msgs::JudgeSysControlResponse :init)))

(setf (get hero_msgs::JudgeSysControlRequest :md5sum-) "88842955bcbf0eaf028f22a76f978663")
(setf (get hero_msgs::JudgeSysControlRequest :datatype-) "hero_msgs/JudgeSysControlRequest")
(setf (get hero_msgs::JudgeSysControlRequest :definition-)
      "int32 command
string robot_name
---
int32 error_code
")

(setf (get hero_msgs::JudgeSysControlResponse :md5sum-) "88842955bcbf0eaf028f22a76f978663")
(setf (get hero_msgs::JudgeSysControlResponse :datatype-) "hero_msgs/JudgeSysControlResponse")
(setf (get hero_msgs::JudgeSysControlResponse :definition-)
      "int32 command
string robot_name
---
int32 error_code
")



(provide :hero_msgs/JudgeSysControl "88842955bcbf0eaf028f22a76f978663")


