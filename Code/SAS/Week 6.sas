data anovact;
input group x;
datalines;
1 3
1 5
1 7
2 10
2 12
2 14
3 20
3 22
3 24
;

/* Side-by-side ANOVA boxplot */
proc glm data = anovact;
class group;
model x = group / solution;
run;


/* Simple ANOVA test */
proc glm data = anovact;
class group;
model x = group;
run;


/* generating Scatterplot For SD check */
proc sqplot data = anovact;
scatter x = group y = x;
run;

/* Brown and Forsuthe's test for SD check */
proc glm data = ld;
class Drug;
model LambdaDrop = Drug;
means Drug / hovtest = bf;
run; 


/* Adding variable for ANOVA test */
data spock2;
set spock;
if judge ne "S" then Othersmodel = "Others";
else OtherModel = "S";
run;


/* QQplot and Histogram for multiple groups */

PROC SORT data = incomedata;
  BY educ;
RUN;

proc univariate data = incomedata;
by educ;
histogram income2005;
qqplot income2005;
run;



/* Kruskal-Wallis Test for ANOVA test when data not normally distributed */
proc npar1way data = example Wilcoxon;
class group;
var score;
run;

/* ANOVA Welch test for unequal variances */
proc glm data = incomedata;
class Educ;
model logincom2005 = Educ;
means Educ / hovtest = bf welch;
run; 


/* Power of ANOVA test */

proc power;
onewayanova test = overall
alpha = 0.05
groupmeans = 3|7|8
stddev = 4
power = 0.8
ntotal = .;
run;

proc power;
onewayanova test = contrast
contrast = (1 0 -1)
groupmeans = 3|7|8
stddev = 4
npergroup = 25
power = .;
run;

proc power;
onewayanova test = overall
groupmeans = 3|7|8
stddev = 4
groupweights = (1 2 2)
ntotal = .
power = 0.8;
run;



