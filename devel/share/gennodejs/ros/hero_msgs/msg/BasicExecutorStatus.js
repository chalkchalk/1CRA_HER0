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

class BasicExecutorStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
      this.saying = null;
      this.robot_name = null;
      this.target_name = null;
      this.move_x = null;
      this.move_y = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = 0;
      }
      if (initObj.hasOwnProperty('saying')) {
        this.saying = initObj.saying
      }
      else {
        this.saying = '';
      }
      if (initObj.hasOwnProperty('robot_name')) {
        this.robot_name = initObj.robot_name
      }
      else {
        this.robot_name = '';
      }
      if (initObj.hasOwnProperty('target_name')) {
        this.target_name = initObj.target_name
      }
      else {
        this.target_name = '';
      }
      if (initObj.hasOwnProperty('move_x')) {
        this.move_x = initObj.move_x
      }
      else {
        this.move_x = 0.0;
      }
      if (initObj.hasOwnProperty('move_y')) {
        this.move_y = initObj.move_y
      }
      else {
        this.move_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BasicExecutorStatus
    // Serialize message field [state]
    bufferOffset = _serializer.uint8(obj.state, buffer, bufferOffset);
    // Serialize message field [saying]
    bufferOffset = _serializer.string(obj.saying, buffer, bufferOffset);
    // Serialize message field [robot_name]
    bufferOffset = _serializer.string(obj.robot_name, buffer, bufferOffset);
    // Serialize message field [target_name]
    bufferOffset = _serializer.string(obj.target_name, buffer, bufferOffset);
    // Serialize message field [move_x]
    bufferOffset = _serializer.float64(obj.move_x, buffer, bufferOffset);
    // Serialize message field [move_y]
    bufferOffset = _serializer.float64(obj.move_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BasicExecutorStatus
    let len;
    let data = new BasicExecutorStatus(null);
    // Deserialize message field [state]
    data.state = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [saying]
    data.saying = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_name]
    data.robot_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [target_name]
    data.target_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [move_x]
    data.move_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [move_y]
    data.move_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.saying.length;
    length += object.robot_name.length;
    length += object.target_name.length;
    return length + 29;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hero_msgs/BasicExecutorStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6355e6033a487f335fe4d99196ec3f6b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 MOVE_TO_POSITION = 1
    uint8 ATTACK_ROBOT = 2
    uint8 IDLE = 3
    uint8 state
    string saying
    string robot_name
    string target_name
    float64 move_x
    float64 move_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BasicExecutorStatus(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = 0
    }

    if (msg.saying !== undefined) {
      resolved.saying = msg.saying;
    }
    else {
      resolved.saying = ''
    }

    if (msg.robot_name !== undefined) {
      resolved.robot_name = msg.robot_name;
    }
    else {
      resolved.robot_name = ''
    }

    if (msg.target_name !== undefined) {
      resolved.target_name = msg.target_name;
    }
    else {
      resolved.target_name = ''
    }

    if (msg.move_x !== undefined) {
      resolved.move_x = msg.move_x;
    }
    else {
      resolved.move_x = 0.0
    }

    if (msg.move_y !== undefined) {
      resolved.move_y = msg.move_y;
    }
    else {
      resolved.move_y = 0.0
    }

    return resolved;
    }
};

// Constants for message
BasicExecutorStatus.Constants = {
  MOVE_TO_POSITION: 1,
  ATTACK_ROBOT: 2,
  IDLE: 3,
}

module.exports = BasicExecutorStatus;
