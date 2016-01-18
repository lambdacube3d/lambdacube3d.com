TEMPLATES=snaplets/heist/templates
PANDOC=$(wildcard *.pandoc)
#PANDOCSRC=$(patsubst %.pandoc,%,$(PANDOC))
TPL=$(patsubst %.pandoc,$(TEMPLATES)/%.tpl,$(PANDOC))
STATIC=static/slides.html static/600px-Green500_evolution.png static/cpu-vs-gpu-thumbnail.png static/GeForce_GTX_980_Block_Diagram_FINAL_575px.png
SERVER=dist/build/lambdacube3dcom/lambdacube3dcom

.PHONEY: all
all: $(TPL) static/slides.html $(SERVER)

$(SERVER): lambdacube3d.com.cabal $(wildcard src/*.hs)
	cabal install

$(TPL): $(TEMPLATES)/%.tpl: %.pandoc template.tpl
	pandoc --template=template.tpl -S -t html $< -o $@

#$(TEMPLATES)/destinations.tpl: destinations.pandoc
#	pandoc -S -t html $< -o $@

#$(TEMPLATES)/questions.tpl: questions.pandoc template.tpl
#	pandoc --toc --template=template.tpl -S -t html $< -o $@

#$(TEMPLATES)/haskell.tpl: haskell.pandoc template.tpl
#	pandoc --toc --template=template.tpl -S -t html $< -o $@

static/slides.html: slides.pandoc
	pandoc -s -S -t slidy --slide-level=2 $< -o $@

%.html: %.pandoc
	pandoc --toc -s -S -t html $< -o $@

%.svg: %.dia
	dia -e $@ $<

.PHONEY: clean
clean:
	rm $(TPL)

.PHONEY: localrun
localrun:
	./$(SERVER)

.PHONEY: upload
upload:
	chmod g+w $(TPL)
#	scp $(TPL) lambdacube3d.com:/home/www/hello/snaplets/heist/templates
	scp $(STATIC) lambdacube3d.com:/home/www/hello/static

