PDFLATEX_OPTS = -halt-on-error \
	-file-line-error

all: example-with-notes.pdf
.PHONY: all


example.pdf: example.tex \
			beamerpacing.sty
	@pdflatex $(PDFLATEX_OPTS) -draftmode example | tee pdflatex.out
	@if grep -q 'Fatal error' pdflatex.out; then \
		exit 1; \
	fi
	@while [ -f .rebuild ] || grep -q '^LaTeX Warning:.*Rerun' pdflatex.out; do \
		rm -f .rebuild; \
		pdflatex $(PDFLATEX_OPTS) -draftmode example | tee pdflatex.out; \
		if grep -q 'Fatal error' pdflatex.out; then \
			exit 1; \
		fi \
	done
	@pdflatex $(PDFLATEX_OPTS) example | tee pdflatex.out
	@if grep -q 'Fatal error' pdflatex.out; then \
		exit 1; \
	fi


example-with-notes.pdf: example.pdf
	mkdir -p build/notes
	pdflatex $(PDFLATEX_OPTS) -jobname example -output-directory build/notes "\def\mybeameropts{show notes on second screen}\input{example.tex}"
	cp build/notes/example.pdf example-with-notes.pdf


clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.eps
	rm -f *.log
	rm -f *.pdf
	rm -f *.vrb
	rm -f .rebuild
	rm -f pdflatex.out
	rm -rf build

.PHONY: clean
