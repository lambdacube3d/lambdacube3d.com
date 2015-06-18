TEMPLATES=snaplets/heist/templates

.PHONEY: all
all: $(TEMPLATES)/destinations.tpl $(TEMPLATES)/haskell.tpl

$(TEMPLATES)/destinations.tpl: destinations.pandoc
	pandoc -S -t html $< -o $@

%.html: %.pandoc
	pandoc --toc -s -S -t html $< -o $@

$(TEMPLATES)/haskell.tpl: haskell.pandoc
	pandoc --toc --template=template.tpl -S -t html $< -o $@

%.svg: %.dia
	dia -e $@ $<

.PHONEY: upload
upload:
	chmod g+w destinations.tpl
	scp destinations.tpl haskell.tpl lambdacube3d.com:/home/www/hello/snaplets/heist/templates

