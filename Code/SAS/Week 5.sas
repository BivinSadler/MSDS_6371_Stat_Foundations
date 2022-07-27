/* Permutation Test */

proc iml;
G1 = {27,19,20,20,23,17,21,24,31,26,28,20,27,19,25,31,24,28,24,29,21,21,18,27,20};
G2 = {21,19,13,22,15,22,15,22,20,12,24,24,21,19,18,18,23,20};
obsdiff = mean(G1) - mean(G2);
print obsdiff;
call randseed(12345);
alldata = G1 // G2;
N1 = nrow(G1); N = N1 + nrow(G2);
NRepl = 9999;
nulldist = j(NRepl,1);
do k = 1 to NRepl;
	x = sample(alldata, N, "WOR");
	nulldist[k] = mean(x[1:N1]) - mean(x[ (N1 + 1):N]);
end;

title "Histogram of Null Distribution";
refline = "refline" + char(obsdiff) + " / axis = x lineattrs=(color=red);";
call Histogram(nulldist) other = refline;
run;

create newds from nulldist;
append from nulldist;

run;

data pvaluecalc;
set newds;
count = 0;
if (COL1 >= 4.377) then count = count + 1;
pvalue = count/10000;
run;

proc univariate data = pvaluecalc;
var pvalue;
output out = pvalue sum = pvalue;
run;

proc print data = pvalue;
run;


/* Wilcoxon Rank-Sum */
data example;
input score method $;
datalines;
37 New
49 New
55 New
77 New
23 Trad
31 Trad
46 Trad
;

/* The HL gives the CI, It is the Hodges-Lehmann Estimation */

proc npar1way data = example wilcoxon;
class method;
var score;
exact HL Wilcoxon;
run;


data pvalue_nocc;
	pval = CDF('Normal', (137-203)/21.7013);
run;
proc print data = pvalue_nocc

data pvalue_yescc;
	pval = CDF('Normal', (137-203)/21.7013);
run;
proc print data = pvalue_yescc;



/* Paired tests - Wilcoxon signed-rank test and sign test*/

data horse;
input horse site1 site2;
datalines;
6 14.2 16.4
4 17 19
8 37.4 37.6
5 11.2 6.6
7 24.2 14.4
9 35.2 24.4
3 35.2 23.2
1 50.6 38
2 39.2 18.6
;


proc print data = horse;
run;

data horse;
set horse;
Diff = site1 - site2;
run;

proc print data = horse;
run;

proc univariate data = horse;
var Diff;
run;


/* Equality of variance check for tests coming not normaly distribution*/
/* The F test no longer works.*/


data example;
input Score Method $;
datalines;
15 New
3	New
3 New
25 New
8 Trad
0 Trad
15 Trad
;

/* Leven's Test (Median)*/
proc ttest data = example;
class method;
var score;
run;


/* Brown and Forsythe's Test (Median)*/
proc glm data = example;
class method;
model score = method;
means type / hovtest = bf;
run;
