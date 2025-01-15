cmake_minimum_required(VERSION 3.31.1)
project(libDatabase CXX)

set(LIBUTILS_SRCS
   Database.h Database.cpp
)

add_library(libDatabase STATIC ${LIBUTILS_SRCS})

target_include_directories(libDatabase PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}) 

#target_compile_definitions(libDatabase PUBLIC $<$<BOOL:${NO_USE_LOG}>:NESTINGLIB_NO_LOG>)

set_target_properties(libDatabase PROPERTIES FOLDER "BaseLibs")
