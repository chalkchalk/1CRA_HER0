// Auto-generated. Do not edit!

// (in-package hero_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RobotPosition = require('./RobotPosition.js');

//-----------------------------------------------------------

class BattlePosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robots_num = null;
      this.robots_position = null;
    }
    else {
      if (initObj.hasOwnProperty('robots_num')) {
        this.robots_num = initObj.robots_num
      }
      else {
        this.robots_num = 0;
      }
      if (initObj.hasOwnProperty('robots_position')) {
        this.robots_position = initObj.robots_position
      }
      else {
        this.robots_position = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BattlePosition
    // Serialize message field [robots_num]
    bufferOffset = _serializer.int16(obj.robots_num, buffer, bufferOffset);
    // Serialize message field [robots_position]
    // Serialize the length for message field [robots_position]
    bufferOffset = _serializer.uint32(obj.robots_position.length, buffer, bufferOffset);
    obj.robots_position.forEach((val) => {
      bufferOffset = RobotPosition.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BattlePosition
    let len;
    let data = new BattlePosition(null);
    // Deserialize message field [robots_num]
    data.robots_num = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [robots_position]
    // Deserialize array length for message field [robots_position]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.robots_position = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.robots_position[i] = RobotPosition.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.robots_position.forEach((val) => {
      length += RobotPosition.getMessageSize(val);
    });
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hero_msgs/BattlePosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4cb89422094dbe8ef13eac42ca6ded41';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 robots_num
    hero_msgs/RobotPosition[] robots_position
    
    ================================================================================
    MSG: hero_msgs/RobotPosition
    string robot_name
    hero_msgs/Position position
    hero_msgs/Position[4] armor_plates
    int32 health
    int32 ammo
    
    ================================================================================
    MSG: hero_msgs/Position
    float64 x
    float64 y
    float64 yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BattlePosition(null);
    if (msg.robots_num !== undefined) {
      resolved.robots_num = msg.robots_num;
    }
    else {
      resolved.robots_num = 0
    }

    if (msg.robots_position !== undefined) {
      resolved.robots_position = new Array(msg.robots_position.length);
      for (let i = 0; i < resolved.robots_position.length; ++i) {
        resolved.robots_position[i] = RobotPosition.Resolve(msg.robots_position[i]);
      }
    }
    else {
      resolved.robots_position = []
    }

    return resolved;
    }
};

module.exports = BattlePosition;
