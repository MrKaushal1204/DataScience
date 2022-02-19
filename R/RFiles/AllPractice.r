counts <- table(mtcars$gear)


barplot(counts,
        main = "Simple Bar Chart",
        xlab = "Improvement",
        ylab = "Frequency",
        legend=rownames(counts),
        col = c("Orange","Pink","grey"))
 

count1 <- table(mtcars$vs,mtcars$gear)
count1

barplot(count1,
        main = "Simple Bar Chart",
        xlab = "Improvement",
        ylab = "Frequency",
        legend=rownames(count1),
        col = c("Orange","Pink","grey"))

library(plotrix)
install.packages("plotrix")


hist(mtcars$mpg,breaks = 6)


pie3D(mtcars$mpg)


hist(c(22,1,21,12,14,42,13,34,56,4,64,90),xlab = "xlabels",ylab = "Ylables", col = "dark green", xlim = c(0,100), ylim = c(0,6))



abc <- c("my",1,2,3,"name")
abc
abc[1:5]

getwd()
setwd("d:/ds/r/rfiles")

setwd(choose.dir())
getwd()


BankCustomer <- read.csv("d:/DS/R/RFiles/excels/Bank_Data_3_2.csv")

BankCustomer2 <- read.csv("d:/DS/R/RFiles/excels/Bank_Data_3_2.csv", stringsAsFactors = FALSE)



str(BankCustomer2)


vec <- list(c(1:9),c(10:18))
vec

m1 <- matrix(vec,nrow = 6,ncol = 3,byrow = TRUE)
m1
apply(m1,2,sum)


sapply(vec, sum)

library(dplyr)

head(select(mtcars,mpg:vs,am,gear))


mtcars
str(mtcars)

group_by()

str(iris)
