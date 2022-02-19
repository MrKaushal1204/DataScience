m <- matrix( c(1,2,3,4),2,2 )

  apply(m,1,sum)

  apply(m,2,sum)

  # Construct a 4x5 matrix
  Z <-matrix(1:20, nrow = 4, ncol = 5)
Z
# Sum the values of each column with `apply()`
apply(Z, 2, sum)


b <- c(16, 25, 6)
lapply(b, sqrt)
sapply(b,sqrt)


List <- list(A = 1:5, B = 6:20, C = 1)
sapply(List, length)


list1 <- list(a = c(1,1), b=c(2,2), c=c(3,3))
list1
sapply(list1,sum)



vec2<-sapply(1:4, sqrt)
vec2


library(dplyr)
a <- select(mtcars, mpg, disp)
head(mtcars)
head(a)



r<-select(iris, contains("etal"))
head(r)
q<-select(iris, matches(".t."))
head(q)
head(r)




#The filter() verb helps to keep the observations following a criteria. 

  #Simple filter
head(mtcars)
filter(mtcars, cyl == 8) #filter only those cars with cyl size equal to 8 and less than 6
filter(mtcars, cyl < 6)
#Multiple criteria filter
filter(mtcars, cyl < 6 & vs == 1)
# f<-filter(mtcars, cyl < 6)
# print(f)
filter(mtcars, cyl < 8 | vs == 1)




mtcars1 <-mtcars       #Just for information,creates a copy of the dataframe
new<-mutate(mtcars1, my_custom_disp = disp / 1.089)
head(mtcars)
head(new)



#---------------------------SUMMARISE()--------------------------------------------#
#This function summarizes multiple values to a single value in a dataset.
summarise(group_by(mtcars, cyl), mean(disp))
FINAL <-summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))
FINAL
#summarise() creates a new data frame. It will have one (or more) rows for each combination of grouping variables; if there are no grouping variables, 
#the output will have a single row summarising all observations in the input.
# A TIBBLE is a list of vectors.
#There are two main differences in the usage of a data frame vs a tibble: printing, and subsetting. 
#Tibbles have a refined print method that shows only the first 10 rows, and all the columns that fit on screen. 
#This makes it much easier to work with large data.

