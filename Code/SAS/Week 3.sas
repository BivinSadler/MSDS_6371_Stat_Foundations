/* Import Data  */
FILENAME REFFILE 'D:/SMU/Data Science/Assignment/Unit 3/Fire_age.csv';
PROC IMPORT DATAFILE = REFFILE
	DBMS = CSV
	OUT = Fireage;
	GETNAMES = YES;
run;


proc print data = Fireage;
run;

/* For checking the normality and equal standard deviation  */
proc ttest data = cloud sides = u;
class treatment;
var rainfall;
run;

/* Calculating logatirthm */
data cloud;
set cloud;
lograin = log(rainfall);
run;

/* Checking again if the normality and standard deviation asumptions are met */
proc ttest data = cloud sides = u;
class treatment;
var lograin;
run;

/* Just for getting the confidence interval - Note: While the one sided test (above) haa a alpha = 0.05, for calculating the alpha for two-sided, we need to multipy it by 2 */
proc ttest data = cloud sides = 2 alpha = 0.1;
class treatment;
var lograin;
run;


/* Paired ttest */
proc ttest data = twitch sides = l; /* One-side test */
paired Placebo*Ritalin;
run;

/* Paired ttest */
proc ttest data = twitch alpha = .1; /* CI for one side test*/
paired Placebo*Ritalin;
run;
