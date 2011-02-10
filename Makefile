# Makefile

SHELL := sh -e

all: test build

test:
	@echo "Nada para comprobar!"

build:
	@echo "Nada para compilar!"

install:
	# Instalando tema grafico
	mkdir -p $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	cp img/* scripts/canaima-plymouth.plymouth scripts/canaima-plymouth.script $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	
uninstall:

	rm -rf $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/

clean:

distclean:

reinstall: uninstall install
