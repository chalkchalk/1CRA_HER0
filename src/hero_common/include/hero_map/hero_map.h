/****************************************************************************
 *  Copyright (C) 2019 RoboMaster.
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of 
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 ***************************************************************************/

#ifndef HERO_COMMON_MAP
#define HERO_COMMON_MAP

#include <iostream>
#include <vector>
#include <ros/ros.h>
#include "nav_msgs/OccupancyGrid.h"

namespace hero_common {

double GetMapPointOccupancy(const nav_msgs::OccupancyGrid *map, double x, double y, double threshold = 0.9)
{
    float resolution = map->info.resolution;
    double max_x = map->info.width * resolution;
    double max_y = map->info.height * resolution;
    if(x > max_x || y > max_y || x < 0 || y < 0)
        return 1;
    int x_index = x / resolution;
    int y_index = y / resolution;
    //int index = (x-ox)/resolution+(y-oy)/resolution*width;
    double value = map->data[x_index + y_index * map->info.width] / 100.0;
    return (value > threshold || value < 0);

}

bool LineSegmentIsIntersectMapObstacle(const nav_msgs::OccupancyGrid *map,double x1, double y1, double x2, double y2, int divider = 10, double threshold = 0.9)
{
    int i = 0;
    if(divider < 0)
        divider = 10;
    bool value = false;

    for(i=0;i<divider+1;i++)
    {
        double x_check = (x2 - x1) * i / divider + x1;
        double y_check = (y2 - y1) * i / divider + y1;
        if(GetMapPointOccupancy(map,x_check,y_check))
            value = true;
    }
    return value;
}

}
#endif //HERO_COMMON_MAP
