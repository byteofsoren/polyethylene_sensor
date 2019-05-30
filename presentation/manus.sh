#!/bin/bash
texfile=main.tex
key=#doc
pdf=manus.pdf
cat $texfile | grep $key | awk -F "$key " '{print $2}' | groff -ms -T pdf > $pdf
zathura $pdf &
