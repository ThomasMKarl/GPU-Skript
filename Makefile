MAKEGLOSSARIES= makeglossaries
BIBTEX= biber
LATEX= lualatex
CHAPTERS= chapter1/chapter1.tex chapter2/chapter2.tex chapter3/chapter3.tex chapter4/chapter4.tex chapter5/chapter5.tex \
	chapter6/fft.tex chapter6/linalg.tex chapter6/ml.tex chapter6/nccl.tex chapter6/nvgraph.tex chapter6/rng.tex chapter6/thrust.tex \
	chapter6/chapter6.tex chapter7/chapter7.tex chapter8/chapter8.tex chapter9/chapter9.tex chapter10/chapter10.tex
DATA= chapter3/plots/matmul.dat chapter3/plots/prec.dat chapter6/plots/fft.dat chapter6/plots/thrust.dat

all:
	make skript
	make libdoc
	make exercise

force:
	make realclean
	$(LATEX) skript.tex
	$(MAKEGLOSSARIES) skript
	$(BIBTEX) skript
	$(LATEX) skript.tex
	$(LATEX) skript.tex
	$(LATEX) exercise/exercise.tex
	$(LATEX) exercise/exercise.tex
	$(LATEX) libdoc/libdoc.tex
	$(LATEX) libdoc/libdoc.tex

skript: skript.tex $(CHAPTERS) $(DATA)
	$(LATEX) skript.tex
	$(LATEX) skript.tex

libdoc: libdoc/libdoc.tex
	$(LATEX) libdoc/libdoc.tex
	$(LATEX) libdoc/libdoc.tex
	mv libdoc.pdf -f libdoc/

exercise: exercise/exercise.tex
	$(LATEX) exercise/exercise.tex
	$(LATEX) exercise/exercise.tex
	mv exercise.pdf -f exercise/

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
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml skript.pdf
