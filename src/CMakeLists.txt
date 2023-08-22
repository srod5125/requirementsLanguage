cmake_minimum_required(VERSION 3.13.4)

project(req_lang)


# uncomment to send project exectuable to bin (requires sudo: make sudo install)
# install(TARGETS ${PROJECT_NAME} DESTINATION bin)

# where to put libraries and paths
# target_include_directories(${PROJECT_NAME} PUBLIC lib_path)
# target_link_libraries(${PROJECT_NAME} lib )

find_package(BISON)
find_package(FLEX)


BISON_TARGET(req_parser ${CMAKE_SOURCE_DIR}/parser/parser.y ${CMAKE_SOURCE_DIR}/src/parser.cpp )
FLEX_TARGET(req_lexer ${CMAKE_SOURCE_DIR}/lexer/lexer.l ${CMAKE_SOURCE_DIR}/lexer/lexer.cpp)
ADD_FLEX_BISON_DEPENDENCY(req_lexer req_parser)

set(SOURCES
    ${PROJECT_SOURCE_DIR}/reqLangMain.cpp
)

add_executable(${PROJECT_NAME} 
    ${SOURCES}
    ${BISON_req_parser_OUTPUTS}
    ${FLEX_req_lexer_OUTPUTS}
)

target_link_libraries(${PROJECT_NAME}
    ${FLEX_LIBRARIES}
)