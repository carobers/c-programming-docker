# program linking experiment
IDIR=/usr/local/include
LDIR=/usr/local/lib
.PHONY: all, clean

all:
	@echo "No Default Action. Make a specific target or experiment from below:"
	@echo "app    	  - Normal program build, No Error, Static Build"


folder:
	mkdir -p build

app: folder myprogram.c
	gcc \
		-Werror -pedantic -Wall -Werror -static \
		-I${IDIR} -L${LDIR} \
		myprogram.c -o build/app \
		-lhdf5_hl -lhdf5 -ldl -lm -lz\

	@echo "It worked anyway so idk what is going on with dlopen"

clean:
	rm -rf build