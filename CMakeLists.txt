cmake_minimum_required(VERSION 3.25)

if(EXISTS ${CMAKE_CURRENT_LIST_DIR}/ndkpath.txt)
    file (STRINGS "ndkpath.txt" CMAKE_ANDROID_NDK)
endif()

include (${CMAKE_CURRENT_LIST_DIR}/cmake/quest.cmake)

project(conditional-dependencies)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED 20)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR}/src)
set(INCLUDE_DIR ${CMAKE_CURRENT_LIST_DIR}/include)

file(GLOB_RECURSE cpp_list ${SOURCE_DIR}/*.cpp)

include_directories(
    ${INCLUDE_DIR}
    ${SHARED_DIR}
    ${EXTERN_DIR}/includes
)

add_compile_options(-O3 -fvisibility=hidden)

add_compile_definitions(
    MOD_ID="${PACKAGE_ID}"
    VERSION="${PACKAGE_VERSION}"
)

add_link_options(-llog ${EXTERN_DIR}/libs/libsl2.so)

add_library(
    conditional-dependencies-test-1
    SHARED
    ${SOURCE_DIR}/test.cpp
    ${SOURCE_DIR}/another_testing_translationUnit.cpp
)

add_library(
    conditional-dependencies-test-2
    SHARED
    ${SOURCE_DIR}/test2.cpp
    ${SOURCE_DIR}/another_testing_translationUnit.cpp
)
