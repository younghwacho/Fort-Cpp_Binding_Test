#!/bin/bash
rm -f a.out *.o

# GNU
#g++ -c function.cpp
#gfortran -c main.f90
#gfortran function.o main.o

# INTEL
#icc -c function.cpp # Error
icx -c function.cpp
ifort -c main.f90
ifort function.o main.o
