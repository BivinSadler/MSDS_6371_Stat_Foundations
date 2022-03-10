# Unit 13 Tuna Example

tuna = read.csv(file.choose(),header = TRUE)

fit = lm(Length~Age, data = tuna)
summary(fit)

fit = lm(Length~Age + I(Age^2), data = tuna)
summary(fit)
