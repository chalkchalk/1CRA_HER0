;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::ShootCmd)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'ShootCmd (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::SHOOTCMD")
  (make-package "HERO_MSGS::SHOOTCMD"))
(unless (find-package "HERO_MSGS::SHOOTCMDREQUEST")
  (make-package "HERO_MSGS::SHOOTCMDREQUEST"))
(unless (find-package "HERO_MSGS::SHOOTCMDRESPONSE")
  (make-package "HERO_MSGS::SHOOTCMDRESPONSE"))

(in-package "ROS")





(intern "*STOP*" (find-package "HERO_MSGS::SHOOTCMDREQUEST"))
(shadow '*STOP* (find-package "HERO_MSGS::SHOOTCMDREQUEST"))
(defconstant hero_msgs::ShootCmdRequest::*STOP* 0)
(intern "*ONCE*" (find-package "HERO_MSGS::SHOOTCMDREQUEST"))
(shadow '*ONCE* (find-package "HERO_MSGS::SHOOTCMDREQUEST"))
(defconstant hero_msgs::ShootCmdRequest::*ONCE* 1)
(intern "*CONTINUOUS*" (find-package "HERO_MSGS::SHOOTCMDREQUEST"))
(shadow '*CONTINUOUS* (find-package "HERO_MSGS::SHOOTCMDREQUEST"))
(defconstant hero_msgs::ShootCmdRequest::*CONTINUOUS* 2)
(defclass hero_msgs::ShootCmdRequest
  :super ros::object
  :slots (_robot_num _mode _number ))

(defmethod hero_msgs::ShootCmdRequest
  (:init
   (&key
    ((:robot_num __robot_num) "")
    ((:mode __mode) 0)
    ((:number __number) 0)
    )
   (send-super :init)
   (setq _robot_num (string __robot_num))
   (setq _mode (round __mode))
   (setq _number (round __number))
   self)
  (:robot_num
   (&optional __robot_num)
   (if __robot_num (setq _robot_num __robot_num)) _robot_num)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; string _robot_num
    4 (length _robot_num)
    ;; uint8 _mode
    1
    ;; uint8 _number
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_num
       (write-long (length _robot_num) s) (princ _robot_num s)
     ;; uint8 _mode
       (write-byte _mode s)
     ;; uint8 _number
       (write-byte _number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_num
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_num (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _number
     (setq _number (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass hero_msgs::ShootCmdResponse
  :super ros::object
  :slots (_received ))

(defmethod hero_msgs::ShootCmdResponse
  (:init
   (&key
    ((:received __received) nil)
    )
   (send-super :init)
   (setq _received __received)
   self)
  (:received
   (&optional __received)
   (if __received (setq _received __received)) _received)
  (:serialization-length
   ()
   (+
    ;; bool _received
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _received
       (if _received (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _received
     (setq _received (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hero_msgs::ShootCmd
  :super ros::object
  :slots ())

(setf (get hero_msgs::ShootCmd :md5sum-) "4adbabcc97afbd3e618602740ecc0659")
(setf (get hero_msgs::ShootCmd :datatype-) "hero_msgs/ShootCmd")
(setf (get hero_msgs::ShootCmd :request) hero_msgs::ShootCmdRequest)
(setf (get hero_msgs::ShootCmd :response) hero_msgs::ShootCmdResponse)

(defmethod hero_msgs::ShootCmdRequest
  (:response () (instance hero_msgs::ShootCmdResponse :init)))

(setf (get hero_msgs::ShootCmdRequest :md5sum-) "4adbabcc97afbd3e618602740ecc0659")
(setf (get hero_msgs::ShootCmdRequest :datatype-) "hero_msgs/ShootCmdRequest")
(setf (get hero_msgs::ShootCmdRequest :definition-)
      "uint8 STOP = 0
uint8 ONCE = 1
uint8 CONTINUOUS = 2
string robot_num
uint8 mode
uint8 number
---
bool received

")

(setf (get hero_msgs::ShootCmdResponse :md5sum-) "4adbabcc97afbd3e618602740ecc0659")
(setf (get hero_msgs::ShootCmdResponse :datatype-) "hero_msgs/ShootCmdResponse")
(setf (get hero_msgs::ShootCmdResponse :definition-)
      "uint8 STOP = 0
uint8 ONCE = 1
uint8 CONTINUOUS = 2
string robot_num
uint8 mode
uint8 number
---
bool received

")



(provide :hero_msgs/ShootCmd "4adbabcc97afbd3e618602740ecc0659")


