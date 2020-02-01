# Rank Sum Distribution

ECdf = ExamCoffee
simulations = 500
RankSumHolder = numeric(simulations)
ranks = c(1,2,3,4,5,6,7,8)

for(i in 1:simulations)
{

  #shuffle labels (internally 1 = Coffee 0 = No_Coffee)
  relables  = sample(c("Coffee","Coffee","Coffee", "Coffee", "NonCoffee", "NonCoffee", "NonCoffee", "NonCoffee"),8)
  relablesNum = as.numeric(relables == "Coffee")
  RankSumHolder[i] = sum(relablesNum*ranks)
  if(i < 6)
  {
    ECdf2 = ECdf
    ECdf2$Treatment = relables
    print(ECdf2)
    print(paste("Sum of Ranks: ",RankSumHolder[i]))
  }
  
}

hist(RankSumHolder)