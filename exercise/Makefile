LATEX= lualatex

exercise.pdf: exercise.tex
	$(LATEX) exercise.tex
	$(LATEX) exercise.tex

clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml

realclean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml exercise.pdf
