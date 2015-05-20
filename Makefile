.PHONEY: all
all: destinations.tpl haskell.tpl

destinations.tpl: destinations.pandoc
	pandoc -S -t html $< -o $@

%.html: %.pandoc
	pandoc --toc -s -S -t html $< -o $@

haskell.tpl: haskell.pandoc
	pandoc --toc --template=template.tpl -S -t html $< -o $@

%.svg: %.dia
	dia -e $@ $<

.PHONEY: upload
upload:
	chmod g+w destinations.tpl
	scp destinations.tpl haskell.tpl lambdacube3d.com:/home/www/hello/snaplets/heist/templates

