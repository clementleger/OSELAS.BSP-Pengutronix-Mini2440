#
# Simple development makefile
#

#
# add more flags here,
# but don't remove the "+="
#
CFLAGS += -O2 -g -Wall #-Wsign-compare -Wfloat-equal -Wformat-security #-Werror
CPPFLAGS +=
LDFLAGS +=
PREFIX := /usr

all: ring-bell

clean:
	-rm -f ring-bell

install: ring-bell
	cp ring-bell $(DESTDIR)$(PREFIX)/bin/ring-bell

.PHONY: all install clean

# end of development makefile
