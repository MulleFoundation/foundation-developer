
PIX=\
relationships.svg

%.png: %.dot
	dot -Tpng -o $*.png $<

%.svg: %.dot
	dot -Tsvg -o $*.svg $<

all: $(PIX)



