#!/usr/bin/make -f

SGML_SOURCE=module-assistant.8.sgml
MANPAGE=module-assistant.8
HTMLDOC=index.html

all: doc
	$(MAKE) -C po

doc: $(MANPAGE) $(HTMLDOC)

$(MANPAGE): $(SGML_SOURCE)
	docbook2man $(SGML_SOURCE)
	rm -f manpage.links manpage.refs

$(HTMLDOC): $(SGML_SOURCE)
	docbook2html $(SGML_SOURCE)
	rm -f manpage.links manpage.refs

install:
	mkdir -p $(DESTDIR)/usr/bin
	cp -a module-assistant $(DESTDIR)/usr/bin
	ln -sf module-assistant $(DESTDIR)/usr/bin/m-a
	mkdir -p $(DESTDIR)/usr/share
	cp -r modass $(DESTDIR)/usr/share
	mkdir $(DESTDIR)/var/cache/modass -p
	$(MAKE) -C po install DESTDIR=$(DESTDIR)

clean:
	$(MAKE) -C po clean
	rm -f manpage.*
	rm -f $(MANPAGE) $(HTMLDOC)
