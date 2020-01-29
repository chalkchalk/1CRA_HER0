#ifndef BULLET_H
#define BULLET_H

#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include "state/error_code.h"
#include "robot_tf.h"
#include "math/geometry.h"

namespace HeroMultistage {
using hero_common::Point2D;

    class Bullet{
    public:
        Bullet(std::string shooter,double x,double y,double yaw,double speed);
        ~Bullet() = default;
        void PublishBulletTF();
        void Move(int frequency);
        std::string GetShooter()
        {return shooter_;}
        bool HitSomething();
    private:
        std::string shooter_;
        double speed_;
        double yaw_;//form blue to red is 0, anciclockwise positive
        Point2D origin_;
        Point2D position_now_;

    };


}



#endif // BULLET_H
