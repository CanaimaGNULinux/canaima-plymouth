# Makefile

SHELL := sh -e

all: build

build:

	@echo "Convirtiendo SVG's > PNG's ..."
	@convert -background None img/spec0.svg img/spec0.png
	@convert -background None img/spec1.svg img/spec1.png
	@convert -background None img/spec2.svg img/spec2.png
        @convert -background None img/logo.svg img/logo.png

install:

	mkdir -p $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	cp img/*.png scripts/canaima-plymouth.plymouth scripts/canaima-plymouth.script $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	
uninstall:

	rm -rf $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/

clean:

	rm -rf img/spec*.png
	rm -rf img/logo*.png
	

distclean:

reinstall: uninstall install
