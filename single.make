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

all::
	@$(MAKE) $(PRODUCT_BIN) $(OTHER_TARGETS)

include $(MAKEFILEDIR)/common.make

$(PRODUCT_BIN): $(PRODUCT_DEPENDS) | $(BINDIR)
	$(CC) $(CFLAGS) $(OTHER_CFLAGS) -o $@ $(OFILES) $(PRODUCT_OFILES) $(LIBS) $(OTHER_LIBS)

$(PRODUCT).debug: $(PRODUCT_DEPENDS)
	$(CC) $(CFLAGS) $(OTHER_CFLAGS) -o $@ $(OFILES) $(PRODUCT_OFILES) $(LIBS) $(OTHER_LIBS)
