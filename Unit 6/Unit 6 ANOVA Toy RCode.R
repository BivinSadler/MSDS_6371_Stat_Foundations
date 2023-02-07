
# Rcode

anovaCT = data.frame(x = c(3,5,7,10,12,14,20,22,24), group = factor(c(1,1,1,2,2,2,3,3,3)))

fit = aov(x~group, data = anovaCT)
summary(fit)

