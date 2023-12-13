#!/bin/bash


bison -dvt -o parser.cpp parser.ypp
flex -d -o lexer.cpp lexer.l
g++ -Wall -Wextra -o parser main.cpp lexer.cpp parser.cpp -lfl