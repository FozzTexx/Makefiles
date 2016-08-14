# Part of Makefiles created by Chris Osborn <fozztexx@fozztexx.com>

.SUFFIXES: .m .h,v .c,v .m,v .js .jh

ARCH := $(shell arch)
RC_HOSTTYPE := $(OSTYPE)-$(ARCH)
OBJDIR := $(RC_HOSTTYPE)_obj
BINDIR := $(RC_HOSTTYPE)_bin

LIBS=	-L$(HOME)/Unix/$(OSTYPE)/lib/$(ARCH) -lobjc -lpthread -ldl

OBJECTS := $(CFILES:.c=.o) $(MFILES:.m=.o) $(FFILES:.f=.o) $(CLASSES:.m=.o) \
	$(CPPFILES:.cpp=.o) $(OTHER_OFILES)
OFILES := $(addprefix $(OBJDIR)/, $(OBJECTS))
PRODUCT_DEPENDS= $(OFILES) $(HFILES)
PRODUCT_BIN := $(addprefix $(BINDIR)/, $(PRODUCT))
MAKEDEP=Makefile.depend
MAKEDEPENDS=Makefile.dependencies

ALL_CFLAGS= $(CFLAGS) $(OTHER_CFLAGS)

