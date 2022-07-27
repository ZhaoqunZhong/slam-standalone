cmake_minimum_required (VERSION 3.15)

project(test_run_time)

find_package(glog REQUIRED PATHS "${CMAKE_PROJECT_DIR}../install/lib/cmake/glog")
# find_package(gflags REQUIRED PATHS "/home/zhegushao/Documents/gflags-master/install/lib/cmake/gflags")

# set(CMAKE_INSTALL_RPATH_USE_LINK_PATH ON)
# message(STATUS "--------check rpath flag: ${CMAKE_INSTALL_RPATH_USE_LINK_PATH}")

add_executable(test_run_time
    test.cpp)

target_link_libraries(test_run_time PRIVATE 
glog::glog
# ${gflags_LIBRARIES}
)

target_include_directories(test_run_time PRIVATE ${CMAKE_PROJECT_DIR}../install/include)

get_target_property(test_run_time_include_dirs test_run_time INCLUDE_DIRECTORIES)
get_target_property(test_run_time_interface_include_dirs test_run_time INTERFACE_INCLUDE_DIRECTORIES)
message(STATUS "----------test_run_time_include_dirs: ${test_run_time_include_dirs}")
message(STATUS "----------test_run_time_interface_include_dirs: ${test_run_time_interface_include_dirs}")

# get_target_property(gflags_lib ${gflags_LIBRARIES} LOCATION)
# message(STATUS "gflags_lib: ${gflags_lib}")
get_target_property(glog_lib glog::glog LOCATION)
message(STATUS "----------glog_lib: ${glog_lib}")
get_target_property(glog_include_dirs glog::glog INCLUDE_DIRECTORIES)
get_target_property(glog_interface_include_dirs glog::glog INTERFACE_INCLUDE_DIRECTORIES)
message(STATUS "----------glog_include_dirs: ${glog_include_dirs}")
message(STATUS "----------glog_interface_include_dirs: ${glog_interface_include_dirs}")