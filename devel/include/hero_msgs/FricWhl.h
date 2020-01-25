// Generated by gencpp from file hero_msgs/FricWhl.msg
// DO NOT EDIT!


#ifndef HERO_MSGS_MESSAGE_FRICWHL_H
#define HERO_MSGS_MESSAGE_FRICWHL_H

#include <ros/service_traits.h>


#include <hero_msgs/FricWhlRequest.h>
#include <hero_msgs/FricWhlResponse.h>


namespace hero_msgs
{

struct FricWhl
{

typedef FricWhlRequest Request;
typedef FricWhlResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct FricWhl
} // namespace hero_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::hero_msgs::FricWhl > {
  static const char* value()
  {
    return "1a044c2743c5efe1a86f5bca57f520c6";
  }

  static const char* value(const ::hero_msgs::FricWhl&) { return value(); }
};

template<>
struct DataType< ::hero_msgs::FricWhl > {
  static const char* value()
  {
    return "hero_msgs/FricWhl";
  }

  static const char* value(const ::hero_msgs::FricWhl&) { return value(); }
};


// service_traits::MD5Sum< ::hero_msgs::FricWhlRequest> should match 
// service_traits::MD5Sum< ::hero_msgs::FricWhl > 
template<>
struct MD5Sum< ::hero_msgs::FricWhlRequest>
{
  static const char* value()
  {
    return MD5Sum< ::hero_msgs::FricWhl >::value();
  }
  static const char* value(const ::hero_msgs::FricWhlRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::hero_msgs::FricWhlRequest> should match 
// service_traits::DataType< ::hero_msgs::FricWhl > 
template<>
struct DataType< ::hero_msgs::FricWhlRequest>
{
  static const char* value()
  {
    return DataType< ::hero_msgs::FricWhl >::value();
  }
  static const char* value(const ::hero_msgs::FricWhlRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::hero_msgs::FricWhlResponse> should match 
// service_traits::MD5Sum< ::hero_msgs::FricWhl > 
template<>
struct MD5Sum< ::hero_msgs::FricWhlResponse>
{
  static const char* value()
  {
    return MD5Sum< ::hero_msgs::FricWhl >::value();
  }
  static const char* value(const ::hero_msgs::FricWhlResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::hero_msgs::FricWhlResponse> should match 
// service_traits::DataType< ::hero_msgs::FricWhl > 
template<>
struct DataType< ::hero_msgs::FricWhlResponse>
{
  static const char* value()
  {
    return DataType< ::hero_msgs::FricWhl >::value();
  }
  static const char* value(const ::hero_msgs::FricWhlResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // HERO_MSGS_MESSAGE_FRICWHL_H
