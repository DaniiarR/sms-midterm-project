;; Auto-generated. Do not edit!


(when (boundp 'midterm_project::Weather)
  (if (not (find-package "MIDTERM_PROJECT"))
    (make-package "MIDTERM_PROJECT"))
  (shadow 'Weather (find-package "MIDTERM_PROJECT")))
(unless (find-package "MIDTERM_PROJECT::WEATHER")
  (make-package "MIDTERM_PROJECT::WEATHER"))
(unless (find-package "MIDTERM_PROJECT::WEATHERREQUEST")
  (make-package "MIDTERM_PROJECT::WEATHERREQUEST"))
(unless (find-package "MIDTERM_PROJECT::WEATHERRESPONSE")
  (make-package "MIDTERM_PROJECT::WEATHERRESPONSE"))

(in-package "ROS")





(defclass midterm_project::WeatherRequest
  :super ros::object
  :slots (_latitude _longitude ))

(defmethod midterm_project::WeatherRequest
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:serialization-length
   ()
   (+
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass midterm_project::WeatherResponse
  :super ros::object
  :slots (_temperature _description ))

(defmethod midterm_project::WeatherResponse
  (:init
   (&key
    ((:temperature __temperature) 0.0)
    ((:description __description) "")
    )
   (send-super :init)
   (setq _temperature (float __temperature))
   (setq _description (string __description))
   self)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:description
   (&optional __description)
   (if __description (setq _description __description)) _description)
  (:serialization-length
   ()
   (+
    ;; float64 _temperature
    8
    ;; string _description
    4 (length _description)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _description
       (write-long (length _description) s) (princ _description s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _temperature
     (setq _temperature (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _description
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _description (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass midterm_project::Weather
  :super ros::object
  :slots ())

(setf (get midterm_project::Weather :md5sum-) "204ae4bdd15d2eba6c7e323a2fe04a4e")
(setf (get midterm_project::Weather :datatype-) "midterm_project/Weather")
(setf (get midterm_project::Weather :request) midterm_project::WeatherRequest)
(setf (get midterm_project::Weather :response) midterm_project::WeatherResponse)

(defmethod midterm_project::WeatherRequest
  (:response () (instance midterm_project::WeatherResponse :init)))

(setf (get midterm_project::WeatherRequest :md5sum-) "204ae4bdd15d2eba6c7e323a2fe04a4e")
(setf (get midterm_project::WeatherRequest :datatype-) "midterm_project/WeatherRequest")
(setf (get midterm_project::WeatherRequest :definition-)
      "float64 latitude
float64 longitude
---
float64 temperature
string description
")

(setf (get midterm_project::WeatherResponse :md5sum-) "204ae4bdd15d2eba6c7e323a2fe04a4e")
(setf (get midterm_project::WeatherResponse :datatype-) "midterm_project/WeatherResponse")
(setf (get midterm_project::WeatherResponse :definition-)
      "float64 latitude
float64 longitude
---
float64 temperature
string description
")



(provide :midterm_project/Weather "204ae4bdd15d2eba6c7e323a2fe04a4e")


