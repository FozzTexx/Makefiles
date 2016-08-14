# If PRODUCT= line is missing, be sure to insert one
# $(PRODUCT).c will be automatically compiled, so it
# doesn't need to be inserted below
CFILES= 
CFLAGS= -O -g -Wall -I$(HOME)/lib/include

-include Makefile.preamble

include $(HOME)/lib/multi.make

-include Makefile.postamble

-include Makefile.dependencies
