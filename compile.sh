#!/bin/bash

for src in *.pandoc
do
	pandoc --template=template.tpl -S -t html $src -o ${src/.pandoc/.tpl}
done

mv *.tpl snaplets/heist/templates/
mv snaplets/heist/templates/template.tpl .
