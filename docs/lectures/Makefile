%.pdf: %.md
	pandoc $^ -t beamer -o $@ --pdf-engine=xelatex --variable minted --pdf-engine-opt=-shell-escape

