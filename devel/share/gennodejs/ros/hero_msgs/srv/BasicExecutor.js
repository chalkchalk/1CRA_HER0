// Auto-generated. Do not edit!

// (in-package hero_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class BasicExecutorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
      this.robot_name = null;
      this.yaw_control = null;
      this.position_x = null;
      this.position_y = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
      if (initObj.hasOwnProperty('robot_name')) {
        this.robot_name = initObj.robot_name
      }
      else {
        this.robot_name = '';
      }
      if (initObj.hasOwnProperty('yaw_control')) {
        this.yaw_control = initObj.yaw_control
      }
      else {
        this.yaw_control = false;
      }
      if (initObj.hasOwnProperty('position_x')) {
        this.position_x = initObj.position_x
      }
      else {
        this.position_x = 0.0;
      }
      if (initObj.hasOwnProperty('position_y')) {
        this.position_y = initObj.position_y
      }
      else {
        this.position_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BasicExecutorRequest
    // Serialize message field [command]
    bufferOffset = _serializer.uint8(obj.command, buffer, bufferOffset);
    // Serialize message field [robot_name]
    bufferOffset = _serializer.string(obj.robot_name, buffer, bufferOffset);
    // Serialize message field [yaw_control]
    bufferOffset = _serializer.bool(obj.yaw_control, buffer, bufferOffset);
    // Serialize message field [position_x]
    bufferOffset = _serializer.float64(obj.position_x, buffer, bufferOffset);
    // Serialize message field [position_y]
    bufferOffset = _serializer.float64(obj.position_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BasicExecutorRequest
    let len;
    let data = new BasicExecutorRequest(null);
    // Deserialize message field [command]
    data.command = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [robot_name]
    data.robot_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [yaw_control]
    data.yaw_control = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [position_x]
    data.position_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [position_y]
    data.position_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.robot_name.length;
    return length + 22;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hero_msgs/BasicExecutorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '915f07e066835d39bcef29a683b32eec';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 MOVE_TO_POSITION = 1
    uint8 ATTACK_ROBOT = 2
    uint8 ENGAGE_ROBOT = 3
    uint8 HALT = 4
    uint8 command
    string robot_name
    bool yaw_control
    float64 position_x
    float64 position_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BasicExecutorRequest(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    if (msg.robot_name !== undefined) {
      resolved.robot_name = msg.robot_name;
    }
    else {
      resolved.robot_name = ''
    }

    if (msg.yaw_control !== undefined) {
      resolved.yaw_control = msg.yaw_control;
    }
    else {
      resolved.yaw_control = false
    }

    if (msg.position_x !== undefined) {
      resolved.position_x = msg.position_x;
    }
    else {
      resolved.position_x = 0.0
    }

    if (msg.position_y !== undefined) {
      resolved.position_y = msg.position_y;
    }
    else {
      resolved.position_y = 0.0
    }

    return resolved;
    }
};

// Constants for message
BasicExecutorRequest.Constants = {
  MOVE_TO_POSITION: 1,
  ATTACK_ROBOT: 2,
  ENGAGE_ROBOT: 3,
  HALT: 4,
}

class BasicExecutorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.error_code = null;
    }
    else {
      if (initObj.hasOwnProperty('error_code')) {
        this.error_code = initObj.error_code
      }
      else {
        this.error_code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BasicExecutorResponse
    // Serialize message field [error_code]
    bufferOffset = _serializer.uint8(obj.error_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BasicExecutorResponse
    let len;
    let data = new BasicExecutorResponse(null);
    // Deserialize message field [error_code]
    data.error_code = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hero_msgs/BasicExecutorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d7f46f06f230dc931e54261335b2557';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 OK = 100
    uint8 I_AM_DEAD = 101
    uint8 OUT_OF_AMMO = 102
    uint8 TARGET_IS_DEAD = 103
    uint8 error_code
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BasicExecutorResponse(null);
    if (msg.error_code !== undefined) {
      resolved.error_code = msg.error_code;
    }
    else {
      resolved.error_code = 0
    }

    return resolved;
    }
};

// Constants for message
BasicExecutorResponse.Constants = {
  OK: 100,
  I_AM_DEAD: 101,
  OUT_OF_AMMO: 102,
  TARGET_IS_DEAD: 103,
}

module.exports = {
  Request: BasicExecutorRequest,
  Response: BasicExecutorResponse,
  md5sum() { return '29dda9959aaf5bb18d3e017845cd697d'; },
  datatype() { return 'hero_msgs/BasicExecutor'; }
};
