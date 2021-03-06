# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from hero_msgs/Buffinfo.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class Buffinfo(genpy.Message):
  _md5sum = "1c4f9c4da40ff47acceafd74940384f2"
  _type = "hero_msgs/Buffinfo"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """uint8 RED_HEAL = 0
uint8 BLUE_HEAL = 1
uint8 RED_RELOAD = 2
uint8 BLUE_RELOAD = 3
uint8 MOVE_DEBUFF = 4
uint8 SHOOT_DEBUFF = 5
uint8[] buff_data
bool[] activated



"""
  # Pseudo-constants
  RED_HEAL = 0
  BLUE_HEAL = 1
  RED_RELOAD = 2
  BLUE_RELOAD = 3
  MOVE_DEBUFF = 4
  SHOOT_DEBUFF = 5

  __slots__ = ['buff_data','activated']
  _slot_types = ['uint8[]','bool[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       buff_data,activated

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Buffinfo, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.buff_data is None:
        self.buff_data = b''
      if self.activated is None:
        self.activated = []
    else:
      self.buff_data = b''
      self.activated = []

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
      _x = self.buff_data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.activated)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(struct.pack(pattern, *self.activated))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.buff_data = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.activated = struct.unpack(pattern, str[start:end])
      self.activated = map(bool, self.activated)
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
      _x = self.buff_data
      length = len(_x)
      # - if encoded as a list instead, serialize as bytes instead of string
      if type(_x) in [list, tuple]:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.activated)
      buff.write(_struct_I.pack(length))
      pattern = '<%sB'%length
      buff.write(self.activated.tostring())
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      self.buff_data = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sB'%length
      start = end
      end += struct.calcsize(pattern)
      self.activated = numpy.frombuffer(str[start:end], dtype=numpy.bool, count=length)
      self.activated = map(bool, self.activated)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
