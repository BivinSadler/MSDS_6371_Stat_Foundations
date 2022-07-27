proc print data = brain;
run;

/* Scatter plot  */

proc sgscatter data = Metab;
matrix mass metab life;
run;

/* Adding Log */
data logmodel;
set metab;
logmetab = log(metab);
logmass = log(mass);
loglife = log(life);
;

proc glm data = logmodel;
model loglife = logmetab logmass / solution clparm;
run;


data MF;
input flowers time $ light;
datalines;
62.3 early 150
77.4 early 150
55.3 early 300
54.2 early 300
49.6 early 450
61.9 early 450
39.4 early 600
45.7 early 600
31.3 early 750
44.9 early 750
36.8 early 900
41.9 early 900
77.8 late 150
75.6 late 150
69.1 late 300
78 late 300
57 late 450
71.1 late 450
62.9 late 600
52.2 late 600
60.3 late 750
45.6 late 750
52.6 late 900
44.4 late 900
;

proc sgscatter data = MF;
matrix flowers light / diagonal = (histogram);
run;

/* Allowing different slopes and intercepts */
proc glm data = mf;
class time(ref = "early");
model flowers = time | light / solution;
run;

proc print  data = donate;
run;

proc glm data = donate;
class cash_c (ref = "0");
model charity = cash_c | Importance / solution;
run;






proc print data = crab;run;

proc print data = crab;
run;
data crab;
	input force height Species $;
		if Species = 'Hemigrapsus nudus' then numberx = 1;
			else if Species = 'Lophopanopeus bellus' then numberx = 2;
			else if Species = 'Cancer productus' then numberx = 3;
run;

	symbol1 V = 'Hemigrapsus nudus' C = black I = none;
	symbol2 V = 'Lophopanopeus bellus' C = red I = none;
	symbol3 V = 'Cancer productus' C = blue I = none;
	Title 'Claw Closing Force versus Propodus Height';
	proc gplot data = crab;
		plot Force*Height = Species;
	run;
	quit;

	
	proc reg data = therapy;
		model post = d1 d2;
	title 'anything';
	run;
	quit;


	proc glm data = crab;
	class species(ref = "Lophopanopeus bellus");
	model Force = Height species / solution;
	run;


	proc glm data = crab plots = all;
	class species(ref = "Lophopanopeus bellus");
	model Force = Height species Height*species / solution;
	run;

