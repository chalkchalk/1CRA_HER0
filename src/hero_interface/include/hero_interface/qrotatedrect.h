#ifndef QROTATEDRECT_H
#define QROTATEDRECT_H


#define M_PI_180 (0.01745329)

struct QRotatedRect
{
    float cx;
    float cy;
    float w;
    float h;
    float angle;

    QRotatedRect(float cx = 0, float cy = 0, float w = 0, float h = 0, float angle = 0);
    QRotatedRect(const QPointF& center, const QSizeF& size, float angle);

    void points(QPointF pts[]) const;
    QRectF boundingRect() const;

    QPointF center() const {return QPointF(cx, cy);}
    QSizeF size() const {return QSizeF(w, h);}
    bool isNull() const {return qFuzzyIsNull(w) || qFuzzyIsNull(h);}
    QRotatedRect operator+(QPointF pt){return QRotatedRect(this->center() + pt, this->size(), this->angle);}
    QRotatedRect operator-(QPointF pt){return QRotatedRect(this->center() - pt, this->size(), this->angle);}
};

#endif // QROTATEDRECT_H
