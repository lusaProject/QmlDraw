project(dte-draw LANGUAGES CXX)

if (NOT VERSION)
    set(VERSION "1.0.0.1")
endif()

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(APP_BIN_INSTALL_DIR ${CMAKE_INSTALL_PREFIX}/bin/)
set(BIN_NAME ${CMAKE_PROJECT_NAME})

set(QtModule Qml Core Gui Quick DBus)
#find the Qt5Quick library
find_package(Qt5 COMPONENTS ${QtModule} REQUIRED)
find_package(PkgConfig REQUIRED)

SET(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} -g -Wl,--as-need -fPIE")
SET(CMAKE_C_FLAGS "$ENV{CFLAGS} -O3  -Wl,--as-need -fPIE")
SET(CMAKE_EXE_LINKER_FLAGS  "-pie")
add_compile_options(-fPIC)

configure_file(${PROJECT_SOURCE_DIR}/config.h.in ${PROJECT_BINARY_DIR}/config.h @ONLY)

include_directories(${Qt5Quick_INCLUDE_DIRS}
                    ${PROJECT_BINARY_DIR})

# 源文件
file(GLOB_RECURSE SRCS
    ./*.h
    ./*.cpp
    )

# ADD EXE
add_executable(${BIN_NAME} ${SRCS} ../${CMAKE_PROJECT_NAME}.qrc)

target_link_libraries(${BIN_NAME} Qt5::Quick Qt5::Gui Qt5::Qml Qt5::Core Qt5::DBus GL pthread)

install(TARGETS ${BIN_NAME} DESTINATION ${APP_BIN_INSTALL_DIR})
