// Generated by gencpp from file hero_msgs/LocalPlannerGoal.msg
// DO NOT EDIT!


#ifndef HERO_MSGS_MESSAGE_LOCALPLANNERGOAL_H
#define HERO_MSGS_MESSAGE_LOCALPLANNERGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <nav_msgs/Path.h>

namespace hero_msgs
{
template <class ContainerAllocator>
struct LocalPlannerGoal_
{
  typedef LocalPlannerGoal_<ContainerAllocator> Type;

  LocalPlannerGoal_()
    : route()  {
    }
  LocalPlannerGoal_(const ContainerAllocator& _alloc)
    : route(_alloc)  {
  (void)_alloc;
    }



   typedef  ::nav_msgs::Path_<ContainerAllocator>  _route_type;
  _route_type route;





  typedef boost::shared_ptr< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> const> ConstPtr;

}; // struct LocalPlannerGoal_

typedef ::hero_msgs::LocalPlannerGoal_<std::allocator<void> > LocalPlannerGoal;

typedef boost::shared_ptr< ::hero_msgs::LocalPlannerGoal > LocalPlannerGoalPtr;
typedef boost::shared_ptr< ::hero_msgs::LocalPlannerGoal const> LocalPlannerGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace hero_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'hero_msgs': ['/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg', '/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg', '/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c9406e3970e812deed30e863deddb6d6";
  }

  static const char* value(const ::hero_msgs::LocalPlannerGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc9406e3970e812deULL;
  static const uint64_t static_value2 = 0xed30e863deddb6d6ULL;
};

template<class ContainerAllocator>
struct DataType< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hero_msgs/LocalPlannerGoal";
  }

  static const char* value(const ::hero_msgs::LocalPlannerGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#goal definition\n\
nav_msgs/Path route\n\
\n\
================================================================================\n\
MSG: nav_msgs/Path\n\
#An array of poses that represents a Path for a robot to follow\n\
Header header\n\
geometry_msgs/PoseStamped[] poses\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::hero_msgs::LocalPlannerGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.route);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LocalPlannerGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hero_msgs::LocalPlannerGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hero_msgs::LocalPlannerGoal_<ContainerAllocator>& v)
  {
    s << indent << "route: ";
    s << std::endl;
    Printer< ::nav_msgs::Path_<ContainerAllocator> >::stream(s, indent + "  ", v.route);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HERO_MSGS_MESSAGE_LOCALPLANNERGOAL_H
