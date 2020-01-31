#include "robot_tf.h"
#include "hero_math/geometry.h"
#include "hero_math/math.h"

#define DegreeToRad(a) ((a)* 3.1415926 /180.0)
#define RadToDegree(a) ((a)/ 3.1415926 *180.0)

namespace HeroMultistage {

    using hero_common::ErrorCode;
    using hero_common::ErrorInfo;
    using hero_common::Point2D;
    using hero_common::Polygon2D;
    using hero_common::LineSegment2D;

    RobotTF::RobotTF(std::string robot_name):
        gimbal_yaw_(0)
    {
        if (Init(robot_name).IsOK()) {
         ROS_INFO("[robot_physicis]robot %s added.",robot_name.c_str());
       } else {
         ROS_ERROR("[robot_physicis]fail to add robot: %s.",robot_name.c_str());
       }
    }

    ErrorInfo RobotTF::Init(std::string robot_name) {
        robot_name_ = robot_name;

        return ErrorInfo(ErrorCode::OK);
    }


    void RobotTF::PublishArmorTF()
    {
        tf::Transform transform;
        tf::Quaternion q;

        /*
        armor_tf[0].setOrigin(tf::Vector3(RobotLength/2,0,0));
        q.setRPY(0,0,DegreeToRad(0));
        armor_tf[0].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[0],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_front"));

        armor_tf[3].setOrigin(tf::Vector3(- RobotLength/2,0,0));
        q.setRPY(0,0,DegreeToRad(180));
        armor_tf[3].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[3],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_back"));

        armor_tf[1].setOrigin(tf::Vector3(0,RobotWidth/2,0));
        q.setRPY(0,0,DegreeToRad(90));
        armor_tf[1].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[1],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_left"));

        armor_tf[2].setOrigin(tf::Vector3(0, - RobotWidth /2,0));
        q.setRPY(0,0,DegreeToRad(-90));
        armor_tf[2].setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(armor_tf[2],ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/armor_right"));

        q.setRPY(0,0,DegreeToRad(gimbal_yaw_));
        transform.setOrigin(tf::Vector3(0,0,0));
        transform.setRotation(q);
        broadcaster_.sendTransform(tf::StampedTransform(transform,ros::Time::now(),robot_name_ + "/base_pose_ground_truth",robot_name_ + "/gimbal"));
*/

    }

    float RobotTF::GetGimbalAbsoluteYaw()
    {
        double roll,pitch,yaw;
        tf::Matrix3x3(robot_tf.getRotation()).getRPY(roll, pitch, yaw);
        gimbal_yaw_absolute_ = (RadToDegree(yaw) + gimbal_yaw_);
        return gimbal_yaw_absolute_;

    }

    int RobotTF::BulletHitDetect(Bullet bullet,std::vector<Point2D> *pointsfeedback)
    {
        double roll,pitch,yaw;
        int i;
        tf::Matrix3x3(robot_tf.getRotation()).getRPY(roll, pitch, yaw);
        Point2D chassisMid(robot_tf.getOrigin().getX(),robot_tf.getOrigin().getY());
        double chassisYaw = yaw;
        LineSegment2D bulletSeg(bullet.GetPositionNow(),bullet.GetPositionLast());
        Point2D interSectionPoint;
        std::vector<Point2D> pointsIntersect;
        Point2D chassisSidesMid[4];
        std::vector<int> sides;
        pointsfeedback->clear();
        pointsfeedback->emplace_back(chassisMid);
        bool isHit = false;
        if(bullet.GetShooter() == robot_name_)
            return 0;
        for(i=0;i<4;i++) //front left back right
        {
            Point2D chassisLeft = hero_common::PointRotateAroundPoint(Point2D(RobotLength*0.5, RobotWidth*0.5) + chassisMid, chassisMid, chassisYaw - i * 3.14159 * 0.5);
            Point2D chassisRight = hero_common::PointRotateAroundPoint(Point2D(RobotLength*0.5, -RobotWidth*0.5) + chassisMid, chassisMid, chassisYaw - i * 3.14159 * 0.5);
            pointsfeedback->emplace_back(chassisLeft);
            pointsfeedback->emplace_back(chassisRight);
            chassisSidesMid[i] = (chassisLeft + chassisRight) * 0.5;
            LineSegment2D chassisEdge(chassisLeft,chassisRight);
            if(hero_common::CheckLineSegmentsIntersection2D(chassisEdge,bulletSeg,&interSectionPoint))
            {
                isHit = true;
                  //if(hero_common::PointDistance(interSectionPoint,chassisSidesMid[i]) < AromrLength * 0.5)
                  //{
                        pointsIntersect.emplace_back(interSectionPoint);
                        sides.emplace_back(i);
                  //}
            }
        }
        if(!isHit)
            return 0;

        Point2D firstPointIntersect;
        double minDistance = 100;
        int index = 0;

        for(i=0;i<pointsIntersect.size();i++)
        {
            if(minDistance > hero_common::PointDistance(bullet.GetPositionLast(),pointsIntersect[i]))
            {
                minDistance = hero_common::PointDistance(bullet.GetPositionLast(),pointsIntersect[i]);
                firstPointIntersect = pointsIntersect[i];
                index = sides[i];
            }

        }
        if(hero_common::PointDistance(firstPointIntersect,chassisSidesMid[index]) < AromrLength * 0.5)
            return index + 1;
        else {
            return index + 5;
        }
       // ROS_INFO("minDistanceIndex = %d,minDistanceIndex = %f",minDistanceIndex,minDistanceIndex);


    }




}

