#Power Code for One Sample Test

install.packages("tidyverse")
library(tidyverse)

powerholder = c()
effectsizes = seq(.1,3,length = 20)

for(i in 1:20)
{
  powerholder[i] = power.t.test(n = 50,delta = effectsizes[i], sd = 4, sig.level = .01, type = "one.sample",alternative = "one.sided")$power
}

plot(effectsizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)



# Power Code for Two Sample T Test

powerholder = c()
effectsizes = seq(.1,3,length = 20)

for(i in 1:20)
{
  powerholder[i] = power.t.test(n = 50,delta = effectsizes[i], sd = 4, sig.level = .01, type = "two.sample",alternative = "one.sided")$power
}

plot(effectsizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)



#

# Sample Size to get 80% power
power.t.test(n = ,delta = 1.5, power = .8, sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")

#Actual Power at n = 27
power.t.test(n = 37, delta = 1.5, power = , sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")


powerholder = c()
samplesizes = seq(1,50,length = 50)

for(i in 1:50)
{
  powerholder[i] = power.t.test(n = samplesizes[i],delta = 1.5, sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")$power
}

plot(samplesizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3, ylim = c(0,1))
abline(h = .8, col = "red", lwd = 3)
abline(h = .9, col = "green", lwd = 3)
abline(v = 26, col = "red", lwd = 3)

power.t.test(delta = 1.5, power = .9, sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")$n
abline(v = 35.6, col = "green", lwd = 3)



TheSample = read.csv(file.choose(),header= TRUE)

TheSample %>% ggplot(aes(x = Times),color = "blue",fill = "blue") + geom_histogram(fill = "blue") + ggtitle("Inflation Times of New Inflator")

TheSample %>% ggplot(aes(sample = Times),color = "blue",fill = "blue") + geom_qq_line() + geom_qq() + ggtitle("Inflation Times of New Inflator")


t.test(TheSample, mu = 28.5, alternative = "less")
