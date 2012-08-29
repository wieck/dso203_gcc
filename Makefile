# ----------------------------------------------------------------------
# Makefile
#
#	Toplevel UNIX style Makefile to build the DSO203_GCC firmware.
#	Everything is actually done in ./Bin
# ----------------------------------------------------------------------

all:
	$(MAKE) -C Bin all

clean:
	$(MAKE) -C Bin clean

