proc iml;
L = {45,
53.1,
40.8,
75.5,
46.7,
85.4,
85.6,
18.2,
43.2};
U = {23.6,
13.3,
34.2,
18.1,
56.1,
-8.1,
-20.1};
obsdiff = mean(L) - mean(U);
print obsdiff;
call randseed(12345);                             /* set random number seed */
alldata = L // U;                        /* stack data in a single vector */
N1 = nrow(L);  N = N1 + nrow(U);
NRepl = 9999;                                     /* number of permutations */
nulldist = j(NRepl,1);                   /* allocate vector to hold results */

x = sample(alldata, N//NRepl, "WOR");               /* create all resamples */
nulldist = x[,1:N1][,:] - x[,(N1+1):N][,:]; /* compute all mean differences */
 
title "Histogram of Null Distribution";
refline = "refline " + char(obsdiff) + " / axis=x lineattrs=(color=red);";
call Histogram(nulldist) other=refline;

create newds from nulldist;                                                                                                                                                                                                       
append from nulldist; 

run;


data pvaluecalc;
set newds;
count = 0;
if (COL1 >= 38.1048) then count = count + 1;
pvalue = count / 10000;
run;

proc univariate data = pvaluecalc;
var pvalue;
output out = pvalue sum = pvalue;
run;

proc print data = pvalue;
run;

