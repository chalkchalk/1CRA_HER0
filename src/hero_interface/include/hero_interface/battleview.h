#ifndef BATTLEVIEW_H
#define BATTLEVIEW_H

#include <vector>
#include <QtGui>

namespace hero_interface {

#define POSE_TO_PIX 30
#define ROBOT_WIDTH 20
#define ROBOT_HEIGHT 24

typedef struct
{
    float x;
    float y;
    float yaw;

}Pose;

class Robot
{
public:
    Robot(){
        health = 2000;
        heat = 0;
    };
    Robot(std::string robot_name, std::string robot_color){
        health = 2000;
        heat = 0;
        color = robot_color;
        name = robot_name;
    };
    std::string color;
    std::string name;
    int health;
    int heat;
    Pose pose;
};


class BattleView
{
public:
    BattleView();
    void AddRobot(Robot*  robot)
    {
         robots_.push_back(robot);
    }
    void GetBattleView(QImage *qImage);

 private:
    std::vector<Robot* > robots_;
    void DrawRobot(QImage *qImage);
    QImage background;
    QPainter painter;
};

}
#endif // BATTLEVIEW_H
