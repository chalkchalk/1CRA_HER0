#include "rotatedrect.h"

RotatedRect::RotatedRect(float cx, float cy, float w, float h, float angle)
{
    this->cx = cx;
    this->cy = cy;
    this->w = w;
    this->h = h;
    this->angle = angle;
}

RotatedRect::RotatedRect()
{
    this->cx = 0;
    this->cy = 0;
    this->w = 0;
    this->h = 0;
    this->angle = 0;
}

RotatedRect::RotatedRect(const QPointF &center, const QSizeF &size, float angle)
{
    this->cx = center.x();
    this->cy = center.y();
    this->w = size.width();
    this->h = size.height();
    this->angle = angle;
}

//  pts[0] ------------ pts[1]
//         |          |
//         |          |
//         |    -->   O  箭头方向为正方向. 角度是逆时针为正(与Qt/Halcon方向一致, 与OpenCv方向相反)
//         |          |
//         |          |
//  pts[3] ------------ pts[2]
void RotatedRect::points(QPointF pts[]) const
{
    float fAngle = -angle * M_PI_180;
    float a = (float)sin(fAngle) * 0.5f;
    float b = (float)cos(fAngle) * 0.5f;

    pts[0].setX(cx + a * h - b * w);
    pts[0].setY(cy - b * h - a * w);
    pts[2].setX(2 * cx - pts[0].x());
    pts[2].setY(2 * cy - pts[0].y());

    pts[3].setX(cx - a * h - b * w);
    pts[3].setY(cy + b * h - a * w);
    pts[1].setX(2 * cx - pts[3].x());
    pts[1].setY(2 * cy - pts[3].y());
}
