
n = 5
sigma = 5
TheData = c()
TheCurrentData = c()
TheTrueMean = c()
for(i in 1:n)
{
  x = i
  y = rnorm(1,5*x + 3,sigma)
  TheTrueMean = 5*x + 3
  TheCurrentData = cbind(x,y,TheTrueMean)
  TheData = rbind(TheData,TheCurrentData)
}

TheData = data.frame(TheData)
TheData

plot(TheData$x,TheData$y,xlab = "x",ylab = "y",xlim = c(0,n), ylim = c(0,80))
lines(TheData$x, TheData$TheTrueMean, lty = 1)

fitDeg1 = lm(y~x,data = TheData)
RegLineDeg1 = predict(fitDeg1)
#lines(TheData$x, RegLineDeg1, lty = 1, col = "blue")

TheData$x2 = TheData$x^2
TheData$x3 = TheData$x^3
TheData$x4 = TheData$x^4
TheData$x5 = TheData$x^5

fitDeg5 = lm(y~x + x2 + x3 + x4 + x5,data = TheData)
RegLineDeg5 = predict(fitDeg5)
summary(fitDeg5)

lines(TheData$x, RegLineDeg5, lty = 1, col = "red")



#n = 10

n = 10
sigma = 12
TheData = c()
TheCurrentData = c()
TheTrueMean = c()
for(i in 1:n)
{
  x = i
  y = rnorm(1,5*x + 3,sigma)
  TheTrueMean = 5*x + 3
  TheCurrentData = cbind(x,y,TheTrueMean)
  TheData = rbind(TheData,TheCurrentData)
}

TheData = data.frame(TheData)
TheData

plot(TheData$x,TheData$y,xlab = "x",ylab = "y",xlim = c(0,n), ylim = c(0,80))
lines(TheData$x, TheData$TheTrueMean, lty = 1)

fitDeg1 = lm(y~x,data = TheData)
RegLineDeg1 = predict(fitDeg1)
lines(TheData$x, RegLineDeg1, lty = 1, col = "blue")


fitDeg10 = lm(y~x + I(x^2) + + I(x^3) + I(x^4) + I(x^5) + I(x^6) + I(x^7) + I(x^8) + I(x^9) + I(x^10), data = TheData)
RegLineDeg10 = predict(fitDeg10)
summary(fitDeg10)

lines(TheData$x, RegLineDeg10, lty = 1, col = "red")

