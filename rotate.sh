#!/bin/bash
# Skript zum drehen der eingescannten pdfs
# 19.02.2018

count=0
index=1
dir="$(basename $(pwd))"
right=90
left=-90

for file in *.pdf 
do
	if [ $((count%2)) -eq 0 ]
	then
		convert -rotate $left -density 300x300 -compress lzw \
		$file "$index.pdf"	
	else
		convert -rotate $right -density 300x300 -compress lzw \
		$file "$index.pdf"

	fi
	mv "$index.pdf" "${dir}-$index.pdf"

	let count++
	let index++
done
