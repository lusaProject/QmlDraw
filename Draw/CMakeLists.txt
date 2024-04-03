cmake_minimum_required(VERSION 3.16)

project(Draw VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)


qt_add_executable(appDraw
    main.cpp favicon.rc
)

qt_add_qml_module(appDraw
    URI Draw
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES AttributeWidget.qml CanvasWidget.qml ColorSquare.qml DrawTools.qml GlobalVar.qml MainWindow.qml PickerWidget.qml
    RESOURCES res/ddc_brush_tool_normal_48px.svg res/ddc_choose_tools_normal_48px.svg res/ddc_ellipse_normal_36px.svg res/ddc_eraser_tool_normal_48px.svg res/ddc_hexagon_tool_normal_48px.svg res/ddc_line_tool_normal_48px.svg res/ddc_rectangle_tool_normal_48px.svg res/ddc_round_tool_normal_48px.svg res/ddc_screenshot_tool_normal_48px.svg res/ddc_smudge_tool_48px.svg res/ddc_smudge_tool_normal_48px.svg res/ddc_star_tool_normal_48px.svg res/ddc_text_tool_normal_48px.svg res/ddc_triangle_tool_normal_48px.svg res/notify_success_32px.svg res/warning_new_32px.svg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appDraw PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appDraw
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appDraw
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appDraw
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
