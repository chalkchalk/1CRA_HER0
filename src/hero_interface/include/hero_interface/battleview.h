#ifndef BATTLEVIEW_H
#define BATTLEVIEW_H

#include <vector>
#include <QtGui>
#include "../include/hero_interface/qnode.hpp"

namespace hero_interface {


#define ROBOT_WIDTH 0.5
#define ROBOT_HEIGHT 0.6

#define ROBOT_WIDTH_PIX 100
#define ROBOT_HEIGHT_PIX 120

#define BATTLEFIELD_W 8.54
#define BATTLEFIELD_H 5.54

#define BATTLEFIELD_PIX_W 554
#define BATTLEFIELD_PIX_H 854

#define BULLET_RADIUS_PIX   8
class QNode;

struct Pose
{
    Pose(float x_, float y_,float yaw_) :x(x_), y(y_), yaw(yaw_){}//有参构造
    Pose() :x(0), y(0), yaw(0){}
    float x;
    float y;
    float yaw;

};

class Robot
{
public:
    Robot(){
        health = 2000;
        heat = 0;
    };
    Robot(std::string robot_name, std::string robot_color){
        selected = false;
        health = 2000;
        heat = 0;
        color = robot_color;
        name = robot_name;
        SetDest = Pose(0,0,0);
        if(robot_name == "robot_0")
            index = 0;
        else if(robot_name == "robot_1")
            index = 1;
        else if(robot_name == "robot_2")
            index = 2;
        else if(robot_name == "robot_3")
            index = 3;
        else {
            index = -1;
        }
    };
    std::string color;
    std::string name;
    int index;
    int health;
    int heat;
    Pose pose;
    bool selected;
    Pose SetDest;
};


class BattleView
{
public:
    BattleView(QNode *qNode);
    void AddRobot(Robot*  robot)
    {
         robots_.push_back(robot);
    }
    Robot* FindRobot(std::string robot_name);
    void GetBattleView(QImage *qImage);
    bool SetRobotPose(std::string robot_num,float x, float y, float yaw);
    void ImageToPosePoint(double *pose_x, double *pose_y, int image_x, int image_y);
    void SetRobotGoalPoint(int image_x,int image_y);
    void LeftButtonPress(int x, int y);
    void LeftButtonDrag(int x, int y);
    void LeftButtonRelease(int x, int y);
    void RightButtonPress(int x, int y);
    void AimPointRobot0(int x,int y);
    bool isRTS;
    bool isACT;
 private:
    std::vector<Robot*> robots_;
    void DrawRobot(QImage *qImage);
    void UpdateHealthHeat();
    QImage background;
    QPainter painter;
    QNode *qNode_;
    QImage buffImage[6];
    QPoint lastPoint;
    QPoint dragingPoint;
    bool isDraging;
    bool isMousePressed;
    bool inImageScope(int x, int y);
};

}
#endif // BATTLEVIEW_H
