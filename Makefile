destinations.tpl: destinations.pandoc
	pandoc -S -t html $< -o $@

destinations.html: destinations.pandoc
	pandoc -s -S -t html $< -o $@

%.svg: %.dia
	dia -e $@ $<

.PHONEY: upload
upload:
	scp destinations.tpl lambdacube3d.com:/home/www/hello/snaplets/heist/templates

