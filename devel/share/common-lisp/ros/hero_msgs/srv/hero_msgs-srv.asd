
(cl:in-package :asdf)

(defsystem "hero_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FricWhl" :depends-on ("_package_FricWhl"))
    (:file "_package_FricWhl" :depends-on ("_package"))
    (:file "GimbalMode" :depends-on ("_package_GimbalMode"))
    (:file "_package_GimbalMode" :depends-on ("_package"))
    (:file "JudgeSysControl" :depends-on ("_package_JudgeSysControl"))
    (:file "_package_JudgeSysControl" :depends-on ("_package"))
    (:file "ShootCmd" :depends-on ("_package_ShootCmd"))
    (:file "_package_ShootCmd" :depends-on ("_package"))
  ))