data fls;
input speed Mpg;
datalines;
20 24
30 28
40 30
50 28
60 24
;

/* Plotting all the residuals */
proc reg data = fls plots = all ;
model Mpg = speed / cli clb;
run;


data demo;
input x y group $;
datalines;
1 2 ex
2 3 ex
3 3 ex
4 3 ex
1 2 in
2 3 in 
3 3 in
4 3 in
30 50 in
run;

/* Separate means models (SMM) */
proc glm data = demo;
class group;
model y = x | group /solution;
run;


data demo;
set demo;
bgroup = 0;
if (group = "in") then bgroup = 1;
xgroup = x*bgroup;
run;

proc reg data = demo;
model y = x bgroup xgroup;
run;

data demo;
set demo;
lx = log(x);
run;


/* Lack of Fit Test */

data Ironcor;
input Ironcontent Corrosion;
datalines;
0.01 127.6
0.01 130.1
0.01 128
0.48 122
0.48 124
0.71 113.1
0.71 110.8
0.95 103.9
1.19 101.5
1.44 92.3
1.44 91.4
1.96 86.2
1.96 83.7
;


/* Separate means model (SMM)*/
proc glm data = Ironcor;
class Ironcontent;
model Corrosion = Ironcontent;
run;


/* Linear Regression Model (LRM) */
proc glm data = Ironcor;
model Corrosion = Ironcontent / solution;
run;


