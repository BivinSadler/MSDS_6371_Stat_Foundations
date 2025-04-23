data comber;
input ages;
datalines;
25
19
37
29
40
28
31
;
proc means data = comber;
var ages;
run;


/* One sample ttest*/
proc ttest data= comber;
var ages;
run;


/* t critical calculation - t value - We only need to put the alpha value that exists in one side of the distribution so when it is one-sided, the alpha is bigger.*/
data criticalvalue;
one_side = quantile("T",0.90,10);
two_side = quantile("T",0.95,10);
proc print data = criticalvalue;
run;

/* p value calculation*/
data pvalue;
/* the 1.46 is the test statistics calculated and 119 is the degree of freedom*/
pvalueside = 1 - cdf("T", 1.46, 119);
pvalue2side = pvalueside*2;

proc print data = pvalue;
run;

/* ttest for one sample size with null hypothesis - one or two sided*/
proc ttest data = comber h0 = 21 sides = 2  alpha = 0.05; /* sides can be 2, u, and l*/
var ages;
run;



/* ttest for two sample size- one or two sided*/
proc ttest data = comber sides = 2 alpha = 0.05;
class treatment;
var ages;
run;


/* Histograms*/
proc univariate data=creativity;
class treatment;
histogram score;
qqplot score; 
run;


proc sgpanel data=creativity;
vbox score / category=treatment;
run;

/* Permutation test for Creativity study*/
data creativity;                                                                                                                           
input treatment score;   /* 1 is extrinsic and 0 in intrinsic*/                                                                                                                                                                                                     
datalines;                                                                                                                                                                                                                   
1 5
1 5.4
1 6.1
1 10.9
1 11.8
1 12
1 12.3
1 14.8
1 15
1 16.8
1 17.2
1 17.2
1 17.4
1 17.5
1 18.5
1 18.7
1 18.7
1 19.2
1 19.5
1 20.7
1 21.2
1 22.1
1 24
0 12
0 12
0 12.9
0 13.6
0 16.6
0 17.2
0 17.5
0 18.2
0 19.1
0 19.3
0 19.8
0 20.3
0 20.5
0 20.6
0 21.3
0 21.6
0 22.1
0 22.2
0 22.6
0 23.1
0 24
0 24.3
0 26.7
0 29.7
;                                                                                                                                                                                                                            
                                                                                                                                                                                                                             
* To get the observed difference;                                                                                                                                                                                            
proc ttest data=creativity;  * You will need to change the dataset name here.;                                                                                                                                                     
                                                                                                                                                                                                                             
   class treatment;    *and change the class variable to match yours here;                                                                                                                                                  
                                                                                                                                                                                                                             
   var score;          * and change the var name here.;                                                                                                                                                                      
                                                                                                                                                                                                                             
run;                                                                                                                                                                                                                         

ods output off;
ods exclude all;
                                                                                                                                                                                                                         
*borrowed code from internet ... randomizes observations and creates a matrix ... one row per randomization ;                                                                                                                
proc iml;                                                                                                                                                                                                                    
use creativity;                        * change data set name here to match your data set name above;                                                                                                                              
read all var{treatment score} into x;   *change varibale names here ... make sure it is class then var ... in that order.;                                                                                                  
p = t(ranperm(x[,2],1000));    *Note that the "1000" here is the number of permutations. ;                                                                                                                                    
paf = x[,1]||p;                                                                                                                                                                                                              
create newds from paf;                                                                                                                                                                                                       
append from paf;                                                                                                                                                                                                             
quit;                                                                                                                                                                                                                        
                                                                                                                                                                                                                             
*calculates differences and creates a histogram;                                                                                                                                                                             
ods output conflimits=diff;                                                                                                                                                                                                  
proc ttest data=newds plots=none;                                                                                                                                                                                            
  class col1;                                                                                                                                                                                                                
  var col2 - col1001;                                                                                                                                                                                                        
run;                                                                                                                                                                                                                         

ods output on;
ods exclude none;       
                  
proc univariate data=diff;                                                                                                                                                                                                   
  where method = "Pooled";                                                                                                                                                                                                   
  var mean;                                                                                                                                                                                                                  
  histogram mean;                                                                                                                                                                                                            
run;                                                                                                                                                                                                                         
                                                                                                                                                                                  
*The code below calculates the number of randomly generated differences that are as extreme or more extreme thant the one observed (divide this number by 1000 you have the pvalue);                                         
*check the log to see how many observations are in the data set.... divide this by 1000 (or however many permutations you generated) and that is the (one sided)p-value;                                                     
data numdiffs;                                                                                                                                                                                                               
set diff;                                                                                                                                                                                                                    
where method = "Pooled";                                                                                                                                                                                                     
if abs(mean) >= 4.1442;   *you will need to put the observed difference you got from t test above here.  note if you have a one or two tailed test.;                                                                           
run;                                                                                                                                                                                                                         
* just a visual of the rows produced ... you can get the number of obersvations from the last data step and the Log window.;                                                                                                 
proc print data = numdiffs;                                                                                                                                                                                                  
where method = "Pooled";                                                                                                                                                                                                     
run; 
