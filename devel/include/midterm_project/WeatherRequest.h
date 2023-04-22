// Generated by gencpp from file midterm_project/WeatherRequest.msg
// DO NOT EDIT!


#ifndef MIDTERM_PROJECT_MESSAGE_WEATHERREQUEST_H
#define MIDTERM_PROJECT_MESSAGE_WEATHERREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace midterm_project
{
template <class ContainerAllocator>
struct WeatherRequest_
{
  typedef WeatherRequest_<ContainerAllocator> Type;

  WeatherRequest_()
    : latitude(0.0)
    , longitude(0.0)
    , address()  {
    }
  WeatherRequest_(const ContainerAllocator& _alloc)
    : latitude(0.0)
    , longitude(0.0)
    , address(_alloc)  {
  (void)_alloc;
    }



   typedef double _latitude_type;
  _latitude_type latitude;

   typedef double _longitude_type;
  _longitude_type longitude;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _address_type;
  _address_type address;





  typedef boost::shared_ptr< ::midterm_project::WeatherRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::midterm_project::WeatherRequest_<ContainerAllocator> const> ConstPtr;

}; // struct WeatherRequest_

typedef ::midterm_project::WeatherRequest_<std::allocator<void> > WeatherRequest;

typedef boost::shared_ptr< ::midterm_project::WeatherRequest > WeatherRequestPtr;
typedef boost::shared_ptr< ::midterm_project::WeatherRequest const> WeatherRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::midterm_project::WeatherRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::midterm_project::WeatherRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::midterm_project::WeatherRequest_<ContainerAllocator1> & lhs, const ::midterm_project::WeatherRequest_<ContainerAllocator2> & rhs)
{
  return lhs.latitude == rhs.latitude &&
    lhs.longitude == rhs.longitude &&
    lhs.address == rhs.address;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::midterm_project::WeatherRequest_<ContainerAllocator1> & lhs, const ::midterm_project::WeatherRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace midterm_project

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::midterm_project::WeatherRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::midterm_project::WeatherRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::midterm_project::WeatherRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::midterm_project::WeatherRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::midterm_project::WeatherRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::midterm_project::WeatherRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::midterm_project::WeatherRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bb885d452db3635f26cf1a2915f879f6";
  }

  static const char* value(const ::midterm_project::WeatherRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbb885d452db3635fULL;
  static const uint64_t static_value2 = 0x26cf1a2915f879f6ULL;
};

template<class ContainerAllocator>
struct DataType< ::midterm_project::WeatherRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "midterm_project/WeatherRequest";
  }

  static const char* value(const ::midterm_project::WeatherRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::midterm_project::WeatherRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 latitude\n"
"float64 longitude\n"
"string address\n"
;
  }

  static const char* value(const ::midterm_project::WeatherRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::midterm_project::WeatherRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.latitude);
      stream.next(m.longitude);
      stream.next(m.address);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct WeatherRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::midterm_project::WeatherRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::midterm_project::WeatherRequest_<ContainerAllocator>& v)
  {
    s << indent << "latitude: ";
    Printer<double>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<double>::stream(s, indent + "  ", v.longitude);
    s << indent << "address: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.address);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MIDTERM_PROJECT_MESSAGE_WEATHERREQUEST_H
