TEMPLATES=snaplets/heist/templates
TPL=$(TEMPLATES)/destinations.tpl $(TEMPLATES)/questions.tpl $(TEMPLATES)/haskell.tpl

.PHONEY: all
all: $(TPL)

$(TEMPLATES)/destinations.tpl: destinations.pandoc
	pandoc -S -t html $< -o $@

$(TEMPLATES)/questions.tpl: questions.pandoc template.tpl
	pandoc --toc --template=template.tpl -S -t html $< -o $@

$(TEMPLATES)/haskell.tpl: haskell.pandoc template.tpl
	pandoc --toc --template=template.tpl -S -t html $< -o $@

%.html: %.pandoc
	pandoc --toc -s -S -t html $< -o $@

%.svg: %.dia
	dia -e $@ $<

.PHONEY: upload
upload:
	chmod g+w $(TPL)
	scp $(TPL) lambdacube3d.com:/home/www/hello/snaplets/heist/templates

