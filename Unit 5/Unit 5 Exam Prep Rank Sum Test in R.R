# Drive Milage Sign and Signed Rank Test in R

library(dplyr)

scoreDF = data.frame(Score = c(37,49,55,77,23,31,46), Treatment = c("New","New","New","New","Traditional","Traditional","Traditional"))

scoreDF %>% group_by(Treatment) %>%  summarise(
  count = n(),
  median = median(Score, na.rm = TRUE),
  IQR = IQR(Score, na.rm = TRUE)
)

scoreNew = filter(scoreDF,Treatment == "New")
scoreTrad = filter(scoreDF,Treatment == "Traditional")


wilcox.test(Failures ~ Temp, data = Oring, exact = TRUE)

wilcox.test(Failures ~ Temp, data = Oring, exact = FALSE)



wilcox.test(scoreNew$Score,scoreTrad$Score, exact = TRUE)
wilcox.test(scoreNew$Score,scoreTrad$Score, exact = TRUE, alternative = "g")
wilcox.test(scoreNew$Score,scoreTrad$Score, exact = FALSE, alternative = "g")
wilcox.test(scoreNew$Score,scoreTrad$Score, exact = FALSE, alternative = "g")

