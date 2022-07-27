/* Partil Residuals */
proc reg data = brain;
model lbrain = lgest lbody;
run;

/* Pres = lbrain - Beta0 - Beta1body */
data partialres;
set brain;
pres = lbrain + 0.45728 - 0.5517*lbody;
;

proc sgplot data = partialres;
scatter y = pres x = lgest;
xaxis min = 2 max = 7;
yaxis min = 0 max = 9;
run;

proc reg data = partialres;
model pres = lgest;
run;

proc corr data = fat;
var fat Bicepts Weight;
run;

proc reg;
model fat = Bicepts Weight / stb clb VIF scorr1 scorr2;
run;

data fat2;
set bodyfat;
if _n_ = 3 then delete;
run;

/* Reg without intercept */
proc reg data = new;
model metabol = gastric GF / noint;
run;
quit;

/* VIF */
proc reg data = sat plots = all;
model sat = ltakes income years public rank expend / vif;
run;


/* forward */
proc reg data = sat;
model sat = ltakes income years public rank / selection = forward slentry = 0.1 adjrsq;
run;

/* backward */
proc reg data = sat;
model sat = ltakes income years public rank / selection = backward slstay = 0.1 adjrsq;
run;

/* stepwise */
proc reg data = sat;
model sat = ltakes income years public rank / selection = stepwise slentry = 0.1 slstay = 0.1  adjrsq;
run;


/* Condition */
proc reg data = sat plots = all;
where State NE "Alaska";
model sat = ltakes income years public rank expend / vif;
run;



data sat;
set sat;
ltakes = log(takers);
run;

proc print data = sat;
run;

/* Mallow's Cp */
proc reg data = sat;
where state ne "Alaska";
model SAT = ltakes income years expend public rank / selection = cp;
output out = t cookd = cookd;
plot cp.*np. / cmallows = blue vaxis = 0 to 15 by 5l;
run;



/* Variable Selection with Prog GLM */
proc glmselect data = sat;
model SAT = Takers Income Years Public Rank / Selection = forward;
run;

proc glmselect data = sat;
model SAT = Takers Income Years Public Rank / Selection = backward;
run;

proc glmselect data = sat;
model SAT = Takers Income Years Public Rank / Selection = stepwise;
run;




proc glmselect data = sat;
where state ne "Alaska";
model SAT = Takers Income Years Public Rank / Selection = stepwise include = 4;
run;

proc reg data = sat plots(label) = (CooksD all);
model SAT = Takers Income Years Public Rank / VIF;
run;


/* Variable Selection with Sig Level */
proc glmselect data = bodyfat2;
model Fat = Age Height Neck Chest Abs Hip Thigh Knee Ankle Bicepts Forearm Wrist / selection = Forward(stop = SL SLE = .2) stats = adjrsq;
run;


proc glmselect data = bodyfat2;
model Fat = Age Height Neck Chest Abs Hip Thigh Knee Ankle Bicepts Forearm Wrist / selection = Bacward(stop  = SL SLS = .2) stats = adjrsq;
run;

proc glmselect data = sat plots = all;
model SAT = Takers Income Years Public Rank / selection = Stepwise(stop  = SL SLE = .2 SLS = .2) stats = adjrsq;
run;

/* Variable Selection with AIC */

proc glmselect data = sat;
model SAT = Takers Income Years Public Rank / selection = Forward(stop = AIC) stats = adjrsq; 
run;

proc glmselect data = bodyfat2;
model Fat = Age Height Neck Chest Abs Hip Thigh Knee Ankle Bicepts Forearm Wrist / selection = Bacward(stop = AIC) stats = adjrsq; 
run;




/* External Cross Validation - Splitting data  */
proc glmselect data = sat plots = all;
partition fraction(test = .2);
model SAT = Takers Income Years Public Rank / selection = Stepwise(stop = AIC) CVDETAILS stats = adjrsq;
run;

/*5-Fold Cross Validation- External Cross Validation - If we have test dataset */
proc glmselect data = sat testdata = test plots(stepaxis = number) = (criterionpanel ASEPlot);
model SAT = Takers Income Years Public Rank / selection = Stepwise(stop = AIC) stats = adjrsq;
run;


/* Internal Cross Validation - Splitting data  */
proc glmselect data = sat plots(stepaxis = number) = (criterionpanel ASEPlot);
model SAT = Takers Income Years Public Rank / selection = Stepwise(stop = cv) cvmethod = random(5) CVDETAILS stats = adjrsq;
run;

