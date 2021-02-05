
proc print data = Fatigue;
run;

data Fatigue;
set Fatigue;
Diff = Not_Fatigued - Fatigued;
run;

proc print data = Fatigue;
run;

proc univariate data = Fatigue;
var Diff;
run;



proc univariate
Import Data
Proc Univariate 
Compare to R Code
Write Conclusion.
