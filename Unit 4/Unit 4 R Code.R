#Unit 4 R Code

# Verify Lightboard
power.t.test(n = 10,delta = 2, sd = 2, sig.level = .05, type = "one.sample",alternative = "one.sided")

#Try IT mu = 8
power.t.test(n = 10,delta = 4, sd = 2, sig.level = .05, type = "one.sample",alternative = "one.sided")











#Try IT Football
power.t.test(n = 8,delta = 450, sd = 500, sig.level = .1, type = "one.sample",alternative = "one.sided")$power

#Try It 1 Minute Example
power.t.test(n = 40,delta = 1, sd = 9.5, sig.level = .05, type = "one.sample",alternative = "two.sided")$power




# Veryify Two Sample Lightboard

power.t.test(n = 50,delta = 2, sd = 3, sig.level = .05, type = "two.sample",alternative = "one.sided")







# Veryify Two Sample Try It

power.t.test(n = 50,delta = 4, sd = 3, sig.level = .05, type = "two.sample",alternative = "one.sided")










#Try It 1 Marijuana Example
power.t.test(n = 65,delta = 1.6, sd = 4, sig.level = .01, type = "two.sample",alternative = "one.sided")$power













#Power Curve Code for One Sample Test

#Effect Size
powerholder = c()
effectsizes = seq(50,700,length = 20)

for(i in 1:20)
{
  powerholder[i] = power.t.test(n = 8,delta = effectsizes[i], sd = 500, sig.level = .1, type = "one.sample",alternative = "one.sided")$power
}

plot(effectsizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)


#Sample Size
powerholder = c()
samplesizes = seq(4,15,by = 1)

for(i in 1:12)
{
  powerholder[i] = power.t.test(n = samplesizes[i],delta = 450, sd = 500, sig.level = .1, type = "one.sample",alternative = "one.sided")$power
}

plot(samplesizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)







# Power Curve Code for Two Sample T Test

#Effect Size
powerholder = c()
effectsizes = seq(.1,3,length = 20)

for(i in 1:20)
{
  powerholder[i] = power.t.test(n = 65,delta = effectsizes[i], sd = 4, sig.level = .01, type = "two.sample",alternative = "one.sided")$power
}

plot(effectsizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)



#Sample Size
powerholder = c()
samplesizes = seq(10,200,length = 20)

for(i in 1:20)
{
  powerholder[i] = power.t.test(n = samplesizes[i], delta = 1.6, sd = 4, sig.level = .01, type = "two.sample",alternative = "one.sided")$power
}

plot(samplesizes,powerholder,type = "l", col = "blue", main = "POWER CURVE", ylab = "POWER", lwd = 3)



