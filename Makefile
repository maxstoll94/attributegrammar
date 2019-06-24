default: all

all: src/AttributeGrammar.hs

#----------------------------

# uuagc:
#  -H              --haskellsyntax                 Use Haskell like syntax (equivalent to --lckeywords and --doublecolons --genlinepragmas)
#  -d              --data                          generate data type definition
#  -c              --catas                         generate catamorphisms
#  -f              --semfuns                       generate semantic functions
#  -w              --wrappers                      generate wappers for semantic domains
#  -s              --signatures                    generate signatures for semantic functions
src/AttributeGrammar.hs:
	cd src && uuagc -Hdcfws AttributeGrammar.ag --module AttributeGrammar

#----------------------------

clean:
	rm -f src/AttributeGrammar.hs src/*.hi src/*.o src/Main

.PHONY: default all clean
