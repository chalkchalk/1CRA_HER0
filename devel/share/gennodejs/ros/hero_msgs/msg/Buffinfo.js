// Auto-generated. Do not edit!

// (in-package hero_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Buffinfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.buff_data = null;
      this.activated = null;
    }
    else {
      if (initObj.hasOwnProperty('buff_data')) {
        this.buff_data = initObj.buff_data
      }
      else {
        this.buff_data = [];
      }
      if (initObj.hasOwnProperty('activated')) {
        this.activated = initObj.activated
      }
      else {
        this.activated = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Buffinfo
    // Serialize message field [buff_data]
    bufferOffset = _arraySerializer.uint8(obj.buff_data, buffer, bufferOffset, null);
    // Serialize message field [activated]
    bufferOffset = _arraySerializer.bool(obj.activated, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Buffinfo
    let len;
    let data = new Buffinfo(null);
    // Deserialize message field [buff_data]
    data.buff_data = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [activated]
    data.activated = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.buff_data.length;
    length += object.activated.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hero_msgs/Buffinfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c4f9c4da40ff47acceafd74940384f2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 RED_HEAL = 0
    uint8 BLUE_HEAL = 1
    uint8 RED_RELOAD = 2
    uint8 BLUE_RELOAD = 3
    uint8 MOVE_DEBUFF = 4
    uint8 SHOOT_DEBUFF = 5
    uint8[] buff_data
    bool[] activated
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Buffinfo(null);
    if (msg.buff_data !== undefined) {
      resolved.buff_data = msg.buff_data;
    }
    else {
      resolved.buff_data = []
    }

    if (msg.activated !== undefined) {
      resolved.activated = msg.activated;
    }
    else {
      resolved.activated = []
    }

    return resolved;
    }
};

// Constants for message
Buffinfo.Constants = {
  RED_HEAL: 0,
  BLUE_HEAL: 1,
  RED_RELOAD: 2,
  BLUE_RELOAD: 3,
  MOVE_DEBUFF: 4,
  SHOOT_DEBUFF: 5,
}

module.exports = Buffinfo;
