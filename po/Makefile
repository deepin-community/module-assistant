#!/usr/bin/make -f

# Let's use wildcards instead of listing in extenso:
POFILES = $(wildcard *.po)
MOFILES = $(POFILES:.po=.mo)
LANGS   = $(POFILES:.po=)
localedir=/usr/share/locale

all: $(MOFILES)

messages.pot: ../module-assistant
	xgettext -L perl ../module-assistant -o $@

%.mo: %.po
	msgfmt --statistics $< -o $@

%.po: messages.pot
	msgmerge -U $@ messages.pot
	# msgmerge doesn't update the timestamp if the file
	# is up to date already:
	touch $@

clean:
	rm -f *~ *.mo

install: $(MOFILES)
	for lang in $(LANGS); do \
	  dir=$(localedir)/$$lang/LC_MESSAGES; \
	  install -d $(DESTDIR)$$dir; \
	  install -m 644 $$lang.mo $(DESTDIR)$$dir/module-assistant.mo; \
	done
