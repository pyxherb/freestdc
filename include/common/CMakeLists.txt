file(GLOB SRC *.c *.asm *.s *.S)
file(GLOB HEADERS *.h)

target_sources(${FREESTDC_TARGET_NAME} PRIVATE ${SRC} ${HEADERS})

install(FILES ${HEADERS} DESTINATION include/freestdc/common/)
