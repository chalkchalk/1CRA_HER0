;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::BasicExecutor)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'BasicExecutor (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BASICEXECUTOR")
  (make-package "HERO_MSGS::BASICEXECUTOR"))
(unless (find-package "HERO_MSGS::BASICEXECUTORREQUEST")
  (make-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(unless (find-package "HERO_MSGS::BASICEXECUTORRESPONSE")
  (make-package "HERO_MSGS::BASICEXECUTORRESPONSE"))

(in-package "ROS")





(intern "*MOVE_TO_POSITION*" (find-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(shadow '*MOVE_TO_POSITION* (find-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(defconstant hero_msgs::BasicExecutorRequest::*MOVE_TO_POSITION* 1)
(intern "*ATTACK_ROBOT*" (find-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(shadow '*ATTACK_ROBOT* (find-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(defconstant hero_msgs::BasicExecutorRequest::*ATTACK_ROBOT* 2)
(intern "*HALT*" (find-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(shadow '*HALT* (find-package "HERO_MSGS::BASICEXECUTORREQUEST"))
(defconstant hero_msgs::BasicExecutorRequest::*HALT* 3)
(defclass hero_msgs::BasicExecutorRequest
  :super ros::object
  :slots (_command _robot_name _yaw_control _position_x _position_y ))

(defmethod hero_msgs::BasicExecutorRequest
  (:init
   (&key
    ((:command __command) 0)
    ((:robot_name __robot_name) "")
    ((:yaw_control __yaw_control) nil)
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    )
   (send-super :init)
   (setq _command (round __command))
   (setq _robot_name (string __robot_name))
   (setq _yaw_control __yaw_control)
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:robot_name
   (&optional __robot_name)
   (if __robot_name (setq _robot_name __robot_name)) _robot_name)
  (:yaw_control
   (&optional __yaw_control)
   (if __yaw_control (setq _yaw_control __yaw_control)) _yaw_control)
  (:position_x
   (&optional __position_x)
   (if __position_x (setq _position_x __position_x)) _position_x)
  (:position_y
   (&optional __position_y)
   (if __position_y (setq _position_y __position_y)) _position_y)
  (:serialization-length
   ()
   (+
    ;; uint8 _command
    1
    ;; string _robot_name
    4 (length _robot_name)
    ;; bool _yaw_control
    1
    ;; float64 _position_x
    8
    ;; float64 _position_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _command
       (write-byte _command s)
     ;; string _robot_name
       (write-long (length _robot_name) s) (princ _robot_name s)
     ;; bool _yaw_control
       (if _yaw_control (write-byte -1 s) (write-byte 0 s))
     ;; float64 _position_x
       (sys::poke _position_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _position_y
       (sys::poke _position_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _robot_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _yaw_control
     (setq _yaw_control (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _position_x
     (setq _position_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _position_y
     (setq _position_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(intern "*OK*" (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(shadow '*OK* (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(defconstant hero_msgs::BasicExecutorResponse::*OK* 100)
(intern "*I_AM_DEAD*" (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(shadow '*I_AM_DEAD* (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(defconstant hero_msgs::BasicExecutorResponse::*I_AM_DEAD* 101)
(intern "*OUT_OF_AMMO*" (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(shadow '*OUT_OF_AMMO* (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(defconstant hero_msgs::BasicExecutorResponse::*OUT_OF_AMMO* 102)
(intern "*TARGET_IS_DEAD*" (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(shadow '*TARGET_IS_DEAD* (find-package "HERO_MSGS::BASICEXECUTORRESPONSE"))
(defconstant hero_msgs::BasicExecutorResponse::*TARGET_IS_DEAD* 103)
(defclass hero_msgs::BasicExecutorResponse
  :super ros::object
  :slots (_error_code ))

(defmethod hero_msgs::BasicExecutorResponse
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
    ;; uint8 _error_code
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _error_code
       (write-byte _error_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass hero_msgs::BasicExecutor
  :super ros::object
  :slots ())

(setf (get hero_msgs::BasicExecutor :md5sum-) "3c53e40ff8af1a43835b3d7ab9ff6623")
(setf (get hero_msgs::BasicExecutor :datatype-) "hero_msgs/BasicExecutor")
(setf (get hero_msgs::BasicExecutor :request) hero_msgs::BasicExecutorRequest)
(setf (get hero_msgs::BasicExecutor :response) hero_msgs::BasicExecutorResponse)

(defmethod hero_msgs::BasicExecutorRequest
  (:response () (instance hero_msgs::BasicExecutorResponse :init)))

(setf (get hero_msgs::BasicExecutorRequest :md5sum-) "3c53e40ff8af1a43835b3d7ab9ff6623")
(setf (get hero_msgs::BasicExecutorRequest :datatype-) "hero_msgs/BasicExecutorRequest")
(setf (get hero_msgs::BasicExecutorRequest :definition-)
      "uint8 MOVE_TO_POSITION = 1
uint8 ATTACK_ROBOT = 2
uint8 HALT = 3
uint8 command
string robot_name
bool yaw_control
float64 position_x
float64 position_y
---
uint8 OK = 100
uint8 I_AM_DEAD = 101
uint8 OUT_OF_AMMO = 102
uint8 TARGET_IS_DEAD = 103
uint8 error_code

")

(setf (get hero_msgs::BasicExecutorResponse :md5sum-) "3c53e40ff8af1a43835b3d7ab9ff6623")
(setf (get hero_msgs::BasicExecutorResponse :datatype-) "hero_msgs/BasicExecutorResponse")
(setf (get hero_msgs::BasicExecutorResponse :definition-)
      "uint8 MOVE_TO_POSITION = 1
uint8 ATTACK_ROBOT = 2
uint8 HALT = 3
uint8 command
string robot_name
bool yaw_control
float64 position_x
float64 position_y
---
uint8 OK = 100
uint8 I_AM_DEAD = 101
uint8 OUT_OF_AMMO = 102
uint8 TARGET_IS_DEAD = 103
uint8 error_code

")



(provide :hero_msgs/BasicExecutor "3c53e40ff8af1a43835b3d7ab9ff6623")


