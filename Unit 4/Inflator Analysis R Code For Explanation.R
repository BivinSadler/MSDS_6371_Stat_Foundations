#Power Code for One Sample Test

library(tidyverse)

# Sample Size to get 80% power
power.t.test(n = ,delta = 1.5, power = .8, sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")

#Actual Power at n = 27
power.t.test(n = 27, delta = 1.5, power = , sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")

#Actual Power at n = 25
power.t.test(n = 25, delta = 1.5, power = , sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")

#Actual Power at n = 26
power.t.test(n = 26, delta = 1.5, power = , sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")


#Actual Power at n = 20,25,30,35,40
power.t.test(n = c(20,25,30,35,40), delta = 1.5, power = , sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")


# Power for to calculate power for sample size from 1 to 50
powerholder = c()
samplesizes = seq(1,50,length = 50)

for(i in 1:50)
{
  powerholder[i] = power.t.test(n = samplesizes[i],delta = 1.5, sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")$power
}

plot(samplesizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3, ylim = c(0,1))

# Add reference lines
abline(h = .8, col = "red", lwd = 3)
abline(v = 27, col = "red", lwd = 3)

abline(h = .91, col = "green", lwd = 3)
power.t.test(delta = 1.5, power = .91, sd = 3, sig.level = .05, type = "one.sample",alternative = "one.sided")$n
abline(v = 37, col = "green", lwd = 3)






# For the Complete Analysis 

#Assumptions of Hypothesis Test

TheSample = read.csv(file.choose(),header= TRUE)

TheSample %>% ggplot(aes(x = Times)) + geom_histogram(color = "black", fill = "cornflowerblue") + ggtitle("Inflation Times of New Inflator")

TheSample %>% ggplot(aes(sample = Times)) + geom_qq_line() + geom_qq() + ggtitle("Inflation Times of New Inflator")

TheSample %>% ggplot(aes(x = Times)) + geom_boxplot(color = "cornflowerblue") + ggtitle("Inflation Times of New Inflator")


# Hypothesis Test
# Ho: mu = 28.5
# Ha: mu < 28.5

#CV
qt(.05,36)

t.test(TheSample$Times, mu = 28.5, alternative = "less")

# Confidence Intreval
t.test(TheSample$Time, mu = 28.5, alternative = "two.sided", conf.level = .90)


# Percentiles and Mean
summary(TheSample$Times)

# Percentile of 28.5
sum(TheSample$Times < 28.5)/37


