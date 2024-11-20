file(GLOB SRC *.c *.h *.asm *.s *.S)

target_sources(${FREESTDC_TARGET_NAME} PRIVATE ${SRC})

target_compile_definitions(${FREESTDC_TARGET_NAME} PRIVATE _FREESTDC_HAVE_NATIVE_memset=1)
target_compile_definitions(${FREESTDC_TARGET_NAME} PRIVATE _FREESTDC_HAVE_NATIVE_memcmp=1)
