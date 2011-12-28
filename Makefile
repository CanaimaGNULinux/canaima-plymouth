# Makefile

SHELL := sh -e

all: build

build:

	@echo "Convirtiendo SVG's > PNG's ..."
	@convert img/logo-inicio.svg img/logo-inicio.png
	@convert img/logo-fin.svg img/logo-fin.png
	@convert img/fondo.svg img/fondo.png
	@echo "Procesando animación de Blender ..."
	@blender -b img/progress.blend -o //D -s 00 -e 40 -a

install:

	mkdir -p $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	cp img/*.png scripts/canaima-plymouth.plymouth scripts/canaima-plymouth.script $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	
uninstall:

	rm -rf $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/

clean:

	rm -rf img/D00*.png
	rm -rf img/logo*.png
	rm -rf img/fondo.png

distclean:

reinstall: uninstall install
