MAKEGLOSSARIES= makeglossaries
BIBTEX= biber
LATEX= lualatex

libdoc.pdf: libdoc.tex
	$(LATEX) libdoc.tex
	$(LATEX) libdoc.tex

clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml

realclean:
	rm -rf *.aux *.bbl *.bcf *.blg *.glg *.glo *.gls *.lot *.toc *.idx *.out *.ist *.lof *.log *.lol *.ptc *.run.xml libdoc.pdf
