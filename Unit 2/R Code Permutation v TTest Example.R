# Read in Data
samplesize = 10
skewedDF = data.frame(Score = c(rchisq((samplesize/2),1),(rexp((samplesize/2),1)+2)), Treatment = c(rep(1,samplesize/2),rep(2,samplesize/2)))

par(mfrow = c(1,2))
hist(skewedDF$Score[1:(samplesize/2)])
hist(skewedDF$Score[((samplesize/2)+1):samplesize ])
# change to data frame to work with t.test
# genenerate the difference in means a pvalue to compare with later
t.test(skewedDF$Score ~ skewedDF$Treatment)

# number of permutations
number_of_permutations = 10000;
#Thi will hold the differnce of sample means generated under the assumption of equality
xbarholder = c();

# this is the observed difference in sample means that we observed.. is the same the one from t.test above. 
observed_diff = mean(subset(skewedDF, Treatment == 1)$Score)-mean(subset(skewedDF, Treatment == "2")$Score)

# This counts the number of diffrences of sample means from each permutation that were more extreme than the one observed (diffreence from t.test above)
counter = 0;

# this loop run all the permutations and generages and remembers the difference of sample means for each permutation of the labels ... 
# remember, the reason we can permute the labels is because we are assuming the null hypothesis to be true... that the means are 
# equal under and thus that the treatment has no effect.  That is, that the result we saw for an individual would have been just as 
#likely to have happened if he or she were in the other group / treatment."

for(i in 1:number_of_permutations)
{
  scramble = sample(skewedDF$Score,samplesize); #shuffle the observations
  # the below two lines effectively radnomly applies the extrinsic and intrinsic labels to the observations. 
  One = scramble[1:(samplesize/2)]; # give the first 23 the extrinsic label
  Two = scramble[(samplesize/2+1):samplesize]; #give the rest the intrinsic lable. 
  diff = mean(One)-mean(Two); # find the difference in sample means from current permutation. under the equality assumtion, most of the time this should be close to zero
  xbarholder[i] = diff; # remember the differene in sample means to compare to the one we observed in the study... 
  
  #if the one we observed sticks out then it will be hard to for the diffs to exceed it and that will be evidence that is doesn't 
  #belong and thus is evidence that the difference is not zero and thus that the means are not equal and thus that there is a 
  #treatment effect. 
  
  #evidence that the means are not equal 
  if(abs(diff) > abs(observed_diff)) 
    counter = counter + 1;
  
}
hist(xbarholder);
pvalue = counter / number_of_permutations; 
pvalue
# the pvalue is the percentage of the differences in sample means that were generaged under 
#the assumption of equal means exceed the one we observed.  If this percentage is small, then this is evidence that the observed 
#difference does not belong in this distribution and thus that the difference is not zero and thus that the means are not equal and thus that there is a 
#treatment effect. 


#Pocket Cash Outlier Example
# Read in Data
skewedDF = data.frame(Score = c(c(1,2,4,6,50),c(1,0,1,2,3)), Treatment = c(rep(1,5),rep(2,5)))

par(mfrow = c(1,2))
hist(skewedDF$Score[1:5])
hist(skewedDF$Score[6:10])
# change to data frame to work with t.test
# genenerate the difference in means a pvalue to compare with later
t.test(skewedDF$Score ~ skewedDF$Treatment)

# number of permutations
number_of_permutations = 10000;
#Thi will hold the differnce of sample means generated under the assumption of equality
xbarholder = c();

# this is the observed difference in sample means that we observed.. is the same the one from t.test above. 
observed_diff = mean(subset(skewedDF, Treatment == 1)$Score)-mean(subset(skewedDF, Treatment == "2")$Score)

# This counts the number of diffrences of sample means from each permutation that were more extreme than the one observed (diffreence from t.test above)
counter = 0;

# this loop run all the permutations and generages and remembers the difference of sample means for each permutation of the labels ... 
# remember, the reason we can permute the labels is because we are assuming the null hypothesis to be true... that the means are 
# equal under and thus that the treatment has no effect.  That is, that the result we saw for an individual would have been just as 
#likely to have happened if he or she were in the other group / treatment."

for(i in 1:number_of_permutations)
{
  scramble = sample(skewedDF$Score,10); #shuffle the observations
  # the below two lines effectively radnomly applies the extrinsic and intrinsic labels to the observations. 
  One = scramble[1:5]; # give the first 23 the extrinsic label
  Two = scramble[6:10]; #give the rest the intrinsic lable. 
  diff = mean(One)-mean(Two); # find the difference in sample means from current permutation. under the equality assumtion, most of the time this should be close to zero
  xbarholder[i] = diff; # remember the differene in sample means to compare to the one we observed in the study... 
  
  #if the one we observed sticks out then it will be hard to for the diffs to exceed it and that will be evidence that is doesn't 
  #belong and thus is evidence that the difference is not zero and thus that the means are not equal and thus that there is a 
  #treatment effect. 
  
  #evidence that the means are not equal 
  if(abs(diff) > abs(observed_diff)) 
    counter = counter + 1;
  
}
hist(xbarholder);
pvalue = counter / number_of_permutations; 
pvalue
# the pvalue is the percentage of the differences in sample means that were generaged under 
#the assumption of equal means exceed the one we observed.  If this percentage is small, then this is evidence that the observed 
#difference does not belong in this distribution and thus that the difference is not zero and thus that the means are not equal and thus that there is a 
#treatment effect. 





