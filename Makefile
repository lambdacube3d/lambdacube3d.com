destinations.tpl: destinations.pandoc
	pandoc -S -t html $< -o $@

.PHONEY: upload
upload:
	scp destinations.tpl lambdacube3d.com:/home/www/hello/snaplets/heist/templates

