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

class BulletMove {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.owner = null;
      this.x = null;
      this.y = null;
      this.x_last = null;
      this.y_last = null;
      this.yaw = null;
      this.speed = null;
      this.covered_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('owner')) {
        this.owner = initObj.owner
      }
      else {
        this.owner = '';
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('x_last')) {
        this.x_last = initObj.x_last
      }
      else {
        this.x_last = 0.0;
      }
      if (initObj.hasOwnProperty('y_last')) {
        this.y_last = initObj.y_last
      }
      else {
        this.y_last = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0.0;
      }
      if (initObj.hasOwnProperty('covered_distance')) {
        this.covered_distance = initObj.covered_distance
      }
      else {
        this.covered_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BulletMove
    // Serialize message field [owner]
    bufferOffset = _serializer.string(obj.owner, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [x_last]
    bufferOffset = _serializer.float64(obj.x_last, buffer, bufferOffset);
    // Serialize message field [y_last]
    bufferOffset = _serializer.float64(obj.y_last, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [speed]
    bufferOffset = _serializer.float64(obj.speed, buffer, bufferOffset);
    // Serialize message field [covered_distance]
    bufferOffset = _serializer.float64(obj.covered_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BulletMove
    let len;
    let data = new BulletMove(null);
    // Deserialize message field [owner]
    data.owner = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x_last]
    data.x_last = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y_last]
    data.y_last = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [speed]
    data.speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [covered_distance]
    data.covered_distance = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.owner.length;
    return length + 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hero_msgs/BulletMove';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '549805474b46a9047454c7d22f3cd2ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string owner
    float64 x
    float64 y
    float64 x_last
    float64 y_last
    float64 yaw
    float64 speed
    float64 covered_distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BulletMove(null);
    if (msg.owner !== undefined) {
      resolved.owner = msg.owner;
    }
    else {
      resolved.owner = ''
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.x_last !== undefined) {
      resolved.x_last = msg.x_last;
    }
    else {
      resolved.x_last = 0.0
    }

    if (msg.y_last !== undefined) {
      resolved.y_last = msg.y_last;
    }
    else {
      resolved.y_last = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0.0
    }

    if (msg.covered_distance !== undefined) {
      resolved.covered_distance = msg.covered_distance;
    }
    else {
      resolved.covered_distance = 0.0
    }

    return resolved;
    }
};

module.exports = BulletMove;
