#
# If you modify these variables, please also
# modify them in the config file ~/.goupdaterrc!

# versioned binaries reside here
bindir  = $(HOME)/.gobins

# symlinks to  the binaries  reside here,  add this  dir to  your PATH
# environment variable
linkdir = $(HOME)/bin

# no need to modify anything below
tool    = goupdater
version = $(shell egrep "^version=" goupdater | cut -d'=' -f2)
archs   = darwin-amd64 darwin-arm64 linux-amd64 linux-arm64 windows-amd64 freebsd-amd64

all:
	@echo "Type 'make install' to install $(tool)"

install:
	install -m 755 -d $(bindir)
	install -m 755 -d $(linkdir)
	install -m 755 $(tool) $(bindir)/$(tool)-$(version)
	ln -sf $(bindir)/$(tool)-$(version) $(linkdir)/$(tool)

release:
	mkdir -p releases
	for arch in $(archs); do \
		cp $(tool) releases/$(tool)-$$arch-$(version); \
		sha256sum releases/$(tool)-$$arch-$(version) | cut -d' ' -f1 > \
			releases/$(tool)-$$arch-$(version).sha256; \
	done
