# Unit 12 Meadowfoam Analysis


# With Interaction
MF = read.csv(file.choose(), header = TRUE)

fit = lm(Flowers~ relevel(Time, ref = "Early") * Light, data = MF)
summary(fit)

confint(fit)


fit = lm(Flowers~ relevel(Time, ref = "Late") + Light + relevel(Time, ref = "Late") : Light, data = MF)
summary(fit)

confint(fit)



# No Interaction (Parallel Regression Lines)

fit = lm(Flowers~relevel(Time, ref = "Late") + Light, data = MF)
summary(fit)

confint(fit)
