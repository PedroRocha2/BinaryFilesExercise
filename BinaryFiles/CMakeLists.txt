CMAKE_MINIMUM_REQUIRED(VERSION 3.2...3.31.1)

message(STATUS "")
message(STATUS "CMakeLists(BinaryFiles) ...")
message(STATUS "")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/IncludeCMake")

include(AllProjsPreSettings)

message(STATUS "#################################################")
message(STATUS "Project BinaryFiles...")
message(STATUS "")
project(BinaryFilesExercise VERSION 1.0.0 LANGUAGES CXX)

# My Libs
#add_subdirectory(libCommand)

# Apps
add_subdirectory(AppBinaryFiles)

message(STATUS "")
message(STATUS "CMakeLists(AppBinaryFiles) finished!")
message(STATUS "")
