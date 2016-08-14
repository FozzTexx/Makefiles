# Part of Makefiles created by Chris Osborn <fozztexx@fozztexx.com>

$(OBJDIR)/%.o : %.c
	$(CC) $(ALL_CFLAGS) -c $< -o $@
$(OBJDIR)/%.o : %.cpp
	$(CXX) $(CXXFLAGS) $(ALL_CFLAGS) -c $< -o $@
$(OBJDIR)/%.o : %.f
	$(FC) $(FFLAGS) $(OTHER_FFLAGS) -c $<
$(OBJDIR)/%.o : %.m
	$(CC) $(OCFLAGS) $(ALL_CFLAGS) -c $< -o $@
$(OBJDIR)/%.o : %.y
	$(YACC) $<
	$(CC) $(ALL_CFLAGS) -c y.tab.c
	rm -f y.tab.c
	mv y.tab.o $@

.c,v.c:
	co -q $*.c
.m,v.m:
	co -q $*.m
.h,v.h:
	co -q $*.h

$(OFILES) $(PRODUCT_OFILES): $(HFILES) | $(OBJDIR)

clean::
	$(RM) $(RMFLAGS) -r $(PRODUCT) $(MAKEDEPENDS) $(MAKEDEP) *~ *_obj *_bin $(OTHER_GARBAGE)

debug::
	@$(MAKE) $(PRODUCT).debug "CFLAGS = -DDEBUG $(CFLAGS)" "DIRNAME = debug_"

shar::
	shar Makefile $(PRODUCT_CFILES) $(CFILES) $(HFILES) $(OTHER_FILES) > part01

$(MAKEDEPENDS):: $(CLASSES) $(MFILES) $(CFILES)
	$(RM) $(RMFLAGS) $(MAKEDEPENDS) 
	$(CC) -MM $(CFLAGS) $(CLASSES) $(MFILES) $(CFILES) | sed -re 's,([^:]+:),$$(OBJDIR)/\1,' >  $(MAKEDEPENDS)

depend:: $(MAKEDEPENDS)

$(OBJDIR):
	mkdir $(OBJDIR)
$(BINDIR):
	mkdir $(BINDIR)
