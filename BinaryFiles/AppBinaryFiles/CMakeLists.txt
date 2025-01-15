CMAKE_MINIMUM_REQUIRED(VERSION 3.1...3.31.1)

project(AppBinaryFiles CXX)

set(APP_SRC_FILES
	AppTestDB.cpp AppTestDB.h 
	database.cpp database.h
	deleteDB.cpp deleteDB.h
	UserComands.cpp UserComands.h
	UserInterface.cpp UserInterface.h
	UserDeleted.h
	main.cpp
	User.h
)

add_executable(AppBinaryFiles ${APP_SRC_FILES})

#target_link_libraries(AppBinaryFiles libCommand)

#target_include_directories(AppBinaryFiles PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} )

set_target_properties(AppBinaryFiles PROPERTIES COMPILE_FLAGS "/W4 /wd4251 /wd4275")
set_target_properties(AppBinaryFiles PROPERTIES FOLDER "AllProjs")

