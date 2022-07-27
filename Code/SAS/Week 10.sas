data Ans;
input x1 y1 x2 y2 x3 y3 x4 y4;
datalines;
10 8.04 	10 9.14		10 7.46 	8 6.58
8 6.95 		8. 8.14		8 6.77		8 5.67
13 7.58		13 8.74		13 12.74		8 7.7
9 8.81		9 8.77		9 7.11		8 .84
11 8.33		11 9.26		11 7.81		8 8.47
14 9.96		14 8.10		14 8.84		8 7.04	
6 7.24		6 6.13		6 6.08		8 5.25
4 4.26		4 3.10		4 5.39		19 12.50
12 10.84	12 9.13		12 8.15		8 5.56
7 4.82		7 7.26		7 6.42		8 7.91
5 5.68		5 4.74		5 5.73		8 6.89
;

proc glm data = Ans plots = all;
model y1 = x1;
run;

proc reg data = Ans;
model y1 = x1;
run;

proc glm data = Ans;
model y1 = x1;
run;

data studytime;
input examscore studytime gp $;
datalines;
34 1 A
56 1 A
45 2 A
70 2 A
55 2 A
68 3 B
67 4 B
79 4 B
45 4 B
89 6 B
95 7 B
78 7 A
94 8 A
;


PROC SORT data = studytime;
  BY gp;
RUN;

proc univariate data = studytime;
by gp;
histogram examscore;
qqplot examscore;
run;


/* Predicting a value above (. , 5) */


/* Confidence Interval */
proc reg data = studytime;
model examscore = studytime / clm;
run;

proc glm data = studytime;
model examscore = studytime / clm;
run;

/* Prediction Interval */
proc reg data = studytime;
model examscore = studytime / cli;
run;

proc glm data = studytime;
model examscore = studytime / cli;
run;

/* HW */

data bird;
input Mass Tcell;
datalines;
3.33	0.252
4.62	0.263
5.43	0.251
5.73	0.251
6.12	0.183
6.29	0.213
6.45	0.332
6.51	0.203
6.65	0.252
6.75	0.342
6.81	0.471
7.56	0.431
7.83	0.312
8.02	0.304
8.06	0.37
8.18	0.381
9.08	0.43
9.15	0.43
9.35	0.213
9.42	0.508
9.95	0.411
4.5 .
;


proc reg data = bird;
model Tcell = Mass / clm alpha = 0.01;
run;

proc reg data = bird;
model Tcell = Mass / cli alpha = 0.01;
run;
