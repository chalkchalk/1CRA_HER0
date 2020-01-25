;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::FricWhl)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'FricWhl (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::FRICWHL")
  (make-package "HERO_MSGS::FRICWHL"))
(unless (find-package "HERO_MSGS::FRICWHLREQUEST")
  (make-package "HERO_MSGS::FRICWHLREQUEST"))
(unless (find-package "HERO_MSGS::FRICWHLRESPONSE")
  (make-package "HERO_MSGS::FRICWHLRESPONSE"))

(in-package "ROS")





(defclass hero_msgs::FricWhlRequest
  :super ros::object
  :slots (_open ))

(defmethod hero_msgs::FricWhlRequest
  (:init
   (&key
    ((:open __open) nil)
    )
   (send-super :init)
   (setq _open __open)
   self)
  (:open
   (&optional __open)
   (if __open (setq _open __open)) _open)
  (:serialization-length
   ()
   (+
    ;; bool _open
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _open
       (if _open (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _open
     (setq _open (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass hero_msgs::FricWhlResponse
  :super ros::object
  :slots (_received ))

(defmethod hero_msgs::FricWhlResponse
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

(defclass hero_msgs::FricWhl
  :super ros::object
  :slots ())

(setf (get hero_msgs::FricWhl :md5sum-) "1a044c2743c5efe1a86f5bca57f520c6")
(setf (get hero_msgs::FricWhl :datatype-) "hero_msgs/FricWhl")
(setf (get hero_msgs::FricWhl :request) hero_msgs::FricWhlRequest)
(setf (get hero_msgs::FricWhl :response) hero_msgs::FricWhlResponse)

(defmethod hero_msgs::FricWhlRequest
  (:response () (instance hero_msgs::FricWhlResponse :init)))

(setf (get hero_msgs::FricWhlRequest :md5sum-) "1a044c2743c5efe1a86f5bca57f520c6")
(setf (get hero_msgs::FricWhlRequest :datatype-) "hero_msgs/FricWhlRequest")
(setf (get hero_msgs::FricWhlRequest :definition-)
      "bool open
---
bool received

")

(setf (get hero_msgs::FricWhlResponse :md5sum-) "1a044c2743c5efe1a86f5bca57f520c6")
(setf (get hero_msgs::FricWhlResponse :datatype-) "hero_msgs/FricWhlResponse")
(setf (get hero_msgs::FricWhlResponse :definition-)
      "bool open
---
bool received

")



(provide :hero_msgs/FricWhl "1a044c2743c5efe1a86f5bca57f520c6")


