# usage: make icesheet
export PATH := /apps/share64/debian10/intel/ifort/compiler/latest/bin:$(PATH)

# Note, 09/05/2024:
# ifort: remark #10448: Intel(R) Fortran Compiler Classic (ifort) is now deprecated and will be discontinued late 2024.
# Intel recommends using the LLVM-based Intel (R) Fortran Compiler (ifx).
FC = gfortran
#FC = ifort

# If using gfortran, use this
FCFLAGS = -O2

# if compiling with the Intel Fortran compiler, you need to add an extra flag. Using the Intel fortran compiler is strongly recommended!
#FCFLAGS = -O2 -assume byterecl

objfiles =  global_parameters.o grids.o read_icefile.o  find_flowline_fisher_adaptive_4.o flowline_location.o 

# Default directory for the icesheet executable
#BINDIR=.
# Ghub directory for the icesheet executable
BINDIR=../bin

icesheet: icesheet.f90 $(objfiles)
	$(FC) -o $(BINDIR)/icesheet $(FCFLAGS) icesheet.f90 $(objfiles)

global_parameters.o: global_parameters.f90
	$(FC) -o global_parameters.o $(FCFLAGS) -c global_parameters.f90

grids.o: grids.f90
	$(FC) -o grids.o $(FCFLAGS) -c grids.f90

read_icefile.o: read_icefile.f90
	$(FC) -o read_icefile.o $(FCFLAGS) -c read_icefile.f90

find_flowline_fisher_adaptive_4.o: find_flowline_fisher_adaptive_4.f90
	$(FC) -o find_flowline_fisher_adaptive_4.o $(FCFLAGS) -c find_flowline_fisher_adaptive_4.f90

flowline_location.o: flowline_location.f90
	$(FC) -o flowline_location.o $(FCFLAGS) -c flowline_location.f90


