.PHONY: fonts
ALL: pdf

Lato.zip:
	curl -sLo Lato.zip https://www.latofonts.com/download/lato2ofl-zip/

JetBrainsMono.zip:
	curl -sLo JetBrainsMono.zip https://download-cf.jetbrains.com/fonts/JetBrainsMono-2.001.zip

fonts/FontAwesome.ttf:
	mkdir -p fonts
	curl -sLo fonts/FontAwesome.ttf https://github.com/posquit0/Awesome-CV/raw/master/fonts/FontAwesome.ttf

fonts: Lato.zip JetBrainsMono.zip fonts/FontAwesome.ttf
	unzip -q -n -j -d fonts Lato.zip "*.ttf"
	unzip -q -n -j -d fonts JetBrainsMono.zip "*.ttf"


pdf:
	xelatex resume.tex

pdfencrypt: resume.pdf
	qpdf resume.pdf --encrypt "" `pwgen 24` 256 --print=full --extract=y --modify=none -- outfile.pdf
