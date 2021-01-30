# Oring R Code Permuation Test Example

Oring <- read.csv(file.choose(),header = TRUE); # This reads it in if you directory is set to the right folder.

t.test(Oring$Failures ~ Oring$Temp)

number_of_permutations = 10000;
xbarholder = c();
counter = 0;
observed_diff = mean(subset(Oring, Temp == "Warm")$Failures)-mean(subset(Oring, Temp == "Cool")$Failures)

for(i in 1:number_of_permutations)
{
  scramble = sample(Oring$Failures,24);
  Warm = scramble[1:20];
  Cool = scramble[21:24];
  diff = mean(Warm)-mean(Cool);
  xbarholder[i] = diff;
  if(diff <= observed_diff)
    counter = counter + 1;
  
}
hist(xbarholder, col = "lightblue", main = "Differences Means Under Ho", xlab = "Diff of Means");
abline(v = observed_diff,col = "red", lwd = 3);
pvalue = counter / number_of_permutations;
pvalue
