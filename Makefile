MAKEGLOSSARIES= makeglossaries
BIBTEX= biber
LATEX= lualatex
CHAPTERS= chapter1/chapter1.tex chapter2/chapter2.tex chapter3/chapter3.tex chapter4/chapter4.tex chapter5/chapter5.tex \
	chapter5/fft.tex chapter5/linalg.tex chapter5/ml.tex chapter5/rng.tex chapter5/thrust.tex chapter6/chapter6.tex chapter7/chapter7.tex
DATA= chapter3/plots/matmul.dat chapter3/plots/prec.dat chapter5/plots/fft.dat chapter5/plots/thrust.dat

all:
	make skript.pdf
	make libdoc/libdoc.pdf
	make exercise/exercise.pdf

force: 
	$(LATEX) skript.tex
	$(MAKEGLOSSARIES) skript
	$(BIBTEX) skript
	$(LATEX) skript.tex
	$(LATEX) skript.tex
	$(LATEX) exercise/exercise.tex
	$(LATEX) exercise/exercise.tex
	$(LATEX) libdoc/libdoc.tex
	$(LATEX) libdoc/libdoc.tex

skript.pdf: skript.tex $(CHAPTERS) $(DATA)
	$(LATEX) skript.tex

skript:
	make skript.pdf
	make skript.pdf

skript.bbl:$(FORCEBIBER)
bib:
	$(LATEX) skript.tex
	make skript.bbl FORCEBIBTEX=forcebiber
	$(LATEX) skript.tex
	$(LATEX) skript.tex
forcebiber: lit.bib
	$(BIBTEX) skript

skript.gls:$(FORCEGLOSSARY)
glossary:
	$(LATEX) skript.tex
	make skript.gls FORCEGLOSSARY=forceglossary
	$(LATEX) skript.tex
	$(LATEX) skript.tex
forceglossary: glossary.tex
	$(MAKEGLOSSARIES) skript

clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml

realclean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml titlepage.pdf skript.pdf
