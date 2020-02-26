// Auto-generated. Do not edit!

// (in-package hero_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Position = require('./Position.js');

//-----------------------------------------------------------

class RobotPosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_name = null;
      this.position = null;
      this.armor_plates = null;
      this.health = null;
      this.ammo = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_name')) {
        this.robot_name = initObj.robot_name
      }
      else {
        this.robot_name = '';
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new Position();
      }
      if (initObj.hasOwnProperty('armor_plates')) {
        this.armor_plates = initObj.armor_plates
      }
      else {
        this.armor_plates = new Array(4).fill(new Position());
      }
      if (initObj.hasOwnProperty('health')) {
        this.health = initObj.health
      }
      else {
        this.health = 0;
      }
      if (initObj.hasOwnProperty('ammo')) {
        this.ammo = initObj.ammo
      }
      else {
        this.ammo = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RobotPosition
    // Serialize message field [robot_name]
    bufferOffset = _serializer.string(obj.robot_name, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = Position.serialize(obj.position, buffer, bufferOffset);
    // Check that the constant length array field [armor_plates] has the right length
    if (obj.armor_plates.length !== 4) {
      throw new Error('Unable to serialize array field armor_plates - length must be 4')
    }
    // Serialize message field [armor_plates]
    obj.armor_plates.forEach((val) => {
      bufferOffset = Position.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [health]
    bufferOffset = _serializer.int32(obj.health, buffer, bufferOffset);
    // Serialize message field [ammo]
    bufferOffset = _serializer.int32(obj.ammo, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RobotPosition
    let len;
    let data = new RobotPosition(null);
    // Deserialize message field [robot_name]
    data.robot_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = Position.deserialize(buffer, bufferOffset);
    // Deserialize message field [armor_plates]
    len = 4;
    data.armor_plates = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.armor_plates[i] = Position.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [health]
    data.health = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [ammo]
    data.ammo = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.robot_name.length;
    return length + 132;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hero_msgs/RobotPosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7d821070cef65bd1dbcfa6be273d43f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new RobotPosition(null);
    if (msg.robot_name !== undefined) {
      resolved.robot_name = msg.robot_name;
    }
    else {
      resolved.robot_name = ''
    }

    if (msg.position !== undefined) {
      resolved.position = Position.Resolve(msg.position)
    }
    else {
      resolved.position = new Position()
    }

    if (msg.armor_plates !== undefined) {
      resolved.armor_plates = new Array(4)
      for (let i = 0; i < resolved.armor_plates.length; ++i) {
        if (msg.armor_plates.length > i) {
          resolved.armor_plates[i] = Position.Resolve(msg.armor_plates[i]);
        }
        else {
          resolved.armor_plates[i] = new Position();
        }
      }
    }
    else {
      resolved.armor_plates = new Array(4).fill(new Position())
    }

    if (msg.health !== undefined) {
      resolved.health = msg.health;
    }
    else {
      resolved.health = 0
    }

    if (msg.ammo !== undefined) {
      resolved.ammo = msg.ammo;
    }
    else {
      resolved.ammo = 0
    }

    return resolved;
    }
};

module.exports = RobotPosition;
