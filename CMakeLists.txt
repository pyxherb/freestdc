cmake_minimum_required(VERSION 3.23)
if(NOT FREESTDC_TARGET_NAME)
    set(FREESTDC_TARGET_NAME freestdc)
endif()

project(${FREESTDC_TARGET_NAME} VERSION 0.0.1)

message("FreeSTDC target name: ${FREESTDC_TARGET_NAME}")

# Setup basic build settings
enable_language(ASM_NASM)

# Library
add_library(${FREESTDC_TARGET_NAME} STATIC)

target_include_directories(
    ${FREESTDC_TARGET_NAME}
    SYSTEM BEFORE
    PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PUBLIC $<INSTALL_INTERFACE:include>)

add_subdirectory(include)
add_subdirectory(src)
