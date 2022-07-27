data blue;
set bb;
age2 = age**2;
;


*Recode for covariance matrix;
data echolocation;
set echolocation;
bird = 0;
if (type = "non-echolocating birds") then bird = 1;
ebat = 0;
if (type = "echolocating bats") then ebat = 1;
nebat = 0;
if (type = "non-echolocating bats") then nebat = 1;
run;


/* Quadratic regression */
proc reg data = blue;
model length = age age2;
run;

/* Var/Cov Matrix */
proc reg data = bats;
model energy = mas body / covb;
run;


proc sgscatter data = MF;
matrix flowers time / diagonal = (histogram);
run;
