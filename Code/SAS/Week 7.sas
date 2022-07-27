/*  Contrast Examples    */
proc glm data = height order = data;
class sport;
model height = sport;
means sport;
contrast 'Avg. Basketball vs Avg. Soccer & Football & Swimming & Tennis' sport -4 1 1 1 1;
run;

/*  Contrast Examples    */
proc glm data = Handicap order = data;
class Handicap;
model score = Handicap;
means Handicap;
Estimate 'Avg. Amp & Hear vs Avg. Crutch & Wheel' Handicap 0 1 -1 1 -1;
Estimate 'Sum Amp & Hear vs Sum Crutch & Wheel' Handicap 0 1 -1 1 -1 / DIVISOR = 2;
contrast 'Sum Amp & Hear vs Sum Crutch & Wheel' Handicap 0 1 -1 1 -1;
run;


/*  Contrast Examples    */
proc glm data = Handicap order = data;
class Handicap;
model score = Handicap;
means Handicap / hovtest = bf welch;
Estimate 'Avg. Amp & Hear vs Avg. Crutch & Wheel' Handicap 0 1 -1 1 -1;
Estimate 'Sum Amp & Hear vs Sum Crutch & Wheel' Handicap 0 1 -1 1 -1 / DIVISOR = 2;
contrast 'Sum Amp & Hear vs Sum Crutch & Wheel' Handicap 0 1 -1 1 -1;
run;

/*  Adjustment for Multiple Comparisons: Bonferroni    */

proc glm data = Handicap;
class handicap;
model score = handicap;
means handicap / hovtest = bf;
lsmeans handicap / pdiff adjust = bon cl;
run; 

/*  Adjustment for Multiple Comparisons: Bonferroni    */
proc glm data = Handicap;
class Handicap;
model score = Handicap;
means Handicap / hovtest = bf bon cldiff;
run;


/*  Adjustment for Multiple Comparisons: Dunnett    */
proc glm data = Handicap;
class Handicap;
model score = Handicap;
means Handicap / hovtest = bf dunnett('None');
run;

/*  Adjustment for Multiple Comparisons: Dunnett    */
proc glm data = Handicap;
class Handicap;
model score = Handicap;
lsmeans handicap / pdiff = control('None');
run;



/*  Adjustment for Multiple Comparisons: Scheffe    */

proc glm data = Handicap;
class handicap;
model score = handicap;
means handicap / hovtest = bf;
lsmeans handicap / pdiff adjust = scheffe;
run; 

/*  Adjustment for Multiple Comparisons: Scheffe    */
proc glm data = Handicap;
class Handicap;
model score = Handicap;
means Handicap / hovtest = bf scheffe cldiff;
run;


/*  Adjustment for Multiple Comparisons: Tukey    */
proc glm data = Handicap;
class handicap;
model score = handicap;
means handicap / hovtest = bf;
lsmeans handicap / pdiff adjust = tukey;
run; 

/*  Adjustment for Multiple Comparisons: Tukey    */
proc glm data = Handicap;
class Handicap;
model score = Handicap;
means Handicap / hovtest = bf tukey cldiff;
run;

/*  Adjustment for Multiple Comparisons: LSD    */
proc glm data = Handicap;
class handicap;
model score = handicap;
means handicap / hovtest = bf;
lsmeans handicap / pdiff cl;
run; 

/*  Adjustment for Multiple Comparisons: LSD    */
proc glm data = Handicap;
class Handicap;
model score = Handicap;
means Handicap / hovtest = bf cl;
run;








/*  Adjustment for Multiple Comparisons: Tukey    */
proc glm data = incomedata;
class Educ;
model logincom2005 = Educ;
means Educ / hovtest = bf;
lsmeans Educ / pdiff adjust = tukey;
run; 

/*  Adjustment for Multiple Comparisons: Tukey    */
proc glm data = incomedata;
class Educ;
model logincom2005 = Educ;
means Educ / hovtest = bf tukey cldiff;
run;

/*  Adjustment for Multiple Comparisons: Dunnett    */
proc glm data = incomedata;
class Educ;
model logincom2005 = Educ;
means Educ / hovtest = bf dunnett('12');
run;

/*  Adjustment for Multiple Comparisons: Dunnett    */
proc glm data = incomedata;
class Educ;
model logincom2005 = Educ;
lsmeans Educ / pdiff = control('12');
run;


proc glm data = incomedata;
class educp2;
model logincom2005 = educp2;
run;





data incomedata;
set incomedata;
logincom2005 = log(income2005);
run;

proc print data = incomedata;
run;
/* Brown and Forsythe's Test for Homogeneity of percent variance = for equal variance*/
proc glm data = incomedata;
class educp2;
model logincom2005 = educp2;
means educp2 / hovtest = bf;
run;

/* If statements in SAS */
data spock2;
set spock;
if judge ne "S" then OthersModel = "Others";
else OthersModel = "S";
run;

proc print data = incomedata;
run;

/* Welch's Anova for when the standard deviation of samples are not equall 
but they are normally distributed*/
proc glm data = incomedata;
class educ;
model Income2005 = educ;
means educ / hovtest = bf Welch;
run;


/* Kruskal-Walis Nonparametric analysis of variance for when the data is not coming 
from normal distributiion */
proc npar1way data = incomedata wilcoxon;
class Educ;
var Income2005;
run;

/* power test for data with more than two groups */
proc power;
onewayanova test = overall
alpha = 0.05
groupmeans = 3|7|8
stddev = 4
power = 0.8
ntotal = .;
run;

proc print data = incomedata;
run;

proc univariate data = incomedata;
by Educ;
histogram Income2005 = 12;
run;



data height;
input height sport $ Sport_Bask $;
datalines;
Height	Sport	Sport_Bask
70	Soccer	Other
69	Soccer	Other
71	Soccer	Other
71	Soccer	Other
69	Soccer	Other
68	Soccer	Other
70	Soccer	Other
70	Soccer	Other
71	Soccer	Other
80	Basketball	Basketball
79	Basketball	Basketball
81	Basketball	Basketball
82	Basketball	Basketball
78	Basketball	Basketball
70	Football	Other
71	Football	Other
72	Football	Other
73	Football	Other
72	Football	Other
73	Football	Other
70	Swimming	Other
71	Swimming	Other
72	Swimming	Other
71	Swimming	Other
73	Swimming	Other
71	Swimming	Other
72	Swimming	Other
73	Swimming	Other
74	Swimming	Other
69	Tennis	Other
72	Tennis	Other
71	Tennis	Other
;

proc print data = Handicap;
run;


proc glm data=handicap;
class handicap;
model score=handicap;
means handicap /t;
means handicap /dunnett ('None');
means handicap /tukey;
means handicap /bon;
run;









proc glm data = height;
class Sport_Bask;
model height = Sport_Bask;
run;

proc ttest data = height alpha = 0.05 side = l;
	class sport;
	var height;
run;

proc print data = height;
run;

proc glm data = height;
class sport;
model height = sport;
run;

proc sgplot data = height;
scatter x = height y = sport;
run;


proc ttest data = height alpha = 0.05 side = 2;
	class sport;
	var height;
run;

proc ttest data = height;
