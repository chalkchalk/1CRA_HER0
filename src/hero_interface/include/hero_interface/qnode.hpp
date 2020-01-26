/**
 * @file /include/hero_interface/qnode.hpp
 *
 * @brief Communications central!
 *
 * @date February 2011
 **/
/*****************************************************************************
** Ifdefs
*****************************************************************************/

#ifndef hero_interface_QNODE_HPP_
#define hero_interface_QNODE_HPP_

/*****************************************************************************
** Includes
*****************************************************************************/

// To workaround boost/qt4 problems that won't be bugfixed. Refer to
//    https://bugreports.qt.io/browse/QTBUG-22829
#ifndef Q_MOC_RUN
#include <ros/ros.h>
#endif
#include <string>
#include <QThread>
#include <QStringListModel>
#include "nav_msgs//Odometry.h"
#include "battleview.h"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace hero_interface {

/*****************************************************************************
** Class
*****************************************************************************/
class BattleView;
class QNode : public QThread {
    Q_OBJECT
public:
    QNode(int argc, char** argv,BattleView *parentBattleView);
	virtual ~QNode();
	bool init();
	bool init(const std::string &master_url, const std::string &host_url);
	void run();

	/*********************
	** Logging
	**********************/
	enum LogLevel {
	         Debug,
	         Info,
	         Warn,
	         Error,
	         Fatal
	 };

	QStringListModel* loggingModel() { return &logging_model; }
    void PoseCallback(const nav_msgs::Odometry::ConstPtr& msg);

Q_SIGNALS:
    void rosShutdown();

private:
	int init_argc;
	char** init_argv;
	ros::Publisher chatter_publisher;
    ros::Subscriber pose_sub_[4];
    QStringListModel logging_model;
    BattleView *parentBattleView_;
};

}  // namespace hero_interface

#endif /* hero_interface_QNODE_HPP_ */
