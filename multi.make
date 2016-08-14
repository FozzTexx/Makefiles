# Part of Makefiles created by Chris Osborn <fozztexx@fozztexx.com>

# Useful things to insert into Makefile
#
# OTHER_CFLAGS=
# OTHER_OFILES=
# OTHER_FILES
# OTHER_LIBS=
# CLASSES=
# CFILES=
# MFILES=
# FFILES=
# HFILES=
#

include $(MAKEFILEDIR)/commondefs.make

PRODUCT_CFILES=$(PRODUCT:=.c)
PRODUCT_OBJECTS=$(PRODUCT_CFILES:.c=.o)
PRODUCT_OFILES := $(addprefix $(OBJDIR)/, $(PRODUCT_OBJECTS))

all::
	@(if [ -z "$(PRODUCT)" ] ; then \
		if [ -n "$(NAME)" ] ; then \
			echo Your Makefile is out of date. Replace NAME= with PRODUCT= ; \
			echo also change the line CFILES= to not contain $$\(PRODUCT\).c ; \
		else \
			echo PRODUCT undefined ; \
		fi ; \
	else \
		rm -f $(MAKEDEP) ; \
		for i in $(PRODUCT) ; do \
			echo $$i: $$i.o >> $(MAKEDEP) ; \
			echo "" >> $(MAKEDEP) ; \
		done ; \
		echo include Makefile >> $(MAKEDEP) ; \
		$(MAKE) $(PRODUCT) $(OTHER_TARGETS) ; \
		rm -f $(MAKEDEP) ; \
	fi)

include $(MAKEFILEDIR)/common.make

$(PRODUCT): $(PRODUCT_DEPENDS) $(PRODUCT_OFILES) $(OFILES)
	$(CC) $(CFLAGS) $(OTHER_CFLAGS) -o $@ $(OFILES) $@.o $(OTHER_LIBS) $(LIBS)
