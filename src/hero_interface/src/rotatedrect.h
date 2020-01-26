#ifndef ROTATEDRECT_H
#define ROTATEDRECT_H

#include <QtGui>

#define M_PI_180 (0.01745329)

class RotatedRect
{
public:


    RotatedRect();
    RotatedRect(float cx, float cy, float w, float h, float angle);
    RotatedRect(const QPointF& center, const QSizeF& size, float angle);

    float cx;
    float cy;
    float w;
    float h;
    float angle;

    void points(QPointF pts[]) const;
    //QRectF boundingRect() const;

    //QPointF center() const {return QPointF(cx, cy);}
    //QSizeF size() const {return QSizeF(w, h);}
    bool isNull() const {return qFuzzyIsNull(w) || qFuzzyIsNull(h);}
    //QRotatedRect operator+(QPointF pt){return QRotatedRect(this->center() + pt, this->size(), this->angle);}
    //QRotatedRect operator-(QPointF pt){return QRotatedRect(this->center() - pt, this->size(), this->angle);}
};


#endif // ROTATEDRECT_H
