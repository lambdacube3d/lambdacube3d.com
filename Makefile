TEMPLATES=snaplets/heist/templates
TPL=$(TEMPLATES)/destinations.tpl $(TEMPLATES)/questions.tpl $(TEMPLATES)/haskell.tpl
STATIC=static/goteborg.html static/600px-Green500_evolution.png static/cpu-vs-gpu-thumbnail.png static/GeForce_GTX_980_Block_Diagram_FINAL_575px.png

.PHONEY: all
all: $(TPL) static/goteborg.html

$(TEMPLATES)/destinations.tpl: destinations.pandoc
	pandoc -S -t html $< -o $@

$(TEMPLATES)/questions.tpl: questions.pandoc template.tpl
	pandoc --toc --template=template.tpl -S -t html $< -o $@

$(TEMPLATES)/haskell.tpl: haskell.pandoc template.tpl
	pandoc --toc --template=template.tpl -S -t html $< -o $@

static/goteborg.html: goteborg.pandoc
	pandoc -s -S -t slidy --slide-level=2 $< -o $@

%.html: %.pandoc
	pandoc --toc -s -S -t html $< -o $@

%.svg: %.dia
	dia -e $@ $<

.PHONEY: upload
upload:
	chmod g+w $(TPL)
	scp $(TPL) lambdacube3d.com:/home/www/hello/snaplets/heist/templates
#	scp $(STATIC) lambdacube3d.com:/home/www/hello/static

