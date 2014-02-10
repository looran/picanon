PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

all:
	@echo "Run \"sudo make install\" to install picanon"

install:
	install -m 0755 picanon.sh $(BINDIR)/picanon
