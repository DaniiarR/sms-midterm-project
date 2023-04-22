#include <ros/ros.h>
#include <string>
#include <midterm_project/Weather.h>
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include <cpprest/json.h>

using namespace std;
using namespace web;
using namespace web::http;
using namespace web::http::client;


// Define the PositionStack API key
const string API_KEY = "16d468a117f42e330fdc8178a07fc19a";

// Define the base URL of the API
const string BASE_URL = "http://api.positionstack.com/v1/";

void get_lat_long_from_address(const string& address, double& latitude, double& longitude)
{
    // Create an HTTP client object
    http_client client(BASE_URL);

    // Create the request URI with the address and API access key
    uri_builder builder("forward");
    builder.append_query("access_key", API_KEY);
    builder.append_query("query", address);

    // Send the request to the API
    http_response response = client.request(methods::GET, builder.to_string()).get();

    // Check if the request was successful
    if (response.status_code() == status_codes::OK) {
        // Extract the latitude and longitude from the JSON response
        json::value json_response = response.extract_json().get();
        latitude = json_response["data"][0]["latitude"].as_double();
        longitude = json_response["data"][0]["longitude"].as_double();
    } else {
        // Throw an exception if the request failed
        throw std::runtime_error("Failed to get latitude and longitude from address " + address);
    }
}

// Use the latitude and longitude to get the weather forecast using OpenWeatherMap API
bool handle_get_weather(midterm_project::Weather::Request& req, midterm_project::Weather::Response& res)
{
    double latitude, longitude;
    // Call the function and get the latitude and longitude for the given address
    get_lat_long_from_address(req.address, latitude, longitude);

    // OpenWeatherMap API Key
    utility::string_t apiKey = "46a7ad292c24f67d353806712fc3e881";
    // make a request to the OpenWeatherMap API to get the current weather for the requested location
    utility::string_t url = U("http://api.openweathermap.org/data/2.5/weather?lat=") + std::to_string(latitude) +
                            U("&lon=") + std::to_string(longitude) + U("&units=metric&appid=" + U(apiKey));
    http_client client(url);
    http_response response = client.request(methods::GET).get();

    // parse the response as JSON and extract the temperature and weather description fields
    json::value json_response = response.extract_json().get();
    float temperature = json_response[U("main")][U("temp")].as_double();
    utility::string_t description = json_response[U("weather")][0][U("description")].as_string();

    // populate the response message with the temperature and description
    res.temperature = temperature;
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
