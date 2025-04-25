cmake_minimum_required(VERSION 3.13)

project(MILLIFORTH-6502-PROJECT C ASM)

add_subdirectory(tools)

add_executable(sector6502)
rp6502_executable(sector6502 START 0x300 RESET 0x300)
target_link_options(sector6502 PRIVATE
    -C ${CMAKE_CURRENT_SOURCE_DIR}/src/rp6502.cfg
)
target_sources(sector6502 PRIVATE
    src/sector-6502.s
    src/rp6502.s
)
