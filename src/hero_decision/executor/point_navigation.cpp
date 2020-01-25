#include "ros/ros.h"
#include "std_msgs/String.h"
#include "chassis_executor.h"
#include <actionlib/client/simple_action_client.h>
#include "hero_msgs/GlobalPlannerAction.h"
#include "hero_msgs/LocalPlannerAction.h"

namespace hero_decision{

class PointNavigation{
typedef actionlib::SimpleActionClient<hero_msgs::GlobalPlannerAction> GlobalActionClient;
  typedef actionlib::SimpleActionClient<hero_msgs::LocalPlannerAction> LocalActionClient;
  public:
  PointNavigation();
  ~PointNavigation()=default;
  //! global planner actionlib client
  actionlib::SimpleActionClient<hero_msgs::GlobalPlannerAction> global_planner_client_;
  //! local planner actionlib client
  actionlib::SimpleActionClient<hero_msgs::LocalPlannerAction> local_planner_client_;
  //! global planner actionlib goal
  hero_msgs::GlobalPlannerGoal global_planner_goal_;
  //! local planner actionlib goal
  hero_msgs::LocalPlannerGoal local_planner_goal_;
  ros::Subscriber sub_;
  void GlobalPlannerFeedbackCallback(const hero_msgs::GlobalPlannerFeedbackConstPtr& global_planner_feedback);
  void chatterCallback(const geometry_msgs::PoseStamped &goal);

};

void PointNavigation::chatterCallback(const geometry_msgs::PoseStamped &goal)
{
  global_planner_goal_.goal = goal;
  global_planner_client_.sendGoal(global_planner_goal_,
                                  GlobalActionClient::SimpleDoneCallback(),
                                  GlobalActionClient::SimpleActiveCallback(),
                                  boost::bind(&PointNavigation::GlobalPlannerFeedbackCallback, this, _1));
								  
	ROS_INFO("goal set! ");
}

PointNavigation::PointNavigation():global_planner_client_("global_planner_node_action", true),
                                   local_planner_client_("local_planner_node_action", true)
{
  ros::NodeHandle nh;
  sub_ = nh.subscribe("/move_base_simple/goal", 1000, &PointNavigation::chatterCallback,this);
  ROS_INFO("PointNavigation start!");
  global_planner_client_.waitForServer();
  ROS_INFO("Global planer server start!");
  local_planner_client_.waitForServer();
  ROS_INFO("Local planer server start!");
}


void PointNavigation::GlobalPlannerFeedbackCallback(const hero_msgs::GlobalPlannerFeedbackConstPtr& global_planner_feedback){
  if (!global_planner_feedback->path.poses.empty()) {
    //ROS_INFO("global_planner_feedback");
    local_planner_goal_.route = global_planner_feedback->path;
    local_planner_client_.sendGoal(local_planner_goal_);
  }

}

}
int main(int argc, char **argv)
{
	/**
	 * The ros::init() function needs to see argc and argv so that it can perform
	 * any ROS arguments and name remapping that were provided at the command line.
	 * For programmatic remappings you can use a different version of init() which takes
	 * remappings directly, but for most command-line programs, passing argc and argv is
	 * the easiest way to do it.  The third argument to init() is the name of the node.
	 *
	 * You must call one of the versions of ros::init() before using any other
	 * part of the ROS system.
	 */
	ros::init(argc, argv, "point_navigation");
	auto PointNavigation = new hero_decision::PointNavigation;
	




	/**
	 * ros::spin() will enter a loop, pumping callbacks.  With this version, all
	 * callbacks will be called from within this thread (the main one).  ros::spin()
	 * will exit when Ctrl-C is pressed, or the node is shutdown by the master.
	 */
	ros::spin();

	return 0;
}