# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from hero_msgs/ArmorDetectionFeedback.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class ArmorDetectionFeedback(genpy.Message):
  _md5sum = "8d02f36059a79608a4dff667f988ef60"
  _type = "hero_msgs/ArmorDetectionFeedback"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#feedback
bool detected
int32  error_code
string error_msg
geometry_msgs/PoseStamped enemy_pos


================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
"""
  __slots__ = ['detected','error_code','error_msg','enemy_pos']
  _slot_types = ['bool','int32','string','geometry_msgs/PoseStamped']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       detected,error_code,error_msg,enemy_pos

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(ArmorDetectionFeedback, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.detected is None:
        self.detected = False
      if self.error_code is None:
        self.error_code = 0
      if self.error_msg is None:
        self.error_msg = ''
      if self.enemy_pos is None:
        self.enemy_pos = geometry_msgs.msg.PoseStamped()
    else:
      self.detected = False
      self.error_code = 0
      self.error_msg = ''
      self.enemy_pos = geometry_msgs.msg.PoseStamped()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_Bi().pack(_x.detected, _x.error_code))
      _x = self.error_msg
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.enemy_pos.header.seq, _x.enemy_pos.header.stamp.secs, _x.enemy_pos.header.stamp.nsecs))
      _x = self.enemy_pos.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_7d().pack(_x.enemy_pos.pose.position.x, _x.enemy_pos.pose.position.y, _x.enemy_pos.pose.position.z, _x.enemy_pos.pose.orientation.x, _x.enemy_pos.pose.orientation.y, _x.enemy_pos.pose.orientation.z, _x.enemy_pos.pose.orientation.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.enemy_pos is None:
        self.enemy_pos = geometry_msgs.msg.PoseStamped()
      end = 0
      _x = self
      start = end
      end += 5
      (_x.detected, _x.error_code,) = _get_struct_Bi().unpack(str[start:end])
      self.detected = bool(self.detected)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.error_msg = str[start:end].decode('utf-8')
      else:
        self.error_msg = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.enemy_pos.header.seq, _x.enemy_pos.header.stamp.secs, _x.enemy_pos.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.enemy_pos.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.enemy_pos.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 56
      (_x.enemy_pos.pose.position.x, _x.enemy_pos.pose.position.y, _x.enemy_pos.pose.position.z, _x.enemy_pos.pose.orientation.x, _x.enemy_pos.pose.orientation.y, _x.enemy_pos.pose.orientation.z, _x.enemy_pos.pose.orientation.w,) = _get_struct_7d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_Bi().pack(_x.detected, _x.error_code))
      _x = self.error_msg
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_3I().pack(_x.enemy_pos.header.seq, _x.enemy_pos.header.stamp.secs, _x.enemy_pos.header.stamp.nsecs))
      _x = self.enemy_pos.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_7d().pack(_x.enemy_pos.pose.position.x, _x.enemy_pos.pose.position.y, _x.enemy_pos.pose.position.z, _x.enemy_pos.pose.orientation.x, _x.enemy_pos.pose.orientation.y, _x.enemy_pos.pose.orientation.z, _x.enemy_pos.pose.orientation.w))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.enemy_pos is None:
        self.enemy_pos = geometry_msgs.msg.PoseStamped()
      end = 0
      _x = self
      start = end
      end += 5
      (_x.detected, _x.error_code,) = _get_struct_Bi().unpack(str[start:end])
      self.detected = bool(self.detected)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.error_msg = str[start:end].decode('utf-8')
      else:
        self.error_msg = str[start:end]
      _x = self
      start = end
      end += 12
      (_x.enemy_pos.header.seq, _x.enemy_pos.header.stamp.secs, _x.enemy_pos.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.enemy_pos.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.enemy_pos.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 56
      (_x.enemy_pos.pose.position.x, _x.enemy_pos.pose.position.y, _x.enemy_pos.pose.position.z, _x.enemy_pos.pose.orientation.x, _x.enemy_pos.pose.orientation.y, _x.enemy_pos.pose.orientation.z, _x.enemy_pos.pose.orientation.w,) = _get_struct_7d().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_7d = None
def _get_struct_7d():
    global _struct_7d
    if _struct_7d is None:
        _struct_7d = struct.Struct("<7d")
    return _struct_7d
_struct_Bi = None
def _get_struct_Bi():
    global _struct_Bi
    if _struct_Bi is None:
        _struct_Bi = struct.Struct("<Bi")
    return _struct_Bi
