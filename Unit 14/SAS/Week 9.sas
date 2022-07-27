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
proc print data = ans;
run;

title 'Model 1';
proc reg data = ans;
model y1 = x1;
run;

title 'Model 2';
proc reg data = ans;
model y2 = x2;
run;

title 'Model 3';
proc reg data = ans;
model y3 = x3;
run;

title 'Model 4';
proc reg data = ans;
model y4 = x4;
run;



/* Sample linear correlation in SAS - Pearson's r */
data studytime;
input exampscore studytime;
datalines;
34 1
54 1
45 2
70 2
55 2
68 3
67 4
79 4
45 4
89 6
95 7 
78 7
94 8 
;

proc print data = studytime;
run;

proc corr data = studytime;
run;


/* Plotting Data */
proc sgscatter data = studytime;
plot exampscore*studytime;
title "Study Time Analysis";
run;

/* Regression model */
proc reg data = studytime;
model exampscore = studytime / clb;
run;


/* Regression model */
proc glm data = studytime;
model exampscore = studytime;
means exampscore / hovtest = bf cl;
run;

data fls;
input speed Mpg;
datalines;
20 24
30 28
40 30
50 28
60 24
;

proc corr data = fls;
run;

/* HW */
proc reg data = nba;
model wins = payroll / clb;
run;

proc glm data = nba;
model wins = payroll;
means wins / hovtest = bf cl;
run;


proc print data = test;
run;


proc reg data = test;
model math = science / clb alpha = 0.01;
run;
