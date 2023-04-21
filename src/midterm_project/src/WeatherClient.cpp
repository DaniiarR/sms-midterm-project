#include <ros/ros.h>
#include <midterm_project/Weather.h>
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include <cpprest/json.h>

using namespace web;
using namespace web::http;
using namespace web::http::client;

int main(int argc, char** argv)
{
    
    ros::init(argc, argv, "weather_client_node");
    ros::NodeHandle nh;

    // create a client for the Weather service
    ros::ServiceClient client = nh.serviceClient<midterm_project::Weather>("get_weather");

    // create a request message
    midterm_project::Weather srv;
    srv.request.latitude = 37.4565; // set the latitude of the request location
    srv.request.longitude = 126.7052; // set the longitude of the request location

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

    return 0;
}
