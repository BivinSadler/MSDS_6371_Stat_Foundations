logging <- read.csv(file.choose(),header = TRUE); # This reads it in if you directory is set to the right folder.

number_of_permutations = 10000;
xbarholder = c();
counter = 0;
observed_diff = mean(subset(logging, Action == "L")$PercentLost)-mean(subset(logging, Action == "U")$PercentLost)

for(i in 1:number_of_permutations)
{
  scramble = sample(logging$PercentLost,16);
  L = scramble[1:9];
  U = scramble[10:16];
  diff = mean(L)-mean(U);
  xbarholder[i] = diff;
  if(diff >= observed_diff)
    counter = counter + 1;
  
}
hist(xbarholder, col = "lightblue", main = "Differences Means Under Ho", xlab = "Diff of Means");
abline(v = observed_diff,col = "red", lwd = 3);
pvalue = counter / number_of_permutations;
pvalue
