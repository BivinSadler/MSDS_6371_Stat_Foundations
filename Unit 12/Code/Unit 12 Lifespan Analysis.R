# Unit 12 

# Lifespan analysis
library(tidyverse)
library(GGally)

lifespan = read.csv(file.choose(),header = TRUE)
lifespan

lifespan %>% select(c(Mass,Metab,Life)) %>% ggpairs()

lifespan$lmetab = log(lifespan$Metab)
lifespan$lmass = log(lifespan$Mass)
lifespan$llife = log(lifespan$Life)

lifespan %>% select(c(lmass,lmetab,llife)) %>% ggpairs()

lifespan = lifespan %>
fit = lm(llife ~ lmass + lmetab, data = lifespan)
summary(fit)
