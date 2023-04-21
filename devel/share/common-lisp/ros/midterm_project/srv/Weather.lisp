; Auto-generated. Do not edit!


(cl:in-package midterm_project-srv)


;//! \htmlinclude Weather-request.msg.html

(cl:defclass <Weather-request> (roslisp-msg-protocol:ros-message)
  ((latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0))
)

(cl:defclass Weather-request (<Weather-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Weather-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Weather-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name midterm_project-srv:<Weather-request> is deprecated: use midterm_project-srv:Weather-request instead.")))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <Weather-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader midterm_project-srv:latitude-val is deprecated.  Use midterm_project-srv:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <Weather-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader midterm_project-srv:longitude-val is deprecated.  Use midterm_project-srv:longitude instead.")
  (longitude m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Weather-request>) ostream)
  "Serializes a message object of type '<Weather-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Weather-request>) istream)
  "Deserializes a message object of type '<Weather-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Weather-request>)))
  "Returns string type for a service object of type '<Weather-request>"
  "midterm_project/WeatherRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Weather-request)))
  "Returns string type for a service object of type 'Weather-request"
  "midterm_project/WeatherRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Weather-request>)))
  "Returns md5sum for a message object of type '<Weather-request>"
  "204ae4bdd15d2eba6c7e323a2fe04a4e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Weather-request)))
  "Returns md5sum for a message object of type 'Weather-request"
  "204ae4bdd15d2eba6c7e323a2fe04a4e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Weather-request>)))
  "Returns full string definition for message of type '<Weather-request>"
  (cl:format cl:nil "float64 latitude~%float64 longitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Weather-request)))
  "Returns full string definition for message of type 'Weather-request"
  (cl:format cl:nil "float64 latitude~%float64 longitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Weather-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Weather-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Weather-request
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
))
;//! \htmlinclude Weather-response.msg.html

(cl:defclass <Weather-response> (roslisp-msg-protocol:ros-message)
  ((temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0)
   (description
    :reader description
    :initarg :description
    :type cl:string
    :initform ""))
)

(cl:defclass Weather-response (<Weather-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Weather-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Weather-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name midterm_project-srv:<Weather-response> is deprecated: use midterm_project-srv:Weather-response instead.")))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <Weather-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader midterm_project-srv:temperature-val is deprecated.  Use midterm_project-srv:temperature instead.")
  (temperature m))

(cl:ensure-generic-function 'description-val :lambda-list '(m))
(cl:defmethod description-val ((m <Weather-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader midterm_project-srv:description-val is deprecated.  Use midterm_project-srv:description instead.")
  (description m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Weather-response>) ostream)
  "Serializes a message object of type '<Weather-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'description))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'description))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Weather-response>) istream)
  "Deserializes a message object of type '<Weather-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'description) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'description) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Weather-response>)))
  "Returns string type for a service object of type '<Weather-response>"
  "midterm_project/WeatherResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Weather-response)))
  "Returns string type for a service object of type 'Weather-response"
  "midterm_project/WeatherResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Weather-response>)))
  "Returns md5sum for a message object of type '<Weather-response>"
  "204ae4bdd15d2eba6c7e323a2fe04a4e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Weather-response)))
  "Returns md5sum for a message object of type 'Weather-response"
  "204ae4bdd15d2eba6c7e323a2fe04a4e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Weather-response>)))
  "Returns full string definition for message of type '<Weather-response>"
  (cl:format cl:nil "float64 temperature~%string description~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Weather-response)))
  "Returns full string definition for message of type 'Weather-response"
  (cl:format cl:nil "float64 temperature~%string description~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Weather-response>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'description))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Weather-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Weather-response
    (cl:cons ':temperature (temperature msg))
    (cl:cons ':description (description msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Weather)))
  'Weather-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Weather)))
  'Weather-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Weather)))
  "Returns string type for a service object of type '<Weather>"
  "midterm_project/Weather")