#!/usr/bin/env python

import rospy
from std_msgs.msg import Int32, String

license_plate_number = None

def speed_callback(msg):
    global license_plate_number
    speed = msg.data
    rospy.loginfo("Current speed: %d", speed)
    if speed <= 60:
        rospy.loginfo(license_plate_number)
    else:
        rospy.logerr("Cannot read license plate number")

def license_plate_callback(msg):
    global license_plate_number
    license_plate_number = msg.data

def subscriber_node():
    rospy.init_node('subscriber_node')
    rospy.Subscriber('current_speed', Int32, speed_callback)
    rospy.Subscriber('license_plate_number', String, license_plate_callback)
    rospy.spin()

if __name__ == '__main__':
    subscriber_node()
