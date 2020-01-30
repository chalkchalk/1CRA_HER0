// Auto-generated. Do not edit!

// (in-package hero_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BulletMove = require('./BulletMove.js');

//-----------------------------------------------------------

class BulletsInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bullet_num = null;
      this.bullets = null;
    }
    else {
      if (initObj.hasOwnProperty('bullet_num')) {
        this.bullet_num = initObj.bullet_num
      }
      else {
        this.bullet_num = 0;
      }
      if (initObj.hasOwnProperty('bullets')) {
        this.bullets = initObj.bullets
      }
      else {
        this.bullets = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BulletsInfo
    // Serialize message field [bullet_num]
    bufferOffset = _serializer.uint32(obj.bullet_num, buffer, bufferOffset);
    // Serialize message field [bullets]
    // Serialize the length for message field [bullets]
    bufferOffset = _serializer.uint32(obj.bullets.length, buffer, bufferOffset);
    obj.bullets.forEach((val) => {
      bufferOffset = BulletMove.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BulletsInfo
    let len;
    let data = new BulletsInfo(null);
    // Deserialize message field [bullet_num]
    data.bullet_num = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [bullets]
    // Deserialize array length for message field [bullets]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bullets = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bullets[i] = BulletMove.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.bullets.forEach((val) => {
      length += BulletMove.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hero_msgs/BulletsInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bdf8108add47e44ea1df95423235ef9c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 bullet_num
    hero_msgs/BulletMove[] bullets
    
    ================================================================================
    MSG: hero_msgs/BulletMove
    string owner
    float64 x
    float64 y
    float64 x_last
    float64 y_last
    float64 yaw
    float64 speed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BulletsInfo(null);
    if (msg.bullet_num !== undefined) {
      resolved.bullet_num = msg.bullet_num;
    }
    else {
      resolved.bullet_num = 0
    }

    if (msg.bullets !== undefined) {
      resolved.bullets = new Array(msg.bullets.length);
      for (let i = 0; i < resolved.bullets.length; ++i) {
        resolved.bullets[i] = BulletMove.Resolve(msg.bullets[i]);
      }
    }
    else {
      resolved.bullets = []
    }

    return resolved;
    }
};

module.exports = BulletsInfo;
