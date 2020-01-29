#include "bullet.h"


#define DegreeToRad(a) ((a)* 3.1415926 /180.0)

namespace HeroMultistage {
    using hero_common::Point2D;

    Bullet::Bullet(std::string shooter,double x,double y,double yaw,double speed):
        shooter_(shooter),
        speed_(speed),
        yaw_(yaw),
        origin_(x,y),
        position_now_(0,0)
    {


    }

    void Bullet::Move(int frequency)
    {
        double dx = std::cos(DegreeToRad(yaw_)) * speed_ / frequency;
        double dy = std::sin(DegreeToRad(yaw_)) * speed_ / frequency;
        position_now_ += Point2D (dx,dy);
    }

    bool Bullet::HitSomething()
    {

    }

    void Bullet::PublishBulletTF()
    {

    }


}








