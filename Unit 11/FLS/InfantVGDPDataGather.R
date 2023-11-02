#install.packages("WDI")
library(tidyverse)
library(WDI)
WDIsearch("infant") # yields the indicator: SP.DYN.IMRT.IN
WDIsearch("GDP") # yields the indicator: NY.GDP.PCAP.CD
InfantMort = WDI(,"SP.DYN.IMRT.IN",start = 2019, end = 2019)
GDPs = WDI(,"NY.GDP.PCAP.CD",start = 2019, end = 2019)
InfantVGDP = inner_join(GDPs,InfantMort, "country")
InfantVGDP = InfantVGDP %>% select("country","NY.GDP.PCAP.CD","SP.DYN.IMRT.IN")
colnames(InfantVGDP) = c("country","GDP","InfantMort")
InfantVGDP


# Plot on Raw data
InfantVGDP %>% ggplot(aes(x = GDP, y = InfantMort)) + geom_point() + ggtitle("Infant Mortality versus GDP")
#Plot on linear-log
InfantVGDP %>% ggplot(aes(x = GDP, y = log(InfantMort))) + geom_point() + ggtitle("log(Infant Mortality) versus GDP")
#Plot on log-linear
InfantVGDP %>% ggplot(aes(x = log(GDP), y = InfantMort)) + geom_point() + ggtitle("Infant Mortality versus log(GDP)")
#Plot on log-log
InfantVGDP %>% ggplot(aes(x = log(GDP), y = log(InfantMort))) + geom_point() + ggtitle("log(Infant Mortality) versus log(GDP)")

#Correlation
library(corr)
cor.test(InfantVGDP$InfantMort,InfantVGDP$GDP)


fitloglog = lm(log(InfantMort)~log(GDP), data = InfantVGDP)

fitlinlog = lm(InfantMort~log(GDP), data = InfantVGDP)


