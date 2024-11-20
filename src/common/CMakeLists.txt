file(GLOB SRC *.c *.h *.asm *.s *.S)

target_sources(${FREESTDC_TARGET_NAME} PRIVATE ${SRC})
