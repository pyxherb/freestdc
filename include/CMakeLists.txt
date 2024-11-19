file(GLOB SRC *.c *.asm *.s *.S)
file(GLOB HEADERS *.h)

target_sources(freestdc PRIVATE ${SRC} ${HEADERS})
add_subdirectory("common")

install(FILES ${HEADERS} DESTINATION include/freestdc)

configure_file(
    freestdc.h.in
    ${CMAKE_CURRENT_SOURCE_DIR}/freestdc.h
)
