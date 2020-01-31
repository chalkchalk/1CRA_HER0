;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::Buffinfo)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'Buffinfo (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::BUFFINFO")
  (make-package "HERO_MSGS::BUFFINFO"))

(in-package "ROS")
;;//! \htmlinclude Buffinfo.msg.html


(intern "*RED_HEAL*" (find-package "HERO_MSGS::BUFFINFO"))
(shadow '*RED_HEAL* (find-package "HERO_MSGS::BUFFINFO"))
(defconstant hero_msgs::Buffinfo::*RED_HEAL* 0)
(intern "*BLUE_HEAL*" (find-package "HERO_MSGS::BUFFINFO"))
(shadow '*BLUE_HEAL* (find-package "HERO_MSGS::BUFFINFO"))
(defconstant hero_msgs::Buffinfo::*BLUE_HEAL* 1)
(intern "*RED_RELOAD*" (find-package "HERO_MSGS::BUFFINFO"))
(shadow '*RED_RELOAD* (find-package "HERO_MSGS::BUFFINFO"))
(defconstant hero_msgs::Buffinfo::*RED_RELOAD* 2)
(intern "*BLUE_RELOAD*" (find-package "HERO_MSGS::BUFFINFO"))
(shadow '*BLUE_RELOAD* (find-package "HERO_MSGS::BUFFINFO"))
(defconstant hero_msgs::Buffinfo::*BLUE_RELOAD* 3)
(intern "*MOVE_DEBUFF*" (find-package "HERO_MSGS::BUFFINFO"))
(shadow '*MOVE_DEBUFF* (find-package "HERO_MSGS::BUFFINFO"))
(defconstant hero_msgs::Buffinfo::*MOVE_DEBUFF* 4)
(intern "*SHOOT_DEBUFF*" (find-package "HERO_MSGS::BUFFINFO"))
(shadow '*SHOOT_DEBUFF* (find-package "HERO_MSGS::BUFFINFO"))
(defconstant hero_msgs::Buffinfo::*SHOOT_DEBUFF* 5)
(defclass hero_msgs::Buffinfo
  :super ros::object
  :slots (_buff_data _activated ))

(defmethod hero_msgs::Buffinfo
  (:init
   (&key
    ((:buff_data __buff_data) (make-array 0 :initial-element 0 :element-type :char))
    ((:activated __activated) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _buff_data __buff_data)
   (setq _activated __activated)
   self)
  (:buff_data
   (&optional __buff_data)
   (if __buff_data (setq _buff_data __buff_data)) _buff_data)
  (:activated
   (&optional __activated)
   (if __activated (setq _activated __activated)) _activated)
  (:serialization-length
   ()
   (+
    ;; uint8[] _buff_data
    (* 1    (length _buff_data)) 4
    ;; bool[] _activated
    (* 1    (length _activated)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _buff_data
     (write-long (length _buff_data) s)
     (princ _buff_data s)
     ;; bool[] _activated
     (write-long (length _activated) s)
     (dotimes (i (length _activated))
       (if (elt _activated i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _buff_data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _buff_data (make-array n :element-type :char))
     (replace _buff_data buf :start2 ptr-) (incf ptr- n))
   ;; bool[] _activated
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _activated (make-list n))
     (dotimes (i n)
     (setf (elt _activated i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get hero_msgs::Buffinfo :md5sum-) "1c4f9c4da40ff47acceafd74940384f2")
(setf (get hero_msgs::Buffinfo :datatype-) "hero_msgs/Buffinfo")
(setf (get hero_msgs::Buffinfo :definition-)
      "uint8 RED_HEAL = 0
uint8 BLUE_HEAL = 1
uint8 RED_RELOAD = 2
uint8 BLUE_RELOAD = 3
uint8 MOVE_DEBUFF = 4
uint8 SHOOT_DEBUFF = 5
uint8[] buff_data
bool[] activated




")



(provide :hero_msgs/Buffinfo "1c4f9c4da40ff47acceafd74940384f2")


