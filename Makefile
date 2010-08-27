# Makefile

SHELL := sh -e

SCRIPTS = scripts/*.sh

all: test build

test:
	# Estas pruebas no son necesarias al no tener verdaderos scripts 
	# en bash a la hora de la ejecucion, solo como prueba, pero se deja
	# para mas adelante.
	@echo -n "Comprobando posibles errores de sintaxis"

	@for SCRIPT in $(SCRIPTS); \
	do \
		sh -n $${SCRIPT}; \
		echo -n "."; \
	done

	@echo " Hecho!"

	@echo -n "Iniciando bashisms"

	@if [ -x /usr/bin/checkbashisms ]; \
	then \
		for SCRIPT in $(SCRIPTS); \
		do \
			checkbashisms -f -x $${SCRIPT} || true; \
			echo -n "."; \
		done; \
	else \
		echo "ADVERTENCIA: Obviando bashisms - Necesitas instalar el paquete devscripts"; \
	fi

	@echo " Hecho!"

build:
	@echo "Nada para compilar!"

install:
	# Installing shared data
	mkdir -p $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	cp img/* scripts/canaima-plymouth.plymouth scripts/canaima-plymouth.script $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/

	# Installing documentation
	mkdir -p $(DESTDIR)/usr/share/doc/canaima-plymouth/
	cp COPYING AUTHORS CREDITS README $(DESTDIR)/usr/share/doc/canaima-plymouth/

uninstall:
	# Uninstalling shared data
	rm -rf $(DESTDIR)/usr/share/plymouth/themes/canaima-plymouth/
	
	# Uninstalling documentation
	rm -rf $(DESTDIR)/usr/share/doc/canaima-plymouth

clean:

distclean:

reinstall: uninstall install
