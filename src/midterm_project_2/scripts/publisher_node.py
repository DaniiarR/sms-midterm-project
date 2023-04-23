import rospy
from std_msgs.msg import Int32, String
from pynput import keyboard

class PublisherNode:
    def __init__(self):
        rospy.init_node("publisher_node", anonymous=True)
        self.speed = 0.0
        self.max_readible_speed = 70.0
        self.max_speed_allowed = 120.0
        self.min_speed = 0.0
        self.last_speed = None
        self.speed_increment = 2.0
        self.license_plate_number = "ABC123"
        self.speed_pub = rospy.Publisher("current_speed", Int32, queue_size=10)
        self.license_pub = rospy.Publisher("license_plate_number", String, queue_size=10)
        self.rate = rospy.Rate(3)  # 3Hz
        self.is_manual_control = False

    def run(self):
        while not rospy.is_shutdown():
            if self.is_manual_control:
                pass
            else:
                self.publish_speed()
            self.publish_license_plate_number()
            self.rate.sleep()

    def publish_speed(self):
        if self.speed < self.max_readible_speed:
            self.speed += self.speed_increment
        # Only publish if the last speed is different from the current one
        if self.last_speed != self.speed:
            self.speed_pub.publish(int(self.speed))
        self.last_speed = self.speed

    def publish_license_plate_number(self):
        if self.speed <= 60:
            self.license_pub.publish(self.license_plate_number)

    def on_press(self, key):
        try:
            if key.char == 'm':
                self.is_manual_control = not self.is_manual_control
                rospy.loginfo("Manual control is now: {}".format(self.is_manual_control))
            elif key.char == 'w':
                self.increase_speed()
            elif key.char == 's':
                self.decrease_speed()
        except AttributeError:
            pass

    def on_release(self, key):
        pass

    def increase_speed(self):
        if self.is_manual_control:
            if self.speed < self.max_speed_allowed:
                self.speed += self.speed_increment
                rospy.loginfo("Speed increased to: {} km/h".format(self.speed))
                self.publish_speed()
            else:
                rospy.logerr("Cannot increase speed beyond max speed of {} km/h".format(self.max_speed_allowed))
        else:
            rospy.logerr("Manual control is not enabled. Press 'm' to enable.")

    def decrease_speed(self):
        if self.is_manual_control:
            if self.speed > self.min_speed:
                self.speed -= self.speed_increment
                rospy.loginfo("Speed decreased to: {} km/h".format(self.speed))
                self.publish_speed()
            else:
                rospy.logerr("Cannot decrease speed below min speed of {} km/h".format(self.min_speed))
        else:
            rospy.logerr("Manual control is not enabled. Press 'm' to enable.")


if __name__ == '__main__':
    try:
        publisher_node = PublisherNode()
        rospy.loginfo("Publisher Node initialized.")
        publisher_node.run()

        with keyboard.Listener(on_press=publisher_node.on_press, on_release=publisher_node.on_release) as listener:
            listener.join()

    except rospy.ROSInterruptException:
        pass
