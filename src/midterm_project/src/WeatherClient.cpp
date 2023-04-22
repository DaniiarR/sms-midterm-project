#include <ros/ros.h>
#include <iostream>
#include <string>
#include <midterm_project/Weather.h>

using namespace std;

int main(int argc, char** argv)
{
    ros::init(argc, argv, "weather_client_node");
    ros::NodeHandle nh;

    // create a client for the Weather service
    ros::ServiceClient client = nh.serviceClient<midterm_project::Weather>("get_weather");

    string address;
    // Get the user input until 0 is inputted
    while (true)
    {
        cout << "Enter an address (or 0 to exit): ";
        cin >> address;

        if (address == "0")
            break;

        // create a request message
        midterm_project::Weather srv;
        srv.request.address = address;

        // send the request to the server and wait for a response
        if (client.call(srv))
        {
            ROS_INFO("Current weather: temperature = %f, description = %s",
                     srv.response.temperature, srv.response.description.c_str());
        }
        else
        {
            ROS_ERROR("Failed to call service get_weather");
            return 1;
        }
    }

    return 0;
}

