library(WDI)
library(tidyverse)
WDIsearch("infant") # yields the indicator: SP.DYN.IMRT.IN
WDIsearch("GDP") # yields the indicator: NY.GDP.PCAP.CD
InfantMort = WDI(,"SP.DYN.IMRT.IN",start = 2019, end = 2019)
GDPs = WDI(,"NY.GDP.PCAP.CD",start = 2019, end = 2019)
InfantVGDP = inner_join(GDPs,InfantMort,"country")
InfantVGDP = InfantVGDP[,c(1,2,3,4,6)]
colnames(InfantVGDP) = c("iso2C","country","GDP","year","InfantMort")
InfantVGDP