# sms-midterm-project
GitHub link: https://github.com/DaniiarR/sms-midterm-project
## Project 1
This project is about implementing a weather server that uses the positionstack API to get the latitude and longitude from an address, and then the OpenWeatherMap API to get the weather information for those coordinates.

Full implementation can be found at */src/midterm_project_*.
Source code has comments explaining the functionality.
Launch file stored at */src/midterm_project/weather.launch*
Screenshots can be found at */screenshots*.
To run the project, execute:
```
roslaunch midterm_project weather.launch
```

## Project 2
This project is about reading the license plate number of a moving vehicle with increasing speed. The user is able to control the speed of the vehicle by pressing the 'w' and 's' buttons. At first, the program gradually increases the speed from 0 to 70, then provides the user with the opportunity to increase or decrease the speed. If the speed is < 60, then the "camera" is able to read the license plate number.

Full implementation can be found at */src/midterm_project_2*.
Launch file stored at */src/midterm_project_2/launch/speed_control.launch*.
Screenshots can be found at */screenshots*.
To run the project, execute:
```
roslaunch midterm_project_2 speed_control.launch
```
