###################################DATA MANIPULATION###############################

# Data manipulation is required to bring accuracy and precision in the data.
# R base package has 'apply' functions in it, which helps in manipulating the data multiple times, thus
# avoiding the use of loop constructs.

###############################APPLY FUNCTIONS#####################################

#The apply functions are used to perform a specific change to each column or row of R objects.

# Types of apply functions in R:
#   
# o apply()
# o lapply()
# o sapply()
# o tapply()
# o mapply()
# o vapply()
# o rapply()

# apply(), lapply(), and sapply() are the most commonly used functions. We will
# limit our scope to apply(), lapply(), and sapply() in this course.

# apply() helps apply a function to a matrix row or column and returns a vector, array, or list.
# 
# Syntax:
#   
#   Types of Apply Functions
# 
# apply() lapply() sapply()
# 
# apply(x, margin, function)
# 
# Where,
# . margin indicates whether the function is to be applied to a row or column.
# o margin = 1 indicates that the function needs to be applied to a row.
# o margin = 2 indicates that the function needs to be applied to a column.
# . function can be any function such as mean, sum, or average

########APPLY FUNCTION---##############################

m <- matrix( c(1,2,3,4),2,2 ) 
m

# #[,1] [,2]
# [1,]    1    3
# [2,]    2    4
apply(m,1,sum) #sum applied to rows

#[1] 4 6
apply(m,2,sum) #------------Sum applied to columns
#[1] 3 7

#EXAMPLE2

# Construct a 4x5 matrix
Z <-matrix(1:20, nrow = 4, ncol = 5)
Z

# Sum the values of each column with `apply()`
apply(Z, 2, sum)

#######################LAPPLY FUNCTION#####################################

# The lapply function applies a function to a list or a vector, 
# returning a list of the same length as the input. The syntax of the function is as follows:
#   
# lapply function syntax
# lapply(X,   # List or vector
#        FUN, # Function to be applied
#        ...) # Additional arguments to be passed to FUN


# Using the lapply function is very straightforward, 
# you just need to pass the list or vector and specify the function you want to apply to each of its elements.


#Now say we create two elements A and B

a <- list(A = c(8, 9, 7, 5),
          B = data.frame(x = 1:5, y = c(5, 1, 0, 2, 3)))
a

#OUT
# $A
# [1] 8 9 7 5
# 
# $B
# x y
# 1 1 5
# 2 2 1
# 3 3 0
# 4 4 2
# 5 5 3

# If you apply the function sum to the previous list you will obtain the sum of each of its elements 
# (the sum of the elements of the vector and the sum of the elements of the data frame).

lapply(a, sum)

#OUT
# $A
# [1] 29
# 
# $B
# [1] 26

# If you have a vector, the lapply function will apply a function to all elements to the vector. 
# As an example, consider the vector b and calculate the square root of each element:

b <- c(12, 18, 6)

lapply(b, sqrt)


#OUT
# [[1]]
# [1] 3.464102
# 
# [[2]]
# [1] 4.242641
# 
# [[3]]
# [1] 2.44949

########################################SAPPLY##################

#The sapply function in R applies a function to a vector or list and returns a vector, a matrix or an array.

# sapply(X,   # Vector, list or expression object
#        FUN, # Function to be applied
#        ..., # Additional arguments to be passed to FUN
#        simplify = TRUE,  # If FALSE returns a list. If "array" returns an array if possible 
#        USE.NAMES = TRUE) # If TRUE and if X is a character vector, uses the names of X


List <- list(A = 1:5, B = 6:20, C = 1)

List

# #$A
# [1] 1 2 3 4 5
# 
# $B
# [1]  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
# 
# $C
# [1] 1

sapply(List, length)
#OUT
# A  B  C 
# 5 15  1


# #sapply() is similar to lapply(), except that it simplifies the result so that:
# If the result is a list and every element in the list is of size 1, then a vector is returned.
# If the result is a list and every element in the list is of the same size (>1), then a matrix is returned.
# Otherwise, the result is returned as a list itself.

list1 <- list(a = c(1,1), b=c(2,2), c=c(3,3))
list1
sapply(list1,sum)

#OUT
# a b c 
# 2 4 6

vec2<-sapply(1:4, sqrt)
vec2

vec3<-lapply(a<-c(1:5),sum)
vec3


#OUT
# [1] 1.000000 1.414214 1.732051 2.000000

listn <- list(a = c(1,2), b=c(1,2,3), c=c(1,2,3,4)) ######returns a matrix as dimensions are not equal
sapply(listn, range)
listn
#LOOP VS APPLY FUNCTIONS:
#Loops:
#mtcars
#length(mtcars$disp)
data("mtcars")
str(mtcars)
mean_ageE <- NULL
total <- NULL
for(i in 1:length(mtcars$disp)){
  total <- sum(total, mtcars$disp[i])
}
mean_ageE <- total/length(mtcars$disp)
mean_ageE
total
head(mtcars)

#-------value is 7383.1 dividing by length in the console will givw the mean value for verification

#Apply Functions
head(mtcars)
apply(mtcars[3],2, mean)

apply(mtcars$disp,2, mean)   #Will THrow indexing error
?apply

####################DPLYR##########################

# There are packages available consisting of many functions which help in data manipulation.
# dplyr is one of the most commonly used functions and is a powerful R package.

# dplyr package transforms and summarizes tabular data with rows and columns.
# . It provides simple verbs- functions that correspond to the most common data manipulation tasks to
# help you translate your thoughts into code.
# o Select
# o Filter
# o Arrange
# o Mutate
# o Summarize
# . The use of efficient data storage backends by dplyr results in quicker processing speed.

install.packages() #------package can be downloaded in CRAN

# The dplyr package has the following functions:
# o Select()
# o Filter()
# o Arrange()
# o Mutate()
# o Summarize()
# To understand the use of these functions, let's consider the dataset "mtcars" and "iris"
# available with dplyr package.

#The Select() verb allows you to select specific columns from large data sets.
#Different ways to select column by name:

library(dplyr)
a <-select(mtcars, mpg, disp)
a
head(a)
str(a)


#We will begin with the select() statement. We don't necessarily need all the variables,
#and a good practice is to select only the variables you find relevant.


#Here we select or choose columns which match the specific criteria
head(iris)
w <-select(iris, starts_with("Petal"))
head(w)
select(iris, ends_with("Width"))
r<-select(iris, contains("etal"))
head(r)
q<-select(iris, matches(".t."))
head(q)
head(r)
head(iris)
str(iris)

#---------------------FILTER() FUNCTION-----------------------------------------------#

#The filter() verb helps to keep the observations following a criteria. The filter() works exactly like select(), 
#you pass the data frame first and then a condition separated by a comma
#This function enables easy filtering, zoom in, and zoom out of relevant data.

#Simple filter
head(mtcars)

filter(mtcars, cyl == 8) #filter only those cars with cyl size equal to 8 and less than 6
filter(mtcars, cyl < 6)

#Multiple criteria filter

filter(mtcars, cyl < 6 & vs == 1)
# f<-filter(mtcars, cyl < 6)
# print(f)
filter(mtcars, cyl < 8 | vs == 1)

#Comma separated arguments are equivalent to the "And" condition.
#Example: filter(mtcars, cyl < 6, vs == 1) is same as 1st arg in multiple cri filter

#----------------------ARRANGE()--------------------------------------------------#

#This function helps arrange the data in a specific order.
#Here,we first arrange disp in desc order,then 

arrange(mtcars, desc(disp))
arrange(mtcars, cyl, disp) #If neither asc/desc is mentioned,sorting is done in asc order.

head(mtcars) # To check the results.


#---------------------MUTATE()----------------------------------------------------#

#This function helps add new variables to an existing data set.
mtcars1 <-mtcars       #Just for information,creates a copy of the dataframe
new<-mutate(mtcars, my_custom_disp = disp / 1.089)
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

setwd('C:/Users/RIYANRIYA/Desktop/DS_R_FULL/data_R_SL')
getwd()
#Demo1

BankCustomer = read.csv("Bank_Data_3_2.csv")
View(BankCustomer)
str(BankCustomer)
head(BankCustomer)
#stringsAsFactors syntax - Now importing data as char strings with an explicit syntax
BankCustomer = read.csv("Bank_Data_3_2.csv",stringsAsFactors = FALSE)
str(BankCustomer)

#DEMO 2

#Situation: A data scientist would like to know the impact of different 
#generations on outcome of marketing campaign.

#We convert the continuous variable "age" into 4 categories for our analysis

# 4 levels based on different generations :
#   Generation/Year
# Z----Born 1996 and later
# Y----Born 1977 to 1995
# X----Born 1965 to 1976
# Baby Boomers---Born 1946 to 1964.

library(plyr)
#BankCustomer = rename(BankCustomer,c("ï..age"="age"))
max(BankCustomer$age)
min(BankCustomer$age)
#Age is between 19 to 87

#Step 2: Defining Age for each generation

# Generation/YearFromTo
# Z Born 1996 and later              0-22
# Y Born 1977 to 1995                22-41
# X Born 1965 to 1976                41-53
# Baby Boomers Born 1946 to 1964     53-Above

#Step 3: R script with if else condition
BankCustomerAgeCategorized = transform(BankCustomer,Generation = ifelse(age<22,"Z",ifelse(age<41,"Y",ifelse(age<53,"X","Baby Boomers"))))
#?transform

head(BankCustomerAgeCategorized)

#Step4
Final_Table<-table(BankCustomerAgeCategorized$Generation,BankCustomerAgeCategorized$poutcome)
Final_Table

write.table(Final_Table, "C:/Users/RIYANRIYA/Desktop/DS_R_FULL/data_R_SL/DEMO.txt", sep="\t")
