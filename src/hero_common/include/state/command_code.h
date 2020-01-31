#ifndef COMMAND_H
#define COMMAND_H

#include <string>



namespace hero_common{

enum JudgeSysCommand{


    KILL_ROBOT = 10000,
    REVIVE_ROBOT = 10001,
    RELOAD_ROBOT = 10002,
    DISARM_ROBOT = 10003,

    SHOOT_BULLET = 20000,


    RFID_F1 = 30001,
    RFID_F2 = 30002,
    RFID_F3 = 30003,
    RFID_F4 = 30004,
    RFID_F5 = 30005,
    RFID_F6 = 30006,

    ARMOR_HIT_FRONT = 40000,
    ARMOR_HIT_RIGHT = 40001,
    ARMOR_HIT_BACK = 40002,
    ARMOR_HIT_LEFT = 40003
};


}



#endif // COMMAND_H
