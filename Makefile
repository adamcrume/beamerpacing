all: manual.pdf

manual.pdf: manual.tex
	pdflatex -halt-on-error -file-line-error manual.tex

.PHONY: clean
clean:
	rm -f *.aux
	rm -f *.dvi
	rm -f *.glo
	rm -f *.idx
	rm -f *.log
	rm -f *.pdf
