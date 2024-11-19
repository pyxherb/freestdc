foreach(i ${CMAKE_SYSTEM_PREFIX_PATH})
	message(CHECK_START "Finding include directory of FreeSTDC: ${i}/freestdc/include")

	find_path(FREESTDC_INCLUDE_DIRS NAMES "freestdc.h" HINTS "${i}/freestdc/include/freestdc")

	if (FREESTDC_INCLUDE_DIRS)
		message(CHECK_PASS "Found include directory of PbOS Commons: ${FREESTDC_INCLUDE_DIRS}")
		break()
	endif()
endforeach()

foreach(i ${CMAKE_SYSTEM_PREFIX_PATH})
	message(CHECK_START "Finding library of FreeSTDC: ${i}/freestdc/lib/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_SYSTEM_NAME}")

	find_library(FREESTDC_LINK_LIBRARIES NAMES freestdc HINTS "${i}/freestdc/lib/${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_SYSTEM_NAME}")

	if (FREESTDC_LINK_LIBRARIES)
		message(CHECK_PASS "Found library of FreeSTDC: ${FREESTDC_LINK_LIBRARIES}")
		break()
	endif()
endforeach()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
    FreeSTDC
    REQUIRED_VARS FREESTDC_INCLUDE_DIRS FREESTDC_LINK_LIBRARIES)
