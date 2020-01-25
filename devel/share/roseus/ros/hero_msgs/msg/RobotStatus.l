;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::RobotStatus)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'RobotStatus (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::ROBOTSTATUS")
  (make-package "HERO_MSGS::ROBOTSTATUS"))

(in-package "ROS")
;;//! \htmlinclude RobotStatus.msg.html


(defclass hero_msgs::RobotStatus
  :super ros::object
  :slots (_id _level _remain_hp _max_hp _heat_cooling_limit _heat_cooling_rate _gimbal_output _chassis_output _shooter_output ))

(defmethod hero_msgs::RobotStatus
  (:init
   (&key
    ((:id __id) 0)
    ((:level __level) 0)
    ((:remain_hp __remain_hp) 0)
    ((:max_hp __max_hp) 0)
    ((:heat_cooling_limit __heat_cooling_limit) 0)
    ((:heat_cooling_rate __heat_cooling_rate) 0)
    ((:gimbal_output __gimbal_output) nil)
    ((:chassis_output __chassis_output) nil)
    ((:shooter_output __shooter_output) nil)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _level (round __level))
   (setq _remain_hp (round __remain_hp))
   (setq _max_hp (round __max_hp))
   (setq _heat_cooling_limit (round __heat_cooling_limit))
   (setq _heat_cooling_rate (round __heat_cooling_rate))
   (setq _gimbal_output __gimbal_output)
   (setq _chassis_output __chassis_output)
   (setq _shooter_output __shooter_output)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:level
   (&optional __level)
   (if __level (setq _level __level)) _level)
  (:remain_hp
   (&optional __remain_hp)
   (if __remain_hp (setq _remain_hp __remain_hp)) _remain_hp)
  (:max_hp
   (&optional __max_hp)
   (if __max_hp (setq _max_hp __max_hp)) _max_hp)
  (:heat_cooling_limit
   (&optional __heat_cooling_limit)
   (if __heat_cooling_limit (setq _heat_cooling_limit __heat_cooling_limit)) _heat_cooling_limit)
  (:heat_cooling_rate
   (&optional __heat_cooling_rate)
   (if __heat_cooling_rate (setq _heat_cooling_rate __heat_cooling_rate)) _heat_cooling_rate)
  (:gimbal_output
   (&optional __gimbal_output)
   (if __gimbal_output (setq _gimbal_output __gimbal_output)) _gimbal_output)
  (:chassis_output
   (&optional __chassis_output)
   (if __chassis_output (setq _chassis_output __chassis_output)) _chassis_output)
  (:shooter_output
   (&optional __shooter_output)
   (if __shooter_output (setq _shooter_output __shooter_output)) _shooter_output)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; uint8 _level
    1
    ;; uint16 _remain_hp
    2
    ;; uint16 _max_hp
    2
    ;; uint16 _heat_cooling_limit
    2
    ;; uint16 _heat_cooling_rate
    2
    ;; bool _gimbal_output
    1
    ;; bool _chassis_output
    1
    ;; bool _shooter_output
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; uint8 _level
       (write-byte _level s)
     ;; uint16 _remain_hp
       (write-word _remain_hp s)
     ;; uint16 _max_hp
       (write-word _max_hp s)
     ;; uint16 _heat_cooling_limit
       (write-word _heat_cooling_limit s)
     ;; uint16 _heat_cooling_rate
       (write-word _heat_cooling_rate s)
     ;; bool _gimbal_output
       (if _gimbal_output (write-byte -1 s) (write-byte 0 s))
     ;; bool _chassis_output
       (if _chassis_output (write-byte -1 s) (write-byte 0 s))
     ;; bool _shooter_output
       (if _shooter_output (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _level
     (setq _level (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _remain_hp
     (setq _remain_hp (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _max_hp
     (setq _max_hp (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _heat_cooling_limit
     (setq _heat_cooling_limit (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _heat_cooling_rate
     (setq _heat_cooling_rate (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _gimbal_output
     (setq _gimbal_output (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _chassis_output
     (setq _chassis_output (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _shooter_output
     (setq _shooter_output (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hero_msgs::RobotStatus :md5sum-) "122334534857c1294574d2c7eef57af5")
(setf (get hero_msgs::RobotStatus :datatype-) "hero_msgs/RobotStatus")
(setf (get hero_msgs::RobotStatus :definition-)
      "#robot status
uint8 id
uint8 level
uint16 remain_hp
uint16 max_hp
uint16 heat_cooling_limit
uint16 heat_cooling_rate
bool gimbal_output
bool chassis_output
bool shooter_output
")



(provide :hero_msgs/RobotStatus "122334534857c1294574d2c7eef57af5")


