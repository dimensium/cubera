cmake_minimum_required(VERSION 3.29.2)

project(cubera CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)


add_executable(cubera "")



add_subdirectory(src)