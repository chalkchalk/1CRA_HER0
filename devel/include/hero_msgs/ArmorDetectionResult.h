// Generated by gencpp from file hero_msgs/ArmorDetectionResult.msg
// DO NOT EDIT!


#ifndef HERO_MSGS_MESSAGE_ARMORDETECTIONRESULT_H
#define HERO_MSGS_MESSAGE_ARMORDETECTIONRESULT_H


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
struct ArmorDetectionResult_
{
  typedef ArmorDetectionResult_<ContainerAllocator> Type;

  ArmorDetectionResult_()
    : result(0.0)  {
    }
  ArmorDetectionResult_(const ContainerAllocator& _alloc)
    : result(0.0)  {
  (void)_alloc;
    }



   typedef float _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> const> ConstPtr;

}; // struct ArmorDetectionResult_

typedef ::hero_msgs::ArmorDetectionResult_<std::allocator<void> > ArmorDetectionResult;

typedef boost::shared_ptr< ::hero_msgs::ArmorDetectionResult > ArmorDetectionResultPtr;
typedef boost::shared_ptr< ::hero_msgs::ArmorDetectionResult const> ArmorDetectionResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "db954e5de3aba73b237d07575e5cac28";
  }

  static const char* value(const ::hero_msgs::ArmorDetectionResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdb954e5de3aba73bULL;
  static const uint64_t static_value2 = 0x237d07575e5cac28ULL;
};

template<class ContainerAllocator>
struct DataType< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hero_msgs/ArmorDetectionResult";
  }

  static const char* value(const ::hero_msgs::ArmorDetectionResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
float32 result\n\
";
  }

  static const char* value(const ::hero_msgs::ArmorDetectionResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ArmorDetectionResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hero_msgs::ArmorDetectionResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hero_msgs::ArmorDetectionResult_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<float>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HERO_MSGS_MESSAGE_ARMORDETECTIONRESULT_H