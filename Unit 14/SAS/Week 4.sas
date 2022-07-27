/* Power test calculation */

proc power;
onesamplemeans
	sides = l
	alpha = 0.05
	nullmean = 1.4
	mean = 107
	stddev = 25
	ntotal = 250
	power = .;
run;



proc power;
twosamplemeans
	sides = l
	alpha = 0.1
	meandiff = 20000
	stddev = 500
	npergroup = 8
	power = .;
run;


proc power;
twosamplemeans test=diff_satt
	alpha = 0.05
	meandiff = 3
	groupstddevs = 5 | 8
	groupweights = (1 2)
	ntotal = 60
	power = .;
run;


proc power plotonly;
  ods output plotcontent = PlotData;
  onesamplemeans test = t
  sides = L 
  nullmean = 112 
  mean = 107 
  stddev = 25 
  ntotal = 250 
  power = .; 
  plot x=n min=20 max=250 npoints=20;
run;
