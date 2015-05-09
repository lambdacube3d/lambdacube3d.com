destinations.tpl: destinations.pandoc
	pandoc -t html $< -o $@

.PHONEY: upload
upload:
	scp destinations.tpl lambdacube3d.com:/home/www/hello/snaplets/heist/templates

