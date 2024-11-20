cmake_minimum_required(VERSION 3.23)
project(FreeSTDC VERSION 0.0.1)

# Setup basic build settings
enable_language(ASM_NASM)

# Library
add_library(freestdc STATIC)

target_include_directories(
    freestdc
    SYSTEM BEFORE
    PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PUBLIC $<INSTALL_INTERFACE:include>)

add_subdirectory(include)
add_subdirectory(src)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	VERSION ${PACKAGE_VERSION}
	COMPATIBILITY SameMajorVersion
)

install(EXPORT ${PROJECT_NAME}Targets
		NAMESPACE FreeSTDC::
		DESTINATION "lib/cmake/${PROJECT_NAME}")

configure_package_config_file(
	${PROJECT_NAME}Config.cmake.in ${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION "lib/cmake/${PROJECT_NAME}"
)

install(FILES "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
			"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
		DESTINATION "lib/cmake/${PROJECT_NAME}")
