DOCDIR = doc
BINARIES = Prologs
OBJECTS  = *.o *.hi
SOURCES  = Prologs.hs

all: $(BINARIES) doc

Prologs : $(SOURCES) 
	  hmake Prologs

clean: rm -rf Prologs*.hs $(OBJECTS) $(BINARIES) doc

doc:	$(SOURCES) $(MODULES)
	test -d $(DOCDIR) || mkdir $(DOCDIR)
	rm -rf $(DOCDIR)/*
	ghc -cpp -E -optP-P -D__HADDOCK__ Prologs.hs -o Prolog.hs
	haddock --html --odir=$(DOCDIR) $(SOURCES) Prolog.hs
	rm -f Prolog.hs

