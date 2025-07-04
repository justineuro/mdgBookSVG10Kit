#!/bin/bash
#===================================================================================
#
#	 FILE:	mdgEntriesSVG2.sh 
#
#	USAGE:	mdgEntriesSVG2.sh [/path/to/listOfSVGFiles]
#
# DESCRIPTION:	Used for generating needed LaTeX codes for inclusion of SVGs into LaTeX
#
#      AUTHOR:	J.L.A. Uro (justineuro@gmail.com)
#     VERSION:	1.0.0
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2017.09.08 15:58:16 +08
#    REVISION:	
#==================================================================================

#----------------------------------------------------------------------------------
# input the list of SVG files; create the output filename, backup previous if exists
#----------------------------------------------------------------------------------
svgfiles=$1

filen=$svgfiles.output
if [ -f $filen ]; then
 mv $filen $filen.bak
fi

#----------------------------------------------------------------------------------
# create cat-to-output-file function
#----------------------------------------------------------------------------------
catToFile(){
	cat >> $filen << EOT
$1
EOT
}

#----------------------------------------------------------------------------------
# write entries into output file
#----------------------------------------------------------------------------------
i=0
while read ifile; 
do
	i=`expr $i + 1`
inkscape --export-filename=${ifile/.svg/}.pdf -w 621 -h 450 --export-area-drawing --export-latex $ifile	
echo -e "file $i: converted $ifile to \n\t ${ifile/.svg/}.pdf, \n\t ${ifile/.svg/}.pdf_tex"
	ifileA=${ifile/.svg/}
	ifileB=${ifileA/sf-/}
	catToFile "\addcontentsline{toc}{subsection}{$ifileB}
\begin{figure}[H]
	\centering
	\def\svgwidth{\columnwidth}
	\vspace*{0.50in}
	\input{${ifile/.svg}.pdf_tex}
\end{figure}
\nopagebreak[4]
\vspace{-0.25in}
{\footnotesize For audio (midi): \hyperref{./${ifile/.svg/}.mid}{}{}{${ifile/.svg/}.mid}}
"
done < $svgfiles
###
##
#
