cmake_minimum_required(VERSION 3.13)

project(MY-RP6502-PROJECT C ASM)

add_subdirectory(tools)

add_executable(hello)
rp6502_executable(hello START 0x300 RESET 0x300)
target_sources(hello PRIVATE
    src/sector-6502.s
    src/hal.s
)
