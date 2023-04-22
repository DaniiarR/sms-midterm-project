cmake_minimum_required(VERSION 3.0.2)
project(midterm_project)

find_package(catkin REQUIRED COMPONENTS
roscpp
rospy
std_msgs
message_generation)

## Generate services in the 'srv' folder
add_service_files(
  DIRECTORY srv
  FILES Weather.srv
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs  # Or other packages containing msgs
)


###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
 INCLUDE_DIRS include
 LIBRARIES midterm_project
 CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
include ${catkin_INCLUDE_DIRS}
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
# add_executable(${PROJECT_NAME}_node src/midterm_project_node.cpp)
find_package(cpprestsdk REQUIRED)
find_package(OpenSSL REQUIRED)

add_executable(weather_server_node src/WeatherServer.cpp) 
target_link_libraries(weather_server_node
 ${catkin_LIBRARIES}
 cpprestsdk::cpprest
 stdc++fs)

add_executable(weather_client_node src/WeatherClient.cpp)
target_link_libraries(weather_client_node 
${catkin_LIBRARIES}
cpprestsdk::cpprest
OpenSSL::SSL
stdc++fs)


#############
## Install ##
#############
install(TARGETS weather_client_node weather_server_node
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

install(DIRECTORY include/${PROJECT_NAME}/
  DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
)

install(FILES ${PROJECT_NAME}_node.xml
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)
