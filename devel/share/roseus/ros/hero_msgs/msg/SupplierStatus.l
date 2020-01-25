;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::SupplierStatus)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'SupplierStatus (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::SUPPLIERSTATUS")
  (make-package "HERO_MSGS::SUPPLIERSTATUS"))

(in-package "ROS")
;;//! \htmlinclude SupplierStatus.msg.html


(intern "*CLOSE*" (find-package "HERO_MSGS::SUPPLIERSTATUS"))
(shadow '*CLOSE* (find-package "HERO_MSGS::SUPPLIERSTATUS"))
(defconstant hero_msgs::SupplierStatus::*CLOSE* 0)
(intern "*PREPARING*" (find-package "HERO_MSGS::SUPPLIERSTATUS"))
(shadow '*PREPARING* (find-package "HERO_MSGS::SUPPLIERSTATUS"))
(defconstant hero_msgs::SupplierStatus::*PREPARING* 1)
(intern "*SUPPLYING*" (find-package "HERO_MSGS::SUPPLIERSTATUS"))
(shadow '*SUPPLYING* (find-package "HERO_MSGS::SUPPLIERSTATUS"))
(defconstant hero_msgs::SupplierStatus::*SUPPLYING* 2)
(defclass hero_msgs::SupplierStatus
  :super ros::object
  :slots (_status ))

(defmethod hero_msgs::SupplierStatus
  (:init
   (&key
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _status (round __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; uint8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get hero_msgs::SupplierStatus :md5sum-) "81f3d032e85b689acf259876e6f8d051")
(setf (get hero_msgs::SupplierStatus :datatype-) "hero_msgs/SupplierStatus")
(setf (get hero_msgs::SupplierStatus :definition-)
      "#supplier status
uint8 CLOSE = 0
uint8 PREPARING = 1
uint8 SUPPLYING = 2
uint8 status


")



(provide :hero_msgs/SupplierStatus "81f3d032e85b689acf259876e6f8d051")


