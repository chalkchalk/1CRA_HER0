;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::BasicExecutorStatus)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'BasicExecutorStatus (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BASICEXECUTORSTATUS")
  (make-package "HERO_MSGS::BASICEXECUTORSTATUS"))

(in-package "ROS")
;;//! \htmlinclude BasicExecutorStatus.msg.html


(intern "*MOVE_TO_POSITION*" (find-package "HERO_MSGS::BASICEXECUTORSTATUS"))
(shadow '*MOVE_TO_POSITION* (find-package "HERO_MSGS::BASICEXECUTORSTATUS"))
(defconstant hero_msgs::BasicExecutorStatus::*MOVE_TO_POSITION* 1)
(intern "*ATTACK_ROBOT*" (find-package "HERO_MSGS::BASICEXECUTORSTATUS"))
(shadow '*ATTACK_ROBOT* (find-package "HERO_MSGS::BASICEXECUTORSTATUS"))
(defconstant hero_msgs::BasicExecutorStatus::*ATTACK_ROBOT* 2)
(intern "*IDLE*" (find-package "HERO_MSGS::BASICEXECUTORSTATUS"))
(shadow '*IDLE* (find-package "HERO_MSGS::BASICEXECUTORSTATUS"))
(defconstant hero_msgs::BasicExecutorStatus::*IDLE* 3)
(defclass hero_msgs::BasicExecutorStatus
  :super ros::object
  :slots (_state _saying _robot_name _target_name _move_x _move_y ))

(defmethod hero_msgs::BasicExecutorStatus
  (:init
   (&key
    ((:state __state) 0)
    ((:saying __saying) "")
    ((:robot_name __robot_name) "")
    ((:target_name __target_name) "")
    ((:move_x __move_x) 0.0)
    ((:move_y __move_y) 0.0)
    )
   (send-super :init)
   (setq _state (round __state))
   (setq _saying (string __saying))
   (setq _robot_name (string __robot_name))
   (setq _target_name (string __target_name))
   (setq _move_x (float __move_x))
   (setq _move_y (float __move_y))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:saying
   (&optional __saying)
   (if __saying (setq _saying __saying)) _saying)
  (:robot_name
   (&optional __robot_name)
   (if __robot_name (setq _robot_name __robot_name)) _robot_name)
  (:target_name
   (&optional __target_name)
   (if __target_name (setq _target_name __target_name)) _target_name)
  (:move_x
   (&optional __move_x)
   (if __move_x (setq _move_x __move_x)) _move_x)
  (:move_y
   (&optional __move_y)
   (if __move_y (setq _move_y __move_y)) _move_y)
  (:serialization-length
   ()
   (+
    ;; uint8 _state
    1
    ;; string _saying
    4 (length _saying)
    ;; string _robot_name
    4 (length _robot_name)
    ;; string _target_name
    4 (length _target_name)
    ;; float64 _move_x
    8
    ;; float64 _move_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _state
       (write-byte _state s)
     ;; string _saying
       (write-long (length _saying) s) (princ _saying s)
     ;; string _robot_name
       (write-long (length _robot_name) s) (princ _robot_name s)
     ;; string _target_name
       (write-long (length _target_name) s) (princ _target_name s)
     ;; float64 _move_x
       (sys::poke _move_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _move_y
       (sys::poke _move_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _saying
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _saying (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _target_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _target_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _move_x
     (setq _move_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _move_y
     (setq _move_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get hero_msgs::BasicExecutorStatus :md5sum-) "6355e6033a487f335fe4d99196ec3f6b")
(setf (get hero_msgs::BasicExecutorStatus :datatype-) "hero_msgs/BasicExecutorStatus")
(setf (get hero_msgs::BasicExecutorStatus :definition-)
      "uint8 MOVE_TO_POSITION = 1
uint8 ATTACK_ROBOT = 2
uint8 IDLE = 3
uint8 state
string saying
string robot_name
string target_name
float64 move_x
float64 move_y

")



(provide :hero_msgs/BasicExecutorStatus "6355e6033a487f335fe4d99196ec3f6b")


