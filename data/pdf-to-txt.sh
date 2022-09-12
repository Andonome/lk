#!/bin/bash

pdftoppm -png input.pdf page

for x in *png; do
	tesseract -l eng  "$x" - >> out.tex
done

rm *png

sed -i -ze :a -e 's/\([a-z]\)\(-\)\n\+\([a-zA-Z]\)/\1\3/g' out.tex
sed -i -ze :a -e 's/\([a-z]\)\n\+\([a-zA-Z]\)/\1 \2/g' out.tex
sed -i -ze :a -e 's/\([A-Z]\){3}\+\n/\1 XYZ/g' out.tex
sed -i -ze :a -e 's/\n\([A-Z]\{3\}\+\)\n/\\section{\1}\n/g' out.tex
sed -i -ze :a -e 's/\([a-z]\)\. \([A-Z]\)/\1\.\n\2/g' out.tex

sed -i 's/“//g' out.tex
sed -i "s/”/''/g" out.tex
sed -i "s/’/'/g" out.tex
sed -i "s/‘/'/g" out.tex
sed -i "s/\.''/''\./g" out.tex
sed -i "s/ — / -- /g" out.tex
sed -i 's/\$/\\$/g' out.tex
sed -i 's/%/\\%/g' out.tex
sed -i 's/&/\\&/g' out.tex
