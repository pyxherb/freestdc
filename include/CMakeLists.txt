file(GLOB SRC *.c *.asm *.s *.S)
file(GLOB HEADERS *.h)

target_sources(${FREESTDC_TARGET_NAME} PRIVATE ${SRC} ${HEADERS})
add_subdirectory("common")

configure_file(
    freestdc.h.in
    ${CMAKE_CURRENT_SOURCE_DIR}/freestdc.h
)
