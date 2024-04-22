module;

#include <iostream>

export module lib;

export void print() {
    std::cout << "hello from C++20" << std::endl;
}