cmake_minimum_required(VERSION 3.29.2)



set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES ON)


add_library(cubera-static)

file(GLOB_RECURSE CUBERA_SOURCES 
        "./src/*.cpp"
        "./src/*.cppm")

target_sources(cubera PUBLIC
        FILE_SET CXX_MODULES FILES
                ${CUBERA_SOURCES}
)