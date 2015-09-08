
# NOMES
TEXFILE=main.tex

# REGRAS
PDFFILE=$(TEXFILE:%.tex=%.dvi)

all: $(PDFFILE) 

$(PDFFILE): main.tex
	pdflatex $(@:%.dvi=%.tex)
	bibtex $(@:%.dvi=%)
	#makeindex main.nlo -s nomencl.ist -o main.nls
	pdflatex $(@:%.dvi=%.tex)
	pdflatex $(@:%.dvi=%.tex)

clean:
	@rm -vf *.aux *.glo *.gls *.glg *.dvi *.ps *.out *.brf *.ist *.spl
	@rm -vf *.lo[gtfa] *.toc *.idx *.inc *.ilg *.ind *.bbl *.blg *.backup
	@rm -vf *.maf *.mtc *.mtc?
	@find . -name "*.log" -exec rm -fv {} \;
	@find . -name "*.bak" -exec rm -fv {} \;
	@find . -name "*~" -exec rm -fv {} \;
	@find . -name "*.aux" -exec rm -fv {} \;

deepclean: clean
	@rm -vf main.pdf 
