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

$(PRODUCT_BIN):: $(PRODUCT_DEPENDS) | $(BINDIR)

$(PRODUCT_BIN):: $(OFILES)
	$(RM) $(RMFLAGS) $@
	$(AR) $(ARFLAGS) $@ $^
	ranlib $@

$(PRODUCT):: $(PRODUCT_BIN)
