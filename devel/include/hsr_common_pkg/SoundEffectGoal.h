// Generated by gencpp from file hsr_common_pkg/SoundEffectGoal.msg
// DO NOT EDIT!


#ifndef HSR_COMMON_PKG_MESSAGE_SOUNDEFFECTGOAL_H
#define HSR_COMMON_PKG_MESSAGE_SOUNDEFFECTGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace hsr_common_pkg
{
template <class ContainerAllocator>
struct SoundEffectGoal_
{
  typedef SoundEffectGoal_<ContainerAllocator> Type;

  SoundEffectGoal_()
    : sound_effect_goal()  {
    }
  SoundEffectGoal_(const ContainerAllocator& _alloc)
    : sound_effect_goal(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _sound_effect_goal_type;
  _sound_effect_goal_type sound_effect_goal;




  typedef boost::shared_ptr< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> const> ConstPtr;

}; // struct SoundEffectGoal_

typedef ::hsr_common_pkg::SoundEffectGoal_<std::allocator<void> > SoundEffectGoal;

typedef boost::shared_ptr< ::hsr_common_pkg::SoundEffectGoal > SoundEffectGoalPtr;
typedef boost::shared_ptr< ::hsr_common_pkg::SoundEffectGoal const> SoundEffectGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace hsr_common_pkg

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/indigo/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'hsr_common_pkg': ['/home/guest/athome_ws/devel/share/hsr_common_pkg/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a2a765b6b96ab9f3887ab341e6120474";
  }

  static const char* value(const ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa2a765b6b96ab9f3ULL;
  static const uint64_t static_value2 = 0x887ab341e6120474ULL;
};

template<class ContainerAllocator>
struct DataType< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hsr_common_pkg/SoundEffectGoal";
  }

  static const char* value(const ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
string sound_effect_goal\n\
";
  }

  static const char* value(const ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.sound_effect_goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SoundEffectGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hsr_common_pkg::SoundEffectGoal_<ContainerAllocator>& v)
  {
    s << indent << "sound_effect_goal: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.sound_effect_goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HSR_COMMON_PKG_MESSAGE_SOUNDEFFECTGOAL_H
