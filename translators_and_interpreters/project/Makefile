DOCDIR   = doc
BINARIES = willy
OBJECTS  = *.o *.hi
SOURCES  = willy.hs Abstract.hs
MODULES  = Lexer.x Parser.y

all:	$(BINARIES) doc

willy: $(SOURCES) $(MODULES)
	hmake -package containers willy

clean:
	rm -rf Lex*.hs Parser.hs $(OBJECTS) $(BINARIES) doc 

doc:	$(SOURCES) $(MODULES)
	test -d $(DOCDIR) || mkdir $(DOCDIR)
	rm -rf $(DOCDIR)/*
	ghc -cpp -E -optP-P -D__HADDOCK__ Lexer.hs -o Lex.hs
	haddock --html --odir=$(DOCDIR) $(SOURCES) Lex.hs Parser.hs
	rm -f Lex.hs

