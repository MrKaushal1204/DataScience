############## GGPLOT  #################

install.packages("ggplot2")
library(ggplot2)


ggplot(
  airquality,
  aes(x = Ozone)
  
)

geom_histogram(
  aes(y = ..count..),
  binwidth = 5,
  colour = "black",
  fill = "blue"
)

scale_x_continuous(
  name = "Mean ozone",
  breaks = seq(0,175,25),
  limits = c(0,175)
)

scale_y_continuous(
  name = "Count"
    
)

ggtitle("Frequency histogram of mean ozone")

