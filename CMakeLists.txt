cmake_minimum_required(VERSION 3.0)

project(dte-draw VERSION 1.0.0)

add_subdirectory(src)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_subdirectory(tests)
endif()


