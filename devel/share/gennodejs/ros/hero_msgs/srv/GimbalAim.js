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

class GimbalAimRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.set_angle_absolute = null;
    }
    else {
      if (initObj.hasOwnProperty('set_angle_absolute')) {
        this.set_angle_absolute = initObj.set_angle_absolute
      }
      else {
        this.set_angle_absolute = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalAimRequest
    // Serialize message field [set_angle_absolute]
    bufferOffset = _serializer.float64(obj.set_angle_absolute, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalAimRequest
    let len;
    let data = new GimbalAimRequest(null);
    // Deserialize message field [set_angle_absolute]
    data.set_angle_absolute = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hero_msgs/GimbalAimRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '71c9d0ba4f4a467ab563a59a1cb5cc7c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 set_angle_absolute
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalAimRequest(null);
    if (msg.set_angle_absolute !== undefined) {
      resolved.set_angle_absolute = msg.set_angle_absolute;
    }
    else {
      resolved.set_angle_absolute = 0.0
    }

    return resolved;
    }
};

class GimbalAimResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.aimed = null;
    }
    else {
      if (initObj.hasOwnProperty('aimed')) {
        this.aimed = initObj.aimed
      }
      else {
        this.aimed = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalAimResponse
    // Serialize message field [aimed]
    bufferOffset = _serializer.bool(obj.aimed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalAimResponse
    let len;
    let data = new GimbalAimResponse(null);
    // Deserialize message field [aimed]
    data.aimed = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hero_msgs/GimbalAimResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2951212206145d7bfa397ed974bc213e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool aimed
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalAimResponse(null);
    if (msg.aimed !== undefined) {
      resolved.aimed = msg.aimed;
    }
    else {
      resolved.aimed = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GimbalAimRequest,
  Response: GimbalAimResponse,
  md5sum() { return '092644b5ad06ae027152ed41585220f2'; },
  datatype() { return 'hero_msgs/GimbalAim'; }
};
