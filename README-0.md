# mdgBookSVG10Kit 

**Here's an opportunity for one to "compose" Minuets and Trios and to author a Collection Book of such!!!**  


This folder contains materials that allow the user to author a book containing a collection of [Musical Dice Games (MDG)](https://en.wikipedia.org/wiki/Musikalisches_W%C3%BCrfelspiel) minuets, generated based on the rules given in [*Musicalische Cabala (ca. 1773)*](https://imslp.org/wiki/Musicalische_Cabala_(Schola%2C_Franciscus)) by Franciscus Schola.  

Here's an example of a _Musicalische Cabala_ minuet-trio.  
![](./sf-music-0.svg)  


**[Audio sample: &nbsp; [ogg](https://justineuro.github.io/mdgBookSVG10Kit/sf-music-0.ogg) &nbsp;&nbsp; [midi](https://justineuro.github.io/mdgBookSVG10Kit/sf-music-0.mid)]**  


## Creating a Collection Book of Minuet Trios
To create a book, simply [download](https://github.com/justineuro/mdgBookSVG10Kit/archive/main.zip) (or clone: `git clone https://github.com/justineuro/mdgBookSVG10Kit.git`) this project to one's computer, unzip the downloaded archive, and at the command line inside the main folder (`mdgBookSVG10Kit` or `mdgBookSVG10Kit-main` directory) issue the following command (pre-requisites: `bash`, `abcmidi`, `abcm2ps`, `Ghostscript`, `Inkscape`, and `LaTeX`):

```shell
bash HOWTO
```

Wait for a **few** minutes, i.e., until one gets the bash prompt again.  The compiled book in PDF format (`mdgBookSVG10v1.pdf`), among other things, should be located in the `res` folder (subdirectory).  


## For the Impatient
To download and examine an example of a book (`mdgBookSVG10v1.pdf`) that was generated in a similar manner, simply right-click (then "Save Link As ...") on the following image:

[![Front Cover v1](./mdgBookSVG10v1-tit.png)](https://justineuro.github.io/mdgBookSVG10Kit/mdgBookSVG10v1.pdf)

(**Note**: To enable the MIDI audio links in the book, one should download [sf-v1-midis.zip](https://justineuro.github.io/mdgBookSVG10Kit/sf-v1-midis.zip) and unzip in the same directory in one's computer that contains the book, i.e., the book and midi files have to be in the same directory).


## Important Parameters
To personalize one's generated book (in addition to the randomly generated minuet-trios), one may want to change some of the default parameters/values in the following (all three files are initially found in the main directory but are eventually moved into the `res` folder): 

- `mdgBookSVG10v1.tex` - (main latex file) see lines 37-47; also, one may have to occasionally change the \\topmargin and \\textheight values in lines 322 and 323, to ensure that each audio MIDI file will be on the same page as the corresponding musical score
- `mdgBookSVG10v1-cover.tex`- makes the cover of the book; see lines 37-47 of `mdgBookSVG10v1.tex` for default values
- `hyperref.cfg` - contains the `\hypersetup` keyvalues; one may wish to change the default value of `pdfauthor`, among other keyvalues; see the documentation for the TeX package `hyperref` for more information on these keyvalues.

Once the desired changes have been made to the files above, one can then re-compile the book by issuing, in the `res` subdirectory, the last set of commands in the HOWTO file:
```shell
pdflatex -synctex=1 -interaction=nonstopmode -shell-escape mdgBookSVG10v1.tex
bibtex mdgBookSVG10v1.aux
pdflatex -synctex=1 -interaction=nonstopmode -shell-escape mdgBookSVG10v1.tex
pdflatex -synctex=1 -interaction=nonstopmode -shell-escape mdgBookSVG10v1.tex
```

Also, line 32 of the `HOWTO` is set by default so that each new book created contains 20 minuet-trios.  One may wish to change this number, as desired, to some other counting number.  This has to be done before issuing the `bash HOWTO` command within the `mdgBookSVG10Kit-main` directory.


## Additional Samples
A [samples](./samples) folder contains work samples in `abc`,`mid`, `ogg`, and `svg` formats. 

- [samples20-ed.html](https://justineuro.github.io/mdgBookSVG10Kit/samples/samples20-ed.html) - an XHTML file that contains animated images of 20 musical pieces.  When online, clicking on an image displayed on this XHTML file will play the sample (the audio may not be as good as an `ogg` or `midi` version when played on a good music player.)


## Bash scripts for creating minuet-trios
- [mdg102mid+svg.sh](./mdg102mid+svg.sh) - for creating `abc`, `mid`, and `svg` of a _Musicalische Cabala_ minuet-trio (pre-requisites: `bash`, `abcmidi`, `abcm2ps`, and `Ghostscript`)  
Usage:
```bash
./mdg102mid+svg.sh n1 n2 n3 ... n42 n43 n44
```
where `n1` to `n44` are integers chosen from `{1, 2, 3, 4, 5, 6}`, i.e., these 44 integers are the outcomes of the toss of a 6-sided die

- [mdg102midRndN+svg.sh](./mdg102midRndN+svg.sh) - to be used together with `mdg102mid+svg.sh` to produce `NNN` randomly generated minuet-trios  
Usage:
```bash
./mdg102midRndN+svg.sh NNN
```
where `NNN` is the desired number of randomly-generated minuet-trios


## Similar Kits (by the same author) on GitHub
MDG Book kits similar to this may be found on related GitHub sites such as:

- [mdgBookSVGKit](https://github.com/justineuro/mdgBookSVGKit) - MDG based on [*Musikalisches W&uuml;rferspiel, K. 516f*](http://imslp.org/wiki/Musikalisches_W%C3%BCrfelspiel,_K.516f_%28Mozart,_Wolfgang_Amadeus%29), attributed to Wolfgang Amadeus Mozart
- [mdgBookSVG1ecdKit](https://justineuro.github.io/mdgBookSVG1ecdKit) - One-Command Kit for Creating MDG English Country Dances (ECD) Collection Book, the ECDs are generated based on the rules given in  [*Musikalisches Würfelspiel, K.Anh.C 30.01 - Englische Contret&auml;nze* (Mozart, Wolfgang Amadeus)](https://imslp.org/wiki/Musikalische_W%C3%BCrfelspiele%2C_K.Anh.C.30.01_(Mozart%2C_Wolfgang_Amadeus))
- [mdgBookSVG2Kit](https://justineuro.github.io/mdgBookSVG2Kit) - One-Command Kit for Creating MDG Double Counterpoints (Six Measures) Collection Book, the counterpoints are generated based on the rules given in C.P.E. Bach's [*Einfall, einen doppelten Contrapunct in der Octave von sechs Tacten zu machen, ohne die Regeln davon zu wissen*](https://www.jstor.org/stable/843301)
- [mdgBookSVG3Kit](https://justineuro.github.io/mdgBookSVG3Kit) - One-Command Kit for Creating MDG (Kirnberger) Minuet-Trios Collection Book, the minuet-trios are generated based on the rules given in [*Der allezeit fertige Polonoisen- und Menuettencomponist* (*1757*)](https://imslp.org/wiki/Der_allezeit_fertige_Polonoisen-_und_Menuettencomponist_(Kirnberger%2C_Johann_Philipp)) 
- [mdgBookSVG4Kit](https://justineuro.github.io/mdgBookSVG4Kit) - One-Command Kit for Creating MDG Minuet-Trios Collection Book, the minuet-trios are generated based on the rules given in [*Table pour composer des Minuets et des Trios &agrave; la infinie*](http://imslp.org/wiki/Table_pour_composer_des_Minuets_et_des_Trios_%C3%A0_la_infinie_(Stadler,_Maximilian)) (also known as or *Tabelle welcher aus man unzählige Menuetten und Trio für das Klavier herauswürfeln kann* or *Gioco Filarmonico o sia maniera facile per comporre un infinito numero di menuetti e trio, anche senza sapere il contrapunto*) 
- [mdgBookSVG4itKit](https://github.com/justineuro/mdgBookSVG4itKit) - MDG based on [*Gioco Filarmonico o sia maniera facile per comporre un infinito numero di menuetti e trio, anche senza sapere il contrapunto*](http://imslp.org/wiki/Table_pour_composer_des_Minuets_et_des_Trios_%C3%A0_la_infinie_(Stadler,_Maximilian)); similar to  [mdgBookSVG4Kit](https://github.com/justineuro/mdgBookSVG4Kit) but arranged for three (3) instruments
- [mdgBookSVG6Kit](https://justineuro.github.io/mdgBookSVG6Kit) - One-Command Kit for Creating MDG Scottish Dances (Dance-Trios) Collection Book, each dance-trio is generated based on the rules given in [*Kunst, Schottische Taenze zu componiren, ohne musicalisch zu sein*](https://imslp.org/wiki/Kunst%2C_Schottische_Taenze_zu_componiren%2C_ohne_musicalisch_zu_sein_(Gerlach%2C_Gustav))
- [mdgBookSVG7Kit](https://justineuro.github.io/mdgBookSVG7Kit) - One-Command Kit for Creating MDG Rondos Collection Book, each rondo is generated based on the rules given in [_L'art de composer de la musique sans en connaître les éléments - 5th Cahier 2nd Ed. (1802)_](https://s9.imslp.org/files/imglnks/usimg/6/63/IMSLP653334-PMLP1047762-L'Art_de_composer_de_la_-...-Calegari_Antonio_bpt6k9617931c.pdf)
- [mdgBookSVG8Kit](https://justineuro.github.io/mdgBookSVG8Kit) - One-Command Kit for Creating MDG Minuets Collection Book, each minuet is generated based on the rules given in [*Ludus Melothedicus 2nd ed. (1759)*](https://imslp.org/wiki/Ludus_Melothedicus_(Anonymous))


## Acknowledgments
Special thanks to  [International Music Score Library Project (IMSLP)](http://imslp.org/) for [*Musicalische Cabala (ca. 1773)*](https://imslp.org/wiki/Musicalische_Cabala_(Schola%2C_Franciscus)), [Opus Infinity](https://opus-infinity.org) for additional related information, and [Amaranth Publishing](http://www.amaranthpublishing.com/MozartDiceGame.htm) for a copy of <tt>mozart.zip</tt>. My sincerest gratitude to Chris Walshaw et al. for the [ABC music notation](http://www.abcnotation.com);  Jean-Francois Moine for [abcm2ps](http://moinejf.free.fr/) and the accompanying examples, templates, and pointers for the appropriate use of these resources;  Guido Gonzato for the [ABC Plus Project](http://abcplus.sourceforge.net/) and the [abcmidi resources](http://abcplus.sourceforge.net/#abcMIDI) available there, more especially for the ABC resource book *Making Music with ABC 2*; James R. Allwright and Seymour Shlien for [abcmidi](http://abc.sourceforge.net/abcMIDI) source and binaries; Nils Liberg, Jan Wybren de Jong, Seymour Shlien et al. for [EasyABC](https://easyabc.sourceforge.net); [Artifex, Inc.](https://artifex.com) for `Ghostscript v.10.00.0` (includes the `ps2pdf` converter); [`Inkscape v.1.2.2`](https://www.inkscape.org) for the tool for converting SVGs to PDFs for inclusion into LaTeX documents; William Schelter for [`Maxima v.5.47.0`](https://maxima.sourceforge.io)---used for computing the permutation number; Peter Hanappe et al. for FluidSynth v.2.3.1 that was used for converting `midi` to `ogg`; [Google Lens](https://lens.google) and [Google Translate](https://translate.google.com) for aiding in producing the English versions of the text of _Musicalische Cabala_; Colomban Wendling et. al for [Geany 2.0 IDE](https://www.geany.org); and [<tt>User:Martin H</tt>](https://tex.stackexchange.com/users/632/martin-h) for his [reply](https://tex.stackexchange.com/questions/2099/how-to-include-svg-diagrams-in-latex) to a TeX/LaTeX Stack Exchange question on including SVGs into LaTeX documents. Ditto to Machtelt Garrels for the book [Bash Guide for Beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html), Vivek Gite for the book [Linux Script Shell Tutorial](http://www.freeos.com/guides/lsst/), Steve Parker for the [Unix/Linux Shell Cheatsheet](http://steve-parker.org/sh/cheatsheet.pdf).  John Fogarty's GitHub Site: [Latex CreateSpace BookCover](https://github.com/jfogarty/latex-createspace-bookcover) and Peter Wilson's reply in TeX/LaTeX Stack Exchange on [designing a book cover](https://tex.stackexchange.com/questions/17579/how-can-i-design-a-book-cover) were sources of ideas, information, and materials for creating the book cover and title page, thanks to both of them. Many thanks to the [Debian Project](https://www.debian.org) for the Debian 12 (Bookworm) GNU/Linux OS, [TeXLive 2024](http://www.tug.org/texlive/) for the TeX distribution, to Brian Fox for [Bash](https://www.gnu.org/software/bash/), and [GitHub](https://github.com) for its generosity in providing space for [this project](https://github.com/justineuro/mdgBookSVG10Kit).


## License
<p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/">
    <a property="dct:title" rel="cc:attributionURL" href="https://github.com/justineuro/mdgBookSVG10Kit">mdgBookSVG10Kit</a> by 
    <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://justineuro.github.io/">Justine Leon A. Uro</a> is marked with 
    <a href="https://creativecommons.org/publicdomain/zero/1.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">CC0 1.0 Universal
        <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" alt="">
        <img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/zero.svg?ref=chooser-v1" alt="">
    </a>
</p>