
# 设置工程名字
project(dte-screen-recorder VERSION 1.0.0)

set(TARGET_NAME ${CMAKE_PROJECT_NAME}-test)
add_definitions(-DUNITTEST)

find_package(PkgConfig REQUIRED)

file (GLOB CXXSOURCES
    ./*.cpp
    )

file (GLOB HEADERS
    ./*.h
    )
file (GLOB_RECURSE RESOURCES  ../${CMAKE_PROJECT_NAME}.qrc)

add_executable( ${TARGET_NAME} ${CXXSOURCES} ${RESOURCES})

# 添加第三方库的所有文件夹路径到工程中来(注意 *_INCLUDE_DIRS)

include_directories(${PROJECT_BINARY_DIR})
include_directories(${PROJECT_SOURCE_DIR})

#configure_file(${PROJECT_SOURCE_DIR}/config.h.in  @ONLY)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# 添加gocv覆盖率文件的输出
#set(CMAKE_CXX_FLAGS "-g -fprofile-arcs -ftest-coverage")
set(CMAKE_CXX_FLAGS "-fsanitize=undefined,address,leak -fno-omit-frame-pointer -g -fprofile-arcs -ftest-coverage")
set(CMAKE_C_FLAGS "-fsanitize=undefined,address,leak -fno-omit-frame-pointer")
set(CMAKE_Ｌ_FLAGS "-fsanitize=undefined,address,leak -fno-omit-frame-pointer")
set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE ON)

set(OBJECT_DIR ${CMAKE_BINARY_DIR}/CMakeFiles/objects)

