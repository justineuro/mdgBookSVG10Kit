#!/bin/bash
#===================================================================================
#
#	 FILE:	mdg102mid+svg.sh
#
#	USAGE:	mdg102mid+svg.sh n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 
#													n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 
#													n29 n30 n31 n32 n33 n34 n35 n36 n37 n38 n39 n40 n41 n42 n43 n44
#		where n1-n44 are any of the 6 possible integers from the set {1,2, 3, 4, 5, 6}
#
# DESCRIPTION:	Used for generating ABC and MIDI files 
#		of a particular Musical Dice Game (MDG) minuet based on Schola Franciscus
#
#      AUTHOR:	J.L.A. Uro (justineuro@gmail.com)
#     VERSION:	0.0.1
#     LICENSE:	Creative Commons Attribution 4.0 International License (CC-BY)
#     CREATED:	2025/06/19 13:54:49
#    REVISION:	
#==================================================================================

#----------------------------------------------------------------------------------
# declare the variables "diceS1", "diceS2m", "diceS2t", "diceS3m", "diceS3t", and 
#						"measNR" as arrays
# diceS1 - array containing the 12 die roll outcomes from input line for Part I
# diceS2m - array containing the 8 die roll outcomes from input line for Part II-minuet
# diceS2t - array containing the 8 die roll outcomes from input line for Part II-trio
# diceS3m - array containing the 8 die roll outcomes from input line for Part III-minuet
# diceS3t - array containing the 8 die roll outcomes from input line for Part III-trio
# measNR - array of all possible measure notes for a specific outcome
#----------------------------------------------------------------------------------
declare -a diceS1 diceS2m diceS2t diceS3m diceS3t measNR  

#----------------------------------------------------------------------------------
# input 44-sequence of tosses as given in the command line
#----------------------------------------------------------------------------------
diceS1=($1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12})
diceS2m=(${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20})
diceS2t=(${21} ${22} ${23} ${24} ${25} ${26} ${27} ${28})
diceS3m=(${29} ${30} ${31} ${32} ${33} ${34} ${35} ${36})
diceS3t=(${37} ${38} ${39} ${40} ${41} ${42} ${43} ${44})

#----------------------------------------------------------------------------------
# input rule table to determine corresponding G/F measure numbers to be obtained from 
# the rule table for each toss outcome of a die toss
#----------------------------------------------------------------------------------
# Part I - 12 bars
ruletabS1() {
	case $1 in
	1) measNR=(269	279	274	6	10	5	272	276	12	3	270	2);;
	2) measNR=(257	268	267	22	21	20	261	264	25	19	259	18);;
	3) measNR=(227	238	232	126	125	132	235	230	127	129	233	128);;
	4) measNR=(123	134	133	237	231	236	124	130	234	229	131	228);;
	5) measNR=(13	17	14	278	262	266	16	23	260	265	24	258);;
	6) measNR=(1	11	7	263	273	277	9	4	271	275	8	280);;
	esac
}

# Part II-minuet - 8 bars
ruletabS2m() {
	case $1 in
	1) measNR=(161	165	168	79	167	163	158	75);;
	2) measNR=(153	157	160	89	159	155	166	84);;
	3) measNR=(145	152	149	96	148	150	92	91);;
	4) measNR=(90	97	94	151	93	95	147	146);;
	5) measNR=(81	83	87	156	86	88	85	154);;
	6) measNR=(74	82	80	164	77	76	92	162);;
	esac
}

# Part II-trio - 8 bars
ruletabS2t() {
	case $1 in
	1) measNR=(211	173	218	214	217	213	174	170);;
	2) measNR=(203	178	210	206	209	205	180	179);;
	3) measNR=(195	189	202	198	200	197	190	186);;
	4) measNR=(185	199	192	188	191	187	201	196);;
	5) measNR=(177	207	183	182	184	193	208	204);;
	6) measNR=(169	215	176	172	175	171	216	212);;
	esac
}

# Part III-minuet - 8 bars
ruletabS3m() {
	case $1 in
	1) measNR=(135	139	105	102	104	101	70	100);;
	2) measNR=(143	69	111	113	110	109	30	108);;
	3) measNR=(115	29	119	121	118	120	140	116);;
	4) measNR=(107	122	32	28	141	137	117	136);;
	5) measNR=(135	114	72	68	31	27	112	26);;
	6) measNR=(99	106	142	138	71	67	103	66);;
	esac
}

# Part III-trio - 8 bars
ruletabS3t() {
	case $1 in
	1) measNR=(33	37	40	246	39	244	59	34);;
	2) measNR=(41	48	44	223	45	35	241	42);;
	3) measNR=(49	53	56	63	54	43	221	50);;
	4) measNR=(57	64	61	52	222	144	55	58);;
	5) measNR=(219	226	225	47	62	224	46	220);;
	6) measNR=(239	245	243	36	242	73	38	240);;
	esac
}


#----------------------------------------------------------------------------------
# input notes
# declare as arrays: "notesGf", "notesGv", "notesGk", "notesFk", and "notesC"
# notesGf - array that contains the possible treble clef notes per measure for flute
# notesGv - array that contains the possible treble clef notes per measure for violin
# notesGk - array that contains the possible soprano clef notes per measure for clavier
# notesFk - array that contains the possible bass clef notes per measure for for clavier
# notesC - array that contains the possible bass clef notes per measure for cello
# measPerm - string that contains the measures corresponding to the dice toss outcomes
#----------------------------------------------------------------------------------
declare -a notesGf notesGv notesGk notesFk notesC measPerm1 measPerm2m measPerm2t measPerm3m measPerm3t

#----------------------------------------------------------------------------------
# define notesGf, array of 280 possible measures of treble clef notes for flute
#----------------------------------------------------------------------------------
notesGf=("{f}g3/d/ d/c/4A/4e/d/" "{^c}df3/4a/4 f z" "{f}g/e/d/c/ {c}d/A/A/A/" "g3/4e/4d/^c/ {c}d/A/B/c/" "{f}g(b/4a/4)(a/4g/4) gz" "(B/4c/4)(B/4c/4)d z/ {f}g/g/g/" "{B}AB/d/ d/c/{^g}a/c/" "{^A}B(3g/f/e/ {e}dc" 
"{^g}a2 (f/4g/4)(f/4g/4)a/f/" "fg/b/ b/a/g/f/" "{d}cB zB" "{^c}d2 (f/4g/4)(f/4g/4)a/f/" "d3/B/4c/4 d/{f}g/d/d/" "{B}A3/F/4G/4 (A/B/)(B/c/)" "{b}a/f/4g/4a/a/ a/{g}f/z/ a/" "{b}a/f/4g/4a/a/ a/{g}f/z/ a/" 
"d/c/!invertedturn!c B3/B/" "{^c}da/4(b/4a/4g/4) fz" "e/g/e/c/ {c}d/f/a/A/" "{f}gd3/4B/4 G/g/a/b/" "{^d}e3/c/ b/g/a/f/" "(c/4B/4)(e/4d/4)dz/ {f}g/b/g/" "g/e/4f/4g/g/ fd/4(^c/4d/4e/4)" "{A}B(3g/f/e/ {e}dc" 
"d/d/4e/4f/f/ f/{e}d/z/ f/" " z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "g2g3/f/4g/4 {g}ac'" "{c}d4z2" "{B}Affeed" "{c}B4B2" "{d}e3/f/d2^c2" "(d/c/)(c/B/)B2z2" "a3/g/fedc" 
"zded {f}ga" "(3bagg3b" "bg f3/g/4a/4g2" "{c}d4z2" "{^A}bg/e/d2^c2" "(3Bgf(3fe^d de" "{^g}a3/g/ fg{^g}ac" "{B}A3A{^c}d2" 
"{d}cB/c/B2z2" "{^c'}d'b b3/a/4b/4 ac'" "{c}d4z2" "{^A}B/e/g/e/d2^c2" "{^A}Bggffe" "a3/g/ {g}accc" "(3A^cd df/c/ {c}dA" "(d/c/B/)c/B2z2" 
"(3bagg3g" "{c}d4z2" 
"z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"{c}d3/(3d/4e/4f/4 g/f/e/d/" "a3/4d/4a/a/ a/g/4f/4a/a/" "{^d}e3/a/4c/4 b/a/g/f/" "(B/4c/4)(c/4d/4)dz/ c/f/g/" "f3/4g/4f/f/ f/e/4d/4d/f/" "{c}d(a/4g/4)(g/4f/4) fz" "ee/^c/ {c}d3/A/" "{A}gg3/4e/4 f/z f/" 
"(6{^A}Bbagfe dc" "{f}g(d/4c/4)(c/4B/4) B/z b/" "{B}A3/B/4d/4 d/c/e/c/" "{d}cBz/ d/d/{c}B/" 
" z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6 z" "z6" "z6" 
"{f}gbd'2c'2" "{c}d4z2" "ef d2^c2" "{A}Bggffe" "{^a}b3/g/ fedc" "{B}Affeed" "{d}c2B2z2" "(3bagg4" 
"{^c'}d'2d'b ac'" "{c}d4z2" "(3Afe (3ed^c {c}d2" "d/c/B/c/B2z2" "bg {g}f3/g/4a/4g2" "(3Bged2^c2" "(3Bgf (3fe^d {d}e2" "{^g}a3/g/ fg{^g}aA" 
"g3/f/4g/4 dg{^g}ac'" "{c}d4z2" "(3A^c=d df/c/ {c}dA" "{d}c3/B/4c/4B2z2" "(3bag g3b" "{^A}B3/e/d2^c2" "(3B^ce eg/d/ {d}eB" "a3/b/ c'f/e/ dc" 
"c'2g2ga" "{e}d4z2" "g4g2" "{=f}g2{f}e2zg" "gf f3f" "{b}c3/g/ {g}f2e2" "{^g}a4a2" "e2efef" 
"c2cdef" "(3gagg3f" "{e}d4z2" "a3/g/f2e2" "zeeedc" "g3fe2" "e2c'bag" "zac'agf" 
"e2e/f/e/f/ gg" "{e}d4z2" "gez {b}c'c'g" "gf!invertedturn!f2e2" "ge{e}d3f" "{^g}a3/f/ fege" "afz {b}c'c'a" "(3efg ag{b}c'a"
"zg{b}c'gfe" "z6" "e2e/f/g/a/ gc'" "{c}B4z2" "{a}g3ggg" "ge d3/e/4f/4e2" "ge{e}d3f" "a3{^g}aaa" 
"{b}c'3/g/f2e2" "e2c'bag" "c'2geag" "{e}d4z2" "zg{b}c'g gf/e/" "{a}g3fe2" "(3gag g3f" "{^g}a3/g/ fege" 
"zac'a ag/f/" "e2e/f/e/f/ gc'" "ce (3efg ag" "{e}d4z2" "ge/d/ egg2" "g2{f}e2zg" "(gf)f3f" "{^g}a3/f/ fege" 
"{^g}af/e/ fa!invertedturn!a2" "e2(3c'ba (3gfe" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"{f}g3/4d/4!invertedturn!d d/c/4B/4e/d/" "{c}dd'd'z" "{f}e/g/{f}e/{d}c/ d/A/A/A/" "g/e/4f/4g/g/ {g}fd/4(^c/4d/4e/4)" 
"e3/c/ b/a/g/f/" "A3/B/4d/4 B/A/e/c/" "{A}B(3g/f/e/ {e}dc" "{^c}d2f/4g/4f/4g/4a/f/" 
"{^g}a2(f/4g/4)(f/4g/4)a/{g}f/" "{f}g(d/4c/4)(c/4B/4) B/{f}g/a/b/" "(c/4B/4)(e/4d/4)d z/{f}g/g/g/" "(d/c/)!invertedturn!c B3/B/" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"(d/c/)!invertedturn!c B3/B/" "(d/c/)!invertedturn!c B3/B/" 
"z6" "z6" "z6" "z6" 
"dg/4(f/4g/4a/4) {a}g/f/e/d/" "{c}d3/4f/4(f/4e/4)(e/4d/4) dz" "(6{^A}Bbagfe Bc" "d3/4e/4f/f/ f/e/4f/4g/f/" "a3/4d'/4a/a/ a/g/4a/4b/a/" "{^d}ea/4(c'/4b/4)a/4 {a}gf" "(B/4c/4)(c/4d/4)d z/d/f/g/" "{a}gg3/4e/4 {e}f/z d/" 
"{f}ee3/4^c/4 {c}d/z A/" "{f}g(d/4c/4B/4A/4) {c}B3/b/" "A3/B/ c/B/4c/4d/c/" "{d}cBz/ {^c}d/d/B/" "{f}g3/b/4a/4 g/f/e/d/" "{^A}Be/4(f/4g/4)e/4 {e}dc" " f/d/4e/4f/f/ (f/g/)z/ f/" "a/f/4g/4a/a/ a/d'/a/a/" "{g}fg/b/ b/a/g/f/" "AB/d/ d/A/{^g}a/c/" "e/^c/4d/4e/e/ d/z A/" "g/e/4f/4g/g/ f/z f/" "{f}g(b/4a/4)(a/4g/4) g/z b/" "(B/4c/4)(B/4c/4)dz/ {f}g/b/g/" "{d}cBz/ {f}g/d/B/" "d(a/4g/4)(g/4f/4) fz")
#echo ${notesGf[279]}

#----------------------------------------------------------------------------------
# define notesGv, array of 280 possible measures of treble clef notes for the violin
#----------------------------------------------------------------------------------
notesGv=("{A}B3/B/ B/A/4G/4c/B/" "{E}Fd3/4f/4 d z" "{^A}B/G/F/E/ {E}F/F/F/F/" "{^A}B3/4G/4F/E/ {E}F/F/G/E/" "{A}B(d/4c/4)(c/4B/4) Bz" "(G/4A/4)(G/4A/4)B z/ {A}B/B/B/" "{G}FG/B/ B/A/c/A/" "{F}E(3B/A/G/ {G}FE" 
"{e}f2 (d/4e/4)(d/4e/4){e}f/d/" "AB/d/ d/c/B/A/" "{B}AG zG" "{E}F2 (d/4e/4)(d/4e/4)f/d/" "B3/G/4A/4 {A}B/BB/" "{E}F3/D/4E/4 (F/G/)(G/A/)" "f/d/4e/4f/f/ f/{e}d/z/ f/" "{e}f/d/4e/4f/f/ f/{e}d/z/ f/" 
"B/A/A G3/G/" "{E}Ff/4(g/4f/4e/4) dz" "B/B/G/E/ {E}F/d/f/f/" "{A}Bd3/4B/4 {A}G/B/ f/g/" "{B}A3/e/ d/B/c/A/" "(A/4G/4)(c/4B/4)Bz/ B/d/B/" "e/^c/4d/4e/e/ dF/4(E/4F/4G/4)" "E(3B/A/G/ {G}FE" 
"F/F/4G/4A/A/ A/{G}F/z/ A/" " z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "B2B3/A/4B/4 fa" "{E}F4z2" "dA2A2A" "{A}Bggffe" "B2F2D2" "(B/A/)(A/G/)G2z2" "f3/e/dcBA" 
"zBcB Bf" "(3gAGG3g" "{f}gB A3/B/4c/4B2" "{E}F4z2" "{^A}B3/G/F2E2" "zBzBzB" "f3/e/ defA" "(3Afe(3ed^c {c}dA" 
"{B}AG/A/G2z2" "{a}bg g3/f/4g/4 fa" "{E}F4z2" "BB/G/F2E2" "zB2B2B" "f3/e/ {e}fAAA" "zA2A2A" "(B/A/G/)A/G2z2" 
"(3gcBB3B" "{E}F4z2" 
"z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"{A}B3/(3B/4c/4A/4 B/d/c/B/" "f3/4f/4f/f/ f/e/4 d/4f/f/" "A3/c/4e/4 d/c/B/A/" "(G/4A/4)(A/4B/4)Bz/ B/A/B/" "A3/4B/4A/A/ A/G/4F/4F/A/" "{E}F(f/4e/4)(e/4d/4) dz" "GG/E/ {E}F3/F/" "{f}ee3/4^c/4 {c}d/z A/" 
"E(3B/A/G/ FE" "B(B/4A/4)(A/4G/4) G/z g/" "{G}F3/G/4B/4 B/A/c/A/" "{B}AGz/ {A}B/B/G/" 
" z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6 z" "z6" "z6" 
"{A}Bgb2a2" "{E}F4z2" "B2F2E2" "zB2B2B" "{e}f3/e/ dcBA" "zA2A2A" "{B}A2G2z2" "(3gcBB4" 
"{a}b2bg fa" "{E}F4z2" "zAz Az A" "B/A/G/A/G2z2" "{f}gB {B}A3/B/4c/4B2" "{A}BG G2E2" "zBz Bz B" "f3/e/ de{e}fA" 
"B3/A/4B/4 BBfa" "{E}F4z2" "DAz AAA" "{B}A3/G/4A/4G2z2" "(3gcBB3g" "E3/G/F2E2" "DGz GGG" "f3/g/ ad/c/ BA" 
"e2e2ef" "{c}B4z2" "{f}e4e2" "e2{d}c2ze" "edd3d" "e3/e/d2c2" "{e}f4f2" "c2cdcd" 
"E2EBcd" "(3efee3d" "{c}B4z2" "f3/e/d2c2" "g2agfe" "e3dc2" "c2egfe" "zfffed" 
"c2c/d/c/d/ ee" "{c}B4z2" "e{d}cz eee" "ed!invertedturn!d2c2" "ec {c}B3d" "{e}f3/d/ dcec" "cAz aa{g}f" "(3cde feef" 
"zeeedc" "z6" "c2c/d/e/f/ ee" "{c}B4z2" "{f}e3eee" "ec B3/c/4d/4c2" "ec{c}B3d" "{e}f3fff" 
"e3/e/d2c2" "c2egfe" "e2ecfe" "{c}B4z2" "zeee ed/c/" "{f}e3dc2" "(3efee3d" "{e}f3/e/ dcec" 
"zfaf fe/d/" "c2c/d/c/d/ ee" "Ec (3cde fe" "{c}B4z2" "{f}ec/B/cee2" "e2{d}c2ze" "(ed)d3d" "{e}f3/d/ dcdc" 
"{e}fA/G/ Af!invertedturn!f2" "c2(3egf (3edc" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"{A}B3/4B/4!invertedturn!B B/A/4G/4c/B/" "F[DAf][DAf]z" "BG/E/ F/FF/" "e/^c/4d/4e/e/ {e}dF/4(E/4F/4G/4)" "{B}A3/e/ d/c/B/A/" 
"F3/G/4B/4 B/A/c/A/" "{F}E(3B/A/G/ {G}FE" "{E}F2d/4e/4d/4e/4f/d/" "{e}f2(d/4e/4d/4e/4)f/{e}d/" 
"{A}B(B/4A/4)(A/4G/4) G/B/ F/G/" "(A/4G/4c/4B/4)Bz/ {A}B/B/B/" "(B/A/)!invertedturn!A G3/G/" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"(B/A/)!invertedturn!A G3/G/" "(B/A/)!invertedturn!A G3/G/" 
"z6" "z6" "z6" "z6" 
"BB/4(A/4B/4c/4) B/d/c/B/" "{E}F3/4A/4(A/4G/4)(G/4F/4) Fz" "E(3B/A/G/ EG" "F3/4G/4A/4A/ A3/4G/4A/4B/A/" "{g}f3/4f/4f/f/ f/e/4f/4g/f/" "Ac/4(e/4d/4)c/4 {c}BA" "(G/4A/4)(A/4B/4)B z/B/A/B/" "{f}ee3/4^c/4 {c}d/z F/" 
"GG3/4E/4 {E}F/z F/" "A(d/4c/4B/4A/4) {A}G3/g/" "F3/G/ A/G/4A/4B/A/" "{B}AGz/ {A}B/B/G/" "B3/d/4c/4 B/d/c/B/" "{F}EG/4(A/4B/4)G/4 {G}FE" "A/F/4G/4A/A/ A/B/z/ A/" "f/d/4e/4f/f/ f/ff/" "{B}AB/d/ d/c/B/A/" "FG/B/ B/A/c/A/" "G/E/4F/4G/G/ F/z F/" "e/^c/4d/4e/e/ d/z A/" "B(d/4c/4)(c/4B/4) B/z g/" "(G/4A/4)(G/4A/4)Bz/ B/d/B/" "AGz/ {A}B/B/G/" "{E}F(f/4e/4)(e/4d/4) dz")
#echo ${notesGv[279]}

#----------------------------------------------------------------------------------
# define notesGk, array of 280 possible measures of soprano clef notes for clavier
#----------------------------------------------------------------------------------
notesGk=("z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "  [cGE]4z2" "{c}dGdFEc" "(3cdB B2A2" "c/B/A/B/ A2G2" "A/f/e/d/ cE DB" "Gc c3 =B/c/" "(3FAG(3FAc(3fed" 
"B2Bdce" "{E}F4z2" "{^f}gB B2A2" "fee2d2" "{e}dF F3/G/4A/4 B2" "AGBGF=E" "{d}c3f3/ {g}fe/4f/4" "G3/F/4G/4 FA df" 
"BFz fec" "{E}F4z2" "g/f/=e/f/ gBz A" "zGAB F/B/d/f/" "c/B/A/B/ cFz f" "A/G/A/G/F2E2" "f3ed2" "dB cA {A}B2" 
"bf f3/e/4f/4 ge" "{G}F4z2" "f/=e/g/e/ cg/B/{cB}A2" "(3fgee2d2" "{e}dc/d/ f/e/d/c/ B2" "cA/B/ cF (a/g/)(g/f/)" "A/G/B/d/ {d}cBAG" "GA {c}BA/G/ F/b/a/g/" 
"B,D FB ce" "{E}F4z2" "A/G/!invertedturn!Az B/G/ FE" "(3cAFz f3/{g}f/=e/f/" "GA/B/ FB d/B/d/f/" "(3cAFz f3/{g}f/=e/f/" "f/e/g/e/ e2d2" "de/c/ {c}BAB2" 
"{e}fcAF dc" "{B}c4z2" "G/=B/d/f/f2e2" "(3cBA G3/A/4B/4A2" "cBB2A2" "e/d/f/d/ A3/B/!invertedturn!B2" "(3GAG {G}FE/D/ Cc" "{G}FE/F/ CFAc" 
"(3g=ecz B{c}BA" " z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"{e}fcAF dc" "{B}c4z2" "G=Bdfe2" "{d}c3BA2" "e/d/f/d/c2=B2" "fdc=Bc2" 
"FAGEFA" "c3BA2" "[Acf]2(3agf (3fdc" "{B}c4z2" "{c}d3e/f/ ec" "{^f}g2g2f/e/d/c/" "(3FEF (3FEF {e}fd" "(3Afdc2=B2" 
"cegB{c}BA" "cBgB{c}BA" "fcz afc" "{B}c4z2" "edz {e}fAB" "G/(C/D/E/) (F/G/A/=B/) c/B/A/G/" "(3FAc (3fed (3cBA" "G3f{g}fe" 
"cB GE{E}F2" "(3cBA (3GFE {E}F2" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" 
"(3FAc (3afd cc" "{B}c4z2" "G/A/=B/c/ ^c/d/G/f/ fe" "c/B/d/B/ B2 A2" "(3cdBB2A2" "(3d^cdz f(e/d/=c/B/)" "G/C/E/G/ c/=B/A/G/ c/B/A/G/" "[M:7/8](3FEFz fa/f/ e/d/ c[M:3/4] " "BAGF dc" "f/=e/g/e/ {d}cg/B/ {c}BA" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "F2ABcf" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"{c}BA/B/ FFc2" "{E}F4z2" "z/G/B/d/ {d}cA/F/ c/B/G/E/" "[cA]3{d}[fA][fA][fA]" "(f/e/)(e/c/) (f/e/)(e/c/)[dB]2" "(=e/f/)(e/f/){^f}g/G/A/B/ {c}BA" "zgab f/b/d'/b/" "d[db][ec'][ca] [db]2" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"f2fd/f/ec" "{E}F4z2" "d/B/A/G/F2E2" "{d}c2c/B/A/B/ c{e}f" "zG/g/ B/b/G/g/ F/f/B/b/" "g/f/=e/d/ {d}(cB)(BA)" "dB/f/ {d}cA/c/B2" "fd/f/ {f}ec/e/d2" "{A}B4z2" "{e}f2fd/f/ ec" "f/B/A/G/F2E2" "{E}F4z2" 
"z4" "z4" 
"{E}F4z2" "{e}f2fdec" "{E}F4z2" "d/B/A/G/F2E2" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4")
#echo ${notesGk[279]}

#----------------------------------------------------------------------------------
# define notesFk, array of 280 possible measures bass clef notes for klavier
#----------------------------------------------------------------------------------
notesFk=("z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" " C,CG,E,C,2" "=B,,2G,,2C,E," "G,E, C,2F,2" "G,2E,2C,2" "F,2G,2G,,2" "C,2z/C,/E,/G,/ E,C," "F,2F,,2zB," 
"B,,2D,2F,2" "F,2C,A,,F,,2" "=E,2C,2F,2" "C,2F,2B,,2" "B,2E,2D,2" "B,2C2C,2" "F,2A,2F,2" "E,2D,2B,,2" 
"B,2B,,2F,2" "F,2C,A,,F,,2" "(3=E,G,C (3E,G,CF,2" "E,2z2F,B,," "(3F,A,C (3F,A,CF,2" "B,2C2C,2" "zC,F,F,B,,2" "B,D,E,F, D,B,," 
"B,,2D,2F,2" "F,2C,A,,F,,2" "C,2=E,2F,2" "C,2F,2B,,2" "B,2E,F,B,B,," "F,2A,2F,2" "B,2C2C,2" "E,2z2D,2" 
"D,2B,,2F,2" "F,2C,A,,F,,2" "B,2C2C,2" "F,2A,2F,2" "E,2D,2B,,2" "F,2A,2F,2" "C,2F,,2B,,2" "B,E, F,F,,B,,2" 
"F,2A,2B,A," "C,CG,E,C,2" "=B,,2G,,2C,2" "G,2C,2F,2" "G,C,D,E,F,2" "F,2G,2G,,2" "C,2z2E,C," "F,2A,2F,2" 
"=E,2C,2F,2" " z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"F,2A,2B,A," "C,2G,,2C,2" "D,2=B,,2C,2" "G,2C,2E,2" "F,2G,2G,,2" "z2F,2E,2" 
"z2B,2A,2" "G,2C2F,2" "F,2A,2F,2" "C,CG,E,C,2" "(3=B,,D,G, (3B,,D,G, C,E," "(3C,E,G, (3C,E,G, (3C,E,G," "F,2D,2B,,2" "F,2G,2G,,2" 
"E,2C,2F,2" "G,2E,2F,2" "F,2A,2F,2" "C,CG,E,C,2" "F,2D,2G,2" "C,2C,,2zE," "F,2F,,2zF," "G,/G,,/=B,,/D,/ G,/D,/B,,/G,,/C,2" 
"G,2C,2F,2" "G,2B,2A,2" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" 
"F,2A,2F,2" "C,CG,E,C,2" "G,2=B,,2C,2" "G,2C,2F,2" "G,2E,2F,2" "F,2D,2G,2" "C,2C,,2z E," "[M:7/8]F,2F,,2zB,z[M:3/4] " "F,2F,,2B,A," "C,2=E,2F,2" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "F,2z2A,2" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"B,,3D,F,A," "F,2C,A,,F,,2" "B,2C2C,2" "F,,/F,/=E,/F,/ C,/F,/A,,/C,/F,,2" "C,2F,2B,,2" "C,2=E,2F,2" "E,2z2D,2" "B,3F,B,B,," 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z/B,,/D,/F,/B,2F,2" "F,2C,A,,F,,2" "B,2C2C,2" "F,/C/A,/C/ F,/C/A,/C/F,2" "E,2z2D,B,," "=E,/C/G,/C/ E,/C/G/C/F,2" "B,D,E,F,B,B,," "C,2F,2B,,2" "B,2F,D,B,,2" "B,,2B,2F,2" "B,2C2C,2" "F,2C,A,,F,,2" 
"z4" "z4" 
"F,2C,A,,F,,2" "B,,2D,,2F,,2" "F,,2C,A,,F,,2" "B,2C2C,2" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" 
"z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4" "z4")
#echo ${notesFk[279]}

#----------------------------------------------------------------------------------
# define notesFc, array of 280 possible measures bass clef notes for cello
#----------------------------------------------------------------------------------
notesFc=("G,G,, zG," "D,3/4D/4A,/F,/ D, z" "E,A, D3/D,/" "E,A,D,z" "G,z G,/D,/B,,/G,/" "G,D,/B,,/ G,,G," "D,D,,z F," "G,G,A,A,," 
"z/D,/F,/A,/ DD," "D,G,DD," "D,G,G,,z" "D,/E,/4F,/4G,/4A,/4B,/4^C/4 DD," "z/G,,/B,,/D,/ G,G,," "D,Dz D," "D,Dz/ D/4^C/4D/D,/" "D,Dz/ D/4^C/4D/D,/" 
"z/D,/E,/F,/ G,G,," "D,/D/A,/F,/ D,z" "G,A, D,3/F,/" "G,D3/4B,/4 G,G,," "C,C DD," "G,3/G,/4F,/4 G,G,," "A,A,,D,z" "G,G,A,A,," 
"D,Dz/ D/4C/4D/D,/" " z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "G,3G,DD," "D,D,A,F,D,2" "F,3F,F,2" "z2G,2G,2" "G,2A,2A,,2" "G,D,G,2G,,2" "D,2D2zD," 
"G,2G,,2zD," "G,3DB,G," "G,3D,G,G,," "D,DA,F,D,2" "G,2A,2A,,2" "G,2G,,2G,2" "D,2D2zD," "F,2F,,2F,2" 
"G,3D,B,,G," "G,3G,DD,," "D,DA,F,D,2" "G,2A,2A,,2" "G,3G,G,G," "D,3D,F,D," "F,3F,F,F," "G,3D,G,G,," 
"G,3D,B,,G," "D2zDD,2" 
"z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z6" "z6" 
"z/G,/F,/G,/ G,,G," "D,Dz D," "C,CDD," "G,3/G,/4F,/4 G,G,," "D,Dz D," "D,/D/A,/F,/ D,z" "A,A,, D,/D/4C/4D/D,/" "A,A,, D,/D/4^C/4D/D,/" 
"G,G, A,A,," "G,G,,z/ G,/G,," "D,D,,z F," "D,G,G,,z/ G,/" 
" z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6 z" "z6" "z6" 
"G,3G,DD," "D,DA,F,D,2" "G,2A,2A,,2" "z2G,2G,2" "D,2D2zD," "z2F,2F,2" "G,G,/F,/ G,D, B,,G,," "G,3D,B,,G,," 
"G,2D2D,2" "D,DA,F,D,2" "F,2F,,2F,2" "G,2D,B,,G,,2" "G,2G,,2zG," "G,2A,2A,,2" "G,2G,,2G,2" "D,2D2zD," 
"G,2G,2D,2" "D,DA,F,D,2" "F,3F,F,F," "G,2D,B,,G,,2" "G,3DB,G," "G,2A,2A,,2" "G,3G,G,G," "D,2D2zF," 
"C2C,2z C," "G,2D,B,,G,,2" "zC/B,/ CG,E,C," "zC,E,G, CC," "G,2zG,B,G," "C2B,2C2" "zF,/E,/ F,C, A,,F,," "C2C,2z2" 
"C2C,2zG," "C2C,G,A,B," "G,2D,B,,G,,2" "B,,2G,,2C,,2" "C2C,2zC," "G,G,,B,,G,,C,2" "C2C,2zC," "F,2F,,2zF," 
"C,3CB,C" "G,2D,B,G,,2" "zC,E,G,CC," "G,2G,,2C,2" "G,3G,/^F,/ G,B," "B,,3B,,C,C" "zF,,A,,C, F,F,," "C2C,2zC," 
"C2C,2zC," "z6" "C2C,2zC," "G,2D,B,,G,,2" "zC/B,/ CG,E,C," "G,2G,,2C,2" "G,3G,/^F,/ G,G,," "zF,/E,/ F,C, A,,F,," 
"C,CB,2C2" "C,2z2C,2" "C2C,2z2" "G,2D,B,G,,2" "C2C,2zC," "G,G,,B,,G,,C,2" "C2C,G,A,B," "D,2B,,C,CC," 
"F,2F,,2zF," "C2C,2zC," "C2C,2zC," "G,2D,B,,G,,2" "C,2zC/B,/ CC," "zC,E,G,CC," "G,2zG,B,G," "B,,2G,,2C,2" 
"F,2zF,/E,/F,F,," "C2C,2zC," 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"G,G,,zG," "D,3/4D/4A,/F,/ D,z" "G,A, D,3/B,/" "A,A,,D,z" "C,CDD," "D,D,,zD," "G,G,A,A,," "(D,/E,/4F,/4G,/4A,/4B,/4^C/4) DD," "z/D,/F,/A,/ DD," "G,G,,z G," "G,3/G,/4F,/4 G,G,," "z/D,/E,/F,/ G,G,," 
"z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" "z6" 
"z/D,/E,/F,/ G,G,," "z/D,/E,/F,/ G,G,," 
"z6" "z6" "z6" "z6" 
"G,G,,z G," "D,3/G,/ DD," "G,G,A,A,," "D,Dz D," "D,D,,z D," "C,C DD," "G,D,/B,,/ G,,G," "A,A,, (6D,A,G,F,E,D," 
"A,A,,(6D,A,G,F,E,D," "G,(D/4C/4B,/4A,/4) G,/D,/B,,/G,,/" "D,D,,z D," "D,G,G,,z" "z/G,/D,/B,,/ G,,G," "G,G,A,A,," "D,Dz D," "D,Dz D," "D,G, DD," "D,Dz D," "A,3/A,/ (6DA,G,F,E,D," "A,3/A,/ (6DA,G,F,E,D," "G,z G,/D,/B,,/G,,/" "G,D,/B,/ G,,/z G,,/" "D,/E,/4F,/4G, G,,z" "D,/D/A,/F,/ D,z")
#echo ${notesFc[279]}

#----------------------------------------------------------------------------------
# create cat-to-output-file function
#----------------------------------------------------------------------------------
catToFile(){
	cat >> $filen << EOT
$1
EOT
}

#----------------------------------------------------------------------------------
# create empty ABC file
# set header info: generic index number, filename
#----------------------------------------------------------------------------------
fileInd=$1-$2-$3-$4-$5-$6-$7-$8-$9-${10}-${11}-${12}-${13}-${14}-${15}-${16}-${17}-${18}-${19}-${20}-${21}-${22}-${23}-${24}-${25}-${26}-${27}-${28}-${29}-${30}-${31}-${32}-${33}-${34}-${35}-${36}-${37}-${38}-${39}-${40}-${41}-${42}-${43}-${44}
filen="sf-$fileInd.abc"

#-----------------------------------------------------------------------------------------------------
# calculate permutation number for the current dice toss (??? from 6^12 * 6^8 * 6^8 * 6^8 * 6^8 possibilities
# 6^12 * 6^8 * 6^8 ^8 * 6^8 * = 17,324,272,922,341,479,351,919,144,385,642,496)
# Unique: ??? 
# (for ludus) part I, measure 4: 2=3; measure 8: 1=5, 2=7
# (for ludus) part II, measure 8: 1=6, 2=7, 4=9
#-----------------------------------------------------------------------------------------------------
### FOR ludus
### adjust count for bar 4 for rolls beyond 3 (only 8 unique bars)
##diceS1_3=${diceS1[3]}
##if [ "${diceS1[3]}" -gt "2" ]; then diceS1_3=${diceS1[3]}-1; fi
### adjust count for bar 8 for rolls after 5 (only 7 unique bars)
##diceS1_7=${diceS1[7]}
##if [ "${diceS1[7]}" = "5" ]; then diceS1_7=1; fi
##if [ "${diceS1[7]}" = "6" ]; then diceS1_7=5; fi
##if [ "${diceS1[7]}" = "7" ]; then diceS1_7=2; fi
##if [ "${diceS1[7]}" = "8" ]; then diceS1_7=6; fi
##if [ "${diceS1[7]}" = "9" ]; then diceS1_7=7; fi
### adjust count for bar 16 for rolls after 6 (only 6 unique bars)
##diceS2_7=${diceS2[7]}
##if [ "${diceS2[7]}" = "6" ]; then diceS2_7=1; fi
##if [ "${diceS2[7]}" = "7" ]; then diceS2_7=2; fi
##if [ "${diceS2[7]}" = "8" ]; then diceS2_7=6; fi
##if [ "${diceS2[7]}" = "9" ]; then diceS2_7=4; fi
#dbNum=$(( 1 + (${diceS1[0]}-1) + (${diceS1[1]}-1)*6 + (${diceS1[2]}-1)*6**2 + (${diceS1[3]}-1)*6**3 + (${diceS1[4]}-1)*6**4 + (${diceS1[5]}-1)*6**5 + (${diceS1[6]}-1)*6**6 + (${diceS1[7]}-1)*6**7 + (${diceS1[8]}-1)*6**8 + (${diceS1[9]}-1)*6**9 + (${diceS1[10]}-1)*6**10 + (${diceS1[11]}-1)*6**11 + (${diceS2m[0]}-1)*6**12 + (${diceS2m[1]}-1)*6**13 + (${diceS2m[2]}-1)*6**14 + (${diceS2m[3]}-1)*6**15 + (${diceS2m[4]}-1)*6**16 + (${diceS2m[5]}-1)*6**17 + (${diceS2m[6]}-1)*6**18 + (${diceS2m[7]}-1)*6**19 + (${diceS2t[0]}-1)*6**20 + (${diceS2t[1]}-1)*6**21 + (${diceS2t[2]}-1)*6**22 + (${diceS2t[3]}-1)*6**23 + (${diceS2t[4]}-1)*6**24 + (${diceS2t[5]}-1)*6**25 + (${diceS2t[6]}-1)*6**26 + (${diceS2t[7]}-1)*6**27 + (${diceS3m[0]}-1)*6**28 + (${diceS3m[1]}-1)*6**29 + (${diceS3m[2]}-1)*6**30 + (${diceS3m[3]}-1)*6**31 + (${diceS3m[4]}-1)*6**32 + (${diceS3m[5]}-1)*6**33 + (${diceS3m[6]}-1)*6**34 + (${diceS3m[7]}-1)*6**35 + (${diceS3t[0]}-1)*6**36 + (${diceS3t[1]}-1)*6**37 + (${diceS3t[2]}-1)*6**38 + (${diceS3t[3]}-1)*6**39 + (${diceS3t[4]}-1)*6**40 + (${diceS3t[5]}-1)*6**41 + (${diceS3t[6]}-1)*6**42 + (${diceS3t[7]}-1)*6**43))
#echo $dbNum

# export to maxima to compute dbNum
cat > /tmp/001.mac << EOF
with_stdout("/tmp/001.txt",print(1 + (${diceS1[0]}-1) + (${diceS1[1]}-1)*6 + (${diceS1[2]}-1)*6**2 + (${diceS1[3]}-1)*6**3 + (${diceS1[4]}-1)*6**4 + (${diceS1[5]}-1)*6**5 + (${diceS1[6]}-1)*6**6 + (${diceS1[7]}-1)*6**7 + (${diceS1[8]}-1)*6**8 + (${diceS1[9]}-1)*6**9 + (${diceS1[10]}-1)*6**10 + (${diceS1[11]}-1)*6**11 + (${diceS2m[0]}-1)*6**12 + (${diceS2m[1]}-1)*6**13 + (${diceS2m[2]}-1)*6**14 + (${diceS2m[3]}-1)*6**15 + (${diceS2m[4]}-1)*6**16 + (${diceS2m[5]}-1)*6**17 + (${diceS2m[6]}-1)*6**18 + (${diceS2m[7]}-1)*6**19 + (${diceS2t[0]}-1)*6**20 + (${diceS2t[1]}-1)*6**21 + (${diceS2t[2]}-1)*6**22 + (${diceS2t[3]}-1)*6**23 + (${diceS2t[4]}-1)*6**24 + (${diceS2t[5]}-1)*6**25 + (${diceS2t[6]}-1)*6**26 + (${diceS2t[7]}-1)*6**27 + (${diceS3m[0]}-1)*6**28 + (${diceS3m[1]}-1)*6**29 + (${diceS3m[2]}-1)*6**30 + (${diceS3m[3]}-1)*6**31 + (${diceS3m[4]}-1)*6**32 + (${diceS3m[5]}-1)*6**33 + (${diceS3m[6]}-1)*6**34 + (${diceS3m[7]}-1)*6**35 + (${diceS3t[0]}-1)*6**36 + (${diceS3t[1]}-1)*6**37 + (${diceS3t[2]}-1)*6**38 + (${diceS3t[3]}-1)*6**39 + (${diceS3t[4]}-1)*6**40 + (${diceS3t[5]}-1)*6**41 + (${diceS3t[6]}-1)*6**42 + (${diceS3t[7]}-1)*6**43))$
printfile("/tmp/001.txt")$
quit();
EOF
/usr/local/bin/maxima < /tmp/001.mac > /dev/null
dbNum=`cat /tmp/001.txt`
echo "Permutation No.: "$dbNum

#----------------------------------------------------------------------------------
# determine the sequence of bar numbers to be played for Parts I and II
#----------------------------------------------------------------------------------
measPerm1=""
measPerm2m=""
measPerm2t=""
measPerm3m=""
measPerm3t=""
for ind in 1 2 3 4 5 6 7 8; do
	measj1=${diceS1[$ind-1]}
	ruletabS1 $measj1
	measPerm1="$measPerm1${measNR[$ind-1]}:"
	#echo $measPerm1
	measj2m=${diceS2m[$ind-1]} 
	ruletabS2m $measj2m
	measPerm2m="$measPerm2m${measNR[$ind-1]}:"
	#echo $measPerm2m
	measj2t=${diceS2t[$ind-1]} 
	ruletabS2t $measj2t
	measPerm2t="$measPerm2t${measNR[$ind-1]}:"
	#echo $measPerm2t
	measj3m=${diceS3m[$ind-1]} 
	ruletabS3m $measj3m
	measPerm3m="$measPerm3m${measNR[$ind-1]}:"
	#echo $measPerm3m
	measj3t=${diceS3t[$ind-1]} 
	ruletabS3t $measj3t
	measPerm3t="$measPerm3t${measNR[$ind-1]}:"
	#echo $measPerm3t
done
for ind in 9 10 11 12; do
	measj1=${diceS1[$ind-1]}
	ruletabS1 $measj1
	measPerm1="$measPerm1${measNR[$ind-1]}:"
	#echo $measPerm1
	measj2m=${diceS2m[$ind-1]} 
done

#----------------------------------------------------------------------------------
# if output abc file already exists, then make a back-up copy
#----------------------------------------------------------------------------------
if [ -f $filen ]; then 
	mv $filen $filen."bak"
fi

#----------------------------------------------------------------------------------
# generate the header of the ABC file
#----------------------------------------------------------------------------------
catToFile "%%scale 0.50
%%pagewidth 21.10cm
%%bgcolor white
%%topspace 0
%%composerspace 0
%%leftmargin 0.80cm
%%rightmargin 0.80cm
%%barsperstaff	0 % number of measures per staff
%%equalbars false
%%measurebox false % measure numbers in a box
%%measurenb	0
%
X:$dbNum
T:${fileInd}
%%setfont-1 Courier-Bold 12
T:\$1sf::$measPerm1\$0
T:\$1:$measPerm2m::$measPerm2t\$0
T:\$1:$measPerm3m::$measPerm3t\$0
T:\$1Perm. No.: $dbNum\$0
M:2/4
L:1/8
Q:1/8=90
V:1 clef=treble sname=Flute
V:2 clef=treble sname=Violin 
V:3 clef=alto1 sname=Clavier 
V:4 clef=bass 
V:5 clef=bass sname=Cello
%%staves [ 1 2 {3 4} 5]
K:G
%
%%MIDI program 1 73       % Instrument 74 Flute
%%MIDI program 2 40       % Instrument 41 Violin
%%MIDI program 3 06       % Instrument 07 Harpsichord
%%MIDI program 4 06       % Instrument 07 Harpsichord
%%MIDI program 5 42       % Instrument 43 Cello
%%staffnonote 0"

#----------------------------------------------------------------------------------
# write the notes of the ABC file
#----------------------------------------------------------------------------------
p1Gf="";p1Gv="";p1Fc=""
p2Gfm="";p2Gvm="";p2Fcm=""
p2Gft="";p2Gvt="";p2Fct=""
p3Gkm="";p3Fkm=""
p3Gkt="";p3Fkt=""
for col in 1 2 3 4 5 6 7; do
	#for Part I
	ruletabS1 ${diceS1[$col-1]}
	measN=${measNR[$col-1]}
	p1Gf=${p1Gf}" "${notesGf[$measN-1]}" |"
	p1Gv=${p1Gv}" "${notesGv[$measN-1]}" |"
	p1Fc=${p1Fc}" "${notesFc[$measN-1]}" |"
	#for Part II-minuet
	ruletabS2m ${diceS2m[$col-1]}
	measN=${measNR[$col-1]}
	p2Gfm=${p2Gfm}" "${notesGf[$measN-1]}" |"
	p2Gvm=${p2Gvm}" "${notesGv[$measN-1]}" |"
	p2Fcm=${p2Fcm}" "${notesFc[$measN-1]}" |"
	#for Part II-trio
	ruletabS2t ${diceS2t[$col-1]}
	measN=${measNR[$col-1]}
	p2Gft=${p2Gft}" "${notesGf[$measN-1]}" |"
	p2Gvt=${p2Gvt}" "${notesGv[$measN-1]}" |"
	p2Fct=${p2Fct}" "${notesFc[$measN-1]}" |"
	#for Part III-minuet
	ruletabS3m ${diceS3m[$col-1]}
	measN=${measNR[$col-1]}
	p3Gkm=${p3Gkm}" "${notesGk[$measN-1]}" |"
	p3Fkm=${p3Fkm}" "${notesFk[$measN-1]}" |"
	#for Part III-trio
	ruletabS3t ${diceS2t[$col-1]}
	measN=${measNR[$col-1]}
	p3Gkt=${p3Gkt}" "${notesGk[$measN-1]}" |"
	p3Fkt=${p3Fkt}" "${notesFk[$measN-1]}" |"
done
# add the 8th bar for Part II
ruletabS2m ${diceS2m[7]}
p2Gfm=${p2Gfm}" "${notesGf[${measNR[7]}-1]}" :|\n|:"
p2Gvm=${p2Gvm}" "${notesGv[${measNR[7]}-1]}" :|\n|:"
p2Fcm=${p2Fcm}" "${notesFc[${measNR[7]}-1]}" :|\n|:"
ruletabS2t ${diceS2t[7]}
p2Gft=${p2Gft}" "${notesGf[${measNR[7]}-1]}" :|"
p2Gvt=${p2Gvt}" "${notesGv[${measNR[7]}-1]}" :|"
p2Fct=${p2Fct}" "${notesFc[${measNR[7]}-1]}" :|"
# add the 8th bar for Part III
ruletabS3m ${diceS3m[7]}
p3Gkm=${p3Gkm}" "${notesGk[${measNR[7]}-1]}" :|\n|: [K:Bb]"
p3Fkm=${p3Fkm}" "${notesFk[${measNR[7]}-1]}" :|\n|: [K:Bb]"
ruletabS3t ${diceS3t[7]}
p3Gkt=${p3Gkt}" "${notesGk[${measNR[7]}-1]}" :|]"
p3Fkt=${p3Fkt}" "${notesFk[${measNR[7]}-1]}" :|]"

# add 8th to 12th bars for Part I
for col in 8 9 10 11; do
	ruletabS1 ${diceS1[$col-1]}
	measN=${measNR[$col-1]}
	p1Gf=${p1Gf}" "${notesGf[$measN-1]}" |"
	p1Gv=${p1Gv}" "${notesGv[$measN-1]}" |"
	p1Fc=${p1Fc}" "${notesFc[$measN-1]}" |"
done
# Part I, 12th bar
ruletabS1 ${diceS1[11]}
p1Gf=${p1Gf}" "${notesGf[${measNR[11]}-1]}" :|"
p1Gv=${p1Gv}" "${notesGv[${measNR[11]}-1]}" :|"
p1Fc=${p1Fc}" "${notesFc[${measNR[11]}-1]}" :|"

echo -e "%\n% Part I (12 bars)\n%" >> ./$filen
echo -e "[V:1]|: ${p1Gf}" >> ./$filen
echo -e "[V:2]|: ${p1Gv}" >> ./$filen
echo -e "[V:3]|: z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 :| " >> ./$filen
echo -e "[V:4]|: z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 | z4 :| " >> ./$filen
echo -e "[V:5]|: ${p1Fc}" >> ./$filen
echo -e "%\n% Part II (8 + 8 bars)\n%" >> ./$filen
echo -e "[V:1]|: [M:3/4]${p2Gfm}${p2Gft}" >> ./$filen
echo -e "[V:2]|: [M:3/4]${p2Gvm}${p2Gvt}" >> ./$filen
echo -e "[V:3]|: [M:3/4]z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :| " >> ./$filen
echo -e "[V:4]|: [M:3/4]z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :| " >> ./$filen
echo -e "[V:5]|: [M:3/4]${p2Fcm}${p2Fct}" >> ./$filen
echo -e "%\n% Part III (8 + 8 bars)\n%" >> ./$filen
if [ "${diceS3m[2]}" == "6" ]; then
	echo -e "[V:1]|: z6 | z6 | [M:7/8] z6z [M:3/4] | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|] " >> ./$filen
	echo -e "[V:2]|: z6 | z6 | [M:7/8] z6z [M:3/4] | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|]  " >> ./$filen
	echo -e "[V:3]|: [K:F]${p3Gkm}${p3Gkt}" >> ./$filen
	echo -e "[V:4]|: [K:F]${p3Fkm}${p3Fkt}" >> ./$filen
	echo -e "[V:5]|: z6 | z6 | [M:7/8] z6z [M:3/4] | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|]  " >> ./$filen
else
	echo -e "[V:1]|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|] " >> ./$filen
	echo -e "[V:2]|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|]  " >> ./$filen
	echo -e "[V:3]|: [K:F]${p3Gkm}${p3Gkt}" >> ./$filen
	echo -e "[V:4]|: [K:F]${p3Fkm}${p3Fkt}" >> ./$filen
	echo -e "[V:5]|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|\n|: z6 | z6 | z6 | z6 | z6 | z6 | z6 | z6 :|]  " >> ./$filen
fi

# create SVG
abcm2ps ./$filen -O ./"sf-$fileInd.svg" -g

# create MIDI
abc2midi ./$filen -quiet -silent -o ./"sf-$fileInd.mid"
#
##
###
