;; Auto-generated. Do not edit!


(when (boundp 'hero_msgs::ArmorDetectionResult)
  (if (not (find-package "HERO_MSGS"))
    (make-package "HERO_MSGS"))
  (shadow 'ArmorDetectionResult (find-package "HERO_MSGS")))
(unless (find-package "HERO_MSGS::ARMORDETECTIONRESULT")
  (make-package "HERO_MSGS::ARMORDETECTIONRESULT"))

(in-package "ROS")
;;//! \htmlinclude ArmorDetectionResult.msg.html


(defclass hero_msgs::ArmorDetectionResult
  :super ros::object
  :slots (_result ))

(defmethod hero_msgs::ArmorDetectionResult
  (:init
   (&key
    ((:result __result) 0.0)
    )
   (send-super :init)
   (setq _result (float __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; float32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _result
       (sys::poke _result (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _result
     (setq _result (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get hero_msgs::ArmorDetectionResult :md5sum-) "db954e5de3aba73b237d07575e5cac28")
(setf (get hero_msgs::ArmorDetectionResult :datatype-) "hero_msgs/ArmorDetectionResult")
(setf (get hero_msgs::ArmorDetectionResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
float32 result

")



(provide :hero_msgs/ArmorDetectionResult "db954e5de3aba73b237d07575e5cac28")


