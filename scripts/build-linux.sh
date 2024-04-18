#!/usr/bin/bash

cmake . -B build -G "Ninja" \
    -D CMAKE_C_COMPILER="clang" \
    -D CMAKE_CXX_COMPILER="clang++" \
    -D CMAKE_EXPORT_COMPILE_COMMANDS=TRUE

cmake --build build -j4