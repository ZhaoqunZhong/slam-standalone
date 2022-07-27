cmake_minimum_required(VERSION 3.15) 

project(dependencies_test) 

find_package(OpenCV 4 REQUIRED)
find_package(Ceres REQUIRED)
find_package(Pangolin REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem)
find_package(Eigen3 3.3 REQUIRED)
find_package(glog REQUIRED)

add_executable(${PROJECT_NAME}
    glog-eigen-usage.cpp
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    ${OpenCV_LIBS}
    pangolin
    ceres
    Eigen3::Eigen
    boost_filesystem
    glog::glog
    gomp
)

# get_target_property(eigen_includes Eigen3::Eigen INTERFACE_INCLUDE_DIRECTORIES)
# message(STATUS "eigen_includes ${eigen_includes}")