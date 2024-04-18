cmake_minimum_required(VERSION 3.25.2)


if (UNIX)
   
    set(CMAKE_GENERATOR "Ninja")
    set(CMAKE_C_COMPILER "clang")
    set(CMAKE_CXX_COMPILER "clang++")

   set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API "2182bf5c-ef0d-489a-91da-49dbc3090d2a")
   set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FORMAT "clang")
   set(CMAKE_EXPERIMENTAL_CXX_MODULE_MAP_FLAG "@<MODULE_MAP_FILE>")

   project(cubera)

   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -isystem /usr/lib/llvm-17/lib/clang/17/include -Wall -Wextra -Wunused-parameter")
endif()

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if (WIN32)
        add_definitions("/utf-8")
        add_definitions("/wd4828 /wd4267")
        
        set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /Zf /O3 /openmp /MP /std:c++20 /bigobj /await:strict")
        set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /Zf /O0 /openmp /MP /std:c++20 /bigobj /await:strict")
        set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} /Zf /O3 /openmp /MP /std:c20 /bigobj /await:strict")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} /Zf /O0 /openmp /MP /std:c20 /bigobj /await:strict")
        

        
        add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
        add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")

    else()
   
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++20  -Wunused-result")
        set(CXX_FLAGS "${CXX_FLAGS} -std=c++20 -Wunused-result")

        add_compile_options(-fmodules)
        add_compile_options(-fbuiltin-module-map)
        add_compile_options(-fimplicit-module-maps)
        add_compile_options(-fprebuilt-module-path=${PREBUILT_MODULE_PATH})

    endif ()



file(GLOB_RECURSE SOURCE_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.ui
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.qrc
        )


file(GLOB_RECURSE CURRENT_HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.hpp)



file(GLOB_RECURSE FAST_MODULES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.ixx
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cxx
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cppm)


add_executable(cubera
        ${SOURCE_FILES}
        ${CURRENT_HEADERS}
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)

target_sources(
        cubera
        PUBLIC
        ${FAST_MODULES}
)