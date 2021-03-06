// Generated by gencpp from file hero_msgs/Position.msg
// DO NOT EDIT!


#ifndef HERO_MSGS_MESSAGE_POSITION_H
#define HERO_MSGS_MESSAGE_POSITION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace hero_msgs
{
template <class ContainerAllocator>
struct Position_
{
  typedef Position_<ContainerAllocator> Type;

  Position_()
    : x(0.0)
    , y(0.0)
    , yaw(0.0)  {
    }
  Position_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , yaw(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _yaw_type;
  _yaw_type yaw;





  typedef boost::shared_ptr< ::hero_msgs::Position_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hero_msgs::Position_<ContainerAllocator> const> ConstPtr;

}; // struct Position_

typedef ::hero_msgs::Position_<std::allocator<void> > Position;

typedef boost::shared_ptr< ::hero_msgs::Position > PositionPtr;
typedef boost::shared_ptr< ::hero_msgs::Position const> PositionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hero_msgs::Position_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hero_msgs::Position_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace hero_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'hero_msgs': ['/home/ycz/ICRA_HERO_ws/devel/share/hero_msgs/msg', '/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg', '/home/ycz/ICRA_HERO_ws/src/hero_msgs/msg/referee_system'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::hero_msgs::Position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hero_msgs::Position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hero_msgs::Position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hero_msgs::Position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hero_msgs::Position_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hero_msgs::Position_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hero_msgs::Position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b71344c0ba01936756dc45bcd89ef437";
  }

  static const char* value(const ::hero_msgs::Position_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb71344c0ba019367ULL;
  static const uint64_t static_value2 = 0x56dc45bcd89ef437ULL;
};

template<class ContainerAllocator>
struct DataType< ::hero_msgs::Position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hero_msgs/Position";
  }

  static const char* value(const ::hero_msgs::Position_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hero_msgs::Position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n\
float64 y\n\
float64 yaw\n\
";
  }

  static const char* value(const ::hero_msgs::Position_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hero_msgs::Position_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.yaw);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Position_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hero_msgs::Position_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hero_msgs::Position_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "yaw: ";
    Printer<double>::stream(s, indent + "  ", v.yaw);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HERO_MSGS_MESSAGE_POSITION_H
