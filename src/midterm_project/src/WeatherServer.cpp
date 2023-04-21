#include <ros/ros.h>
#include <midterm_project/Weather.h>
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include <cpprest/json.h>

using namespace web;
using namespace web::http;
using namespace web::http::client;

bool handle_get_weather(midterm_project::Weather::Request& req, midterm_project::Weather::Response& res)
{
    utility::string_t apiKey = "46a7ad292c24f67d353806712fc3e881";
    // make a request to the OpenWeatherMap API to get the current weather for the requested location
    utility::string_t url = U("http://api.openweathermap.org/data/2.5/weather?lat=") + std::to_string(req.latitude) +
                            U("&lon=") + std::to_string(req.longitude) + U("&units=metric&appid=" + U(apiKey));

    http_client client(url);
    http_response response = client.request(methods::GET).get();

    // parse the response as JSON and extract the temperature and weather description fields
    json::value json_response = response.extract_json().get();
    float temperature = json_response[U("main")][U("temp")].as_double();
    utility::string_t description = json_response[U("weather")][0][U("description")].as_string();

    // populate the response message with the temperature and description
    res.temperature = temperature;
    // res.temperature = 37.5;

    res.description = std::string(description.begin(), description.end());
    return true;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "weather_server_node");
    ros::NodeHandle nh;

    // create a server for the Weather service
    ros::ServiceServer server = nh.advertiseService("get_weather", handle_get_weather);

    ROS_INFO("Weather server ready");

    ros::spin();

    return 0;
}
