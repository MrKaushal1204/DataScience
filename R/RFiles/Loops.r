#DATA TYPES AND VARIABLES IN R------------------------

# The most common data types in R are the ones listed in the following list:
# 
# Numeric : integer and double (real).
# Character.
# Logical.
# Complex.
# Raw.

#-------NUMERIC DATA TYPE------------------------------------#
# The numeric data type in R is composed by double (real) and integer data types.
# You can check if an object is numeric with the is.numeric function returns TRUE.

is.numeric(3) # TRUE=
is.numeric(56)
is.numeric(12.5)
typeof(3L)



#1.DOUBLE

# Double or real data type
# The double data type in R is the representation of a double-precision numeric object. 
# Note that, by default, all numbers are double in R 
# and Inf, -Inf, NaN, the scientific notation of numbers are also doubles.

typeof(2)# "double"
typeof(3)
is.numeric(3)

is.double(3)


typeof(NaN)
# Infinite
typeof(Inf)
# "double"
typeof(-Inf) # "double"

# Not a number
# "double"

typeof(-2)
# 2.INTEGER
# The integer data type can be created adding an L to a number. 
# This data type is useful if you want to pass some R object to a C or FORTRAN function that expects an integer value, 

# You can check the data type with the is.integer function.

is.integer(3) # FALSE
is.integer(3L)# TRUE

typeof(3L)


##########Logical data type#####################


# The boolean or logical data type is composed by TRUE, FALSE and NA values.

# In addition, the function that prints whether an object is logical or not is is.logical.

is.logical(T) # TRUE
is.logical(TRUE) # TRUE
is.logical(F)


# Note that you can use T and F instead of TRUE or FALSE. 
# However, the first is not recommended because you could override the 
# value of T or F but not TRUE or FALSE, as shown in the following block of code.

F # FALSE
a = T
a

b = F
b

T<-b

print(T)


# You can name a variable with T or F
F <- a
print(F) # TRUE

# You can't name a variable with TRUE or FALSE
a <- TRUE
a = TRUE
a

FALSE <- a# Error

T <- 1:5
print(T)

a<- 1:5

print(a)

#########COMPLEX DATA TYPE###################

# The complex data type is an object that includes an imaginary number (i).
# As imaginary numbers are not generally used in statistics, this data type is not very common. 
# The function to check the data type is is.complex.

1+3i

typeof(1+3i) # "complex"

is.complex(1+3i) #[1] TRUE

##########CHARACTER####################################

# Character strings are symbols, letters, words or phases inside double or single quotation marks. 
# With this in mind, we can verify that some object is of type character with the is.character function.

typeof('maDhu') #[1] "character"----Note that using single or double quotations marks is equivalent.
typeof("MADHU") #[1] "character"

# the nchar function counts the number of characters inside a string, even the empty spaces.

nchar("I am Madhu B") #



##############RAW DATA TYPE############

# The raw data type holds raw bytes, so it is a very unusual data type. 
# For instance, you could transform a character object or a numeric value to a raw object with the charToRaw 
# and intToBits functions, respectively.

a = charToRaw("SIMPLILEARN")
print(a)
a
typeof(a) 

s<- rawToChar(a)
s

b <- intToBits(9L)
b
typeof(b) 



###############OPERATORS IN R##################################

#######ARITHMETIC ###########

# lets take an example and see how each arithmetic operator works.

x=10
y=3

x+y #13
x-y # 7
x*y # 30
x/y #3.333333
x^y #1000
x%%y #1             ------->this gives the remainder post a division
x%/%y #3            ---------->This gives the quotient

#####-------RELATIONAL OPERATORS---------------------------###

#These operators are used to compare two values. The result is a logical vector.

5<3 #FALSE
5>3 # TRUE
5<=5 
6>=5 
10^3 ==1000 
2+5==8  
5!=5  


##########LOGICAL OPERATORS---------##

x<-c(3,4,5)
y<-c(3,5,1)


40 & 5 > 30
40 & 60 >30
40> 30 | 5 > 30
4 > 30 | 5 > 30

x|y >5

!TRUE  # FALSE
!FALSE # TRUE
2 | 3 > 30

#---------
# Vectors
#---------

x <- c(3, 4+1i, 5)    #c stands for combine. 3,4,5 are combined in a single vector x 
y <- c(3, 5+6i, 1)
z <-c(3, 4, 5)

y&z


x & y  # TRUE TRUE TRUE -------
# AND Operator "&" The AND operator takes two logical values and returns TRUE 
#only if both values are TRUE themselves. 
# This means that TRUE & TRUE evaluates to TRUE , 
# but that FALSE & TRUE , TRUE & FALSE , 
# and FALSE & FALSE evaluates to FALSE . 
# Only TRUE and TRUE will give us TRUE.

x && y  # TRUE

# &&Called Logical AND operator. 
# Takes first element of both the vectors and gives the TRUE only if both are TRUE.

x | y   # TRUE TRUE TRUE
x || y  # TRUE

!x # FALSE FALSE FALSE

M <- c(3,4,2+2i,TRUE)
N <- c(1,3,9+3i,FALSE)
print(M&&N)
## &&Called Logical AND operator. 
# Takes first element of both the vectors and gives the TRUE only if both are TRUE.

print(M&N)
#It is called Element-wise Logical AND operator. 
#It combines each element of the first vector with the corresponding element of the second vector and gives a output TRUE if both the elements are TRUE.


#In Algebra, any non-zero input value is considered to be a logical true, 
#and zero is considered a logical false.

A <- c(3,0,TRUE,2+2i)
B <- c(4,0,FALSE,2+3i)
print(A|B)
print(A&B)
#It is called Element-wise Logical OR operator. 
#It combines each element of the first vector with the corresponding element of the second vector and gives a output TRUE if one the elements is TRUE.

#Called Logical OR operator. 
#Takes first element of both the vectors and gives the TRUE if one of them is TRUE.


M <- c(TRUE,FALSE) 
N<- c(FALSE, TRUE) 
M&N
#############ASSIGNMENT OPERATOR#############################################

age<- 18  ----------#Left assignment
  18 -> age   ---------#Right assignment
  
  print(age)

age<-18
18->age
age

###########CONDITIONAL STATEMENTS IN R ######################################

#  Suppose we have a variable `x` equal to 5. 
#  If this `x` is smaller than zero, we want R to print out "x is a negative number!". 
#  How can we do this using the `if` statement? 
#  We first assign the variable, `x` and then write the `if` test.


# if (expression/condition) {
#   #statement to execute if condition is true
# }

x = 5

if(x>0) {
  print("X is a positive number") 
}

#QUESTION-----Now change with x<3,we will get no result

x <- 5

if(x<3) {
  print("X is a positive number") 
}

##########ELSE STATEMENT########################################

#suppose we want to print out "x is positive or zero", 
#whenever the condition is not met. We can simply add the else statement:

X <- 5

if(x<6) {
  print('x is a negetive number')
} else 
{
  print('X is a positive number')
}

X <- 5

if(x<3) {
  print('x is a negetive number')
} else 
{
  print('X is a positive number')
}

#EX-2

# Assigning value to variable x
x <- 12

# Condition
if (x > 30)
{
  print("12 is less than 30")  # Statement
}
print("Hello World")


#EX-3

x <- c("data","is","prime")

if("Data" %in% x) {
  print("Data is found")
} else {
  print("Data is not found")
}

#Correcting---
x <- c("data","is","prime")

if("data" %in% x) {
  print("Data is found")
} else {
  print("Data is not found")
}
#############ELSE-IF STATEMENT###################

#The else if statement comes in between the if and else statement.

x <- -3

if(x<0) {
  print('x is a negetive number')
} else if(x==0){
  print('x is zero')  
}else 
{
  print('x is a positive number')   #"x is a negetive number"
}

# #In this case as R encounters the first statement,the condition is satisfied,
# hence the other statements are not executed at all,and the result is printed.
# only IF ONE CONDITION IS NOT SATISFIED THEN R PROCEEDS TO THE NEXT CONDITION.
# IF THE FIRST CONDITION IS SATISFIED,THEN THE REMAINING STATEMENTS ARE NOT EXECUTED 
# AT ALL(AS IN THIS CASE)

category <- 'A'
price <- 10
if (category =='A'){
  cat('A vat rate of 8% is applied.','The total price is',price *1.08)  
} else if (category =='B'){
  cat('A vat rate of 10% is applied.','The total price is',price *1.10)  
} else {
  cat('A vat rate of 20% is applied.','The total price is',price *1.20)  
}



x <- c("data","is","prime")

if("Data" %in% x) {
  print("Data is found the first time")
} else if ("data" %in% x) {
  print("Data is found the second time")
} else {
  print("No Data found")
}

#In this code the third condition after the else statement is not executed at all.
#As the second condition is satisfied R prints the output and does not execute 
#any further statements.

#Vectorised form of IF-ELSE Statement

age <- 22
ifelse(age>=21,
       "Adult","Minor")

age<-20
ifelse(age>=21,ifelse(age>=70,"Older","Adult"),"Minor")

#EX-2

Even = c(14,17,60,9,12)
ifelse(Even %% 2 == 1,"odd","even")




# With else if, you have at least 2 code blocks, one for your first if statement, 
# when it is true, and then a second if statement, when the if statement isn't true, 
# but you want another condition to execute this block.
# An "else if" block leads to a further level of nesting. 
#In case the "if" condition is false, then the "else if" condition is evaluated in a sequential manner till a condition is True.
# You can have only one "if" block but multiple "else if" blocks.

#SWITCH STATEMENT

# A switch statement allows a variable to be tested for equality against a list of values. 
# Each value is called a case, and the variable being switched on is checked for each case.

val1 = 6  
val2 = 7
val3 = "s"  
result = switch(  
  val3,  
  "a"= cat("Addition =", val1 + val2),  
  "d"= cat("Subtraction =", val1 - val2),  #cat function in R will combine character values and print them. 
  #The cat function coerces its arguments to character values, then concatenates and displays them. 
  "r"= cat("Division = ", val1 / val2),  
  "s"= cat("Multiplication =", val1 * val2),
  "m"= cat("Modulus =", val1 %% val2),
  "p"= cat("Power =", val1 ^ val2)
) 

#result------######?????

val1 = 6  
val2 = 7
val3 = "r"  
result = switch(  
  val3,  
  "a"= cat("Addition =", val1 + val2),  
  "d"= cat("Subtraction =", val1 - val2),  #cat function in R will combine character values and print them. 
  #The cat function coerces its arguments to character values, then concatenates and displays them. 
  "r"= cat("Division = ", val1 / val2),  
  "s"= cat("Multiplication =", val1 * val2),
  "m"= cat("Modulus =", val1 %% val2),
  "p"= cat("Power =", val1 ^ val2)
)     


val1 = 6  
val2 = 7
val3 = "8"
result = switch(  
  val3,  
  "a"= cat("Addition =", val1 + val2),  
  "d"= cat("Subtraction =", val1 - val2),  #cat function in R will combine character values and print them. 
  #The cat function coerces its arguments to character values, then concatenates and displays them. 
  "r"= cat("Division = ", val1 / val2),  
  "s"= cat("Multiplication =", val1 * val2),
  "m"= cat("Modulus =", val1 %% val2),
  "p"= cat("Power =", val1 ^ val2)
)     

#**************************************************************************************************#
#LOOPS
#FOR LOOPS

x<-LETTERS[1:10]          #x has letters 1to 10.Here for every value of "i" in x,it will  
for (i in x)             #print the result,till no further values of x is left.
{
  print(i)
}


#x is a subset of LETTERS
#FOR LOOPS

vec <-c(1,2,3,4,5)
for (val in vec)
{
  print(val)
}

#?LETTERS #built in constants in R,LETTERS: the 26 upper-case letters of the Roman alphabet

#HOMEWORK
#vec<-c(1,2,3,4,5)
vec2<-c(1:5)
for (val in vec2)
{
  print(val)
}

#REPEAT LOOPS

#first we define a variable "x" and a second variable "count"
#Then we create the repeat Loop

v <- c("Hello","World")
count <- 2

repeat {
  print(v)
  count <- count+1
  
  if(count > 5) {
    break
  }
}

#HOMEWORK
#Here we define a variable x and assign it a value of 1.
#conditional statements are incrementing the value of x by 1,along with printing the value of x.
#the break happens on the condition when x equals 6

x<-1
repeat
{
  print(x)
  x=x+1
  if(x==6)
  {
    break
  }
}

#WHILE LOOP
#We define 2 variables,values and count.
#Then we create the While loop

values = ("while loop")
count = 5                        #In this case first the cond is checked as the count is 5,
while (count<7)
{
  print(values)
  count = count +1
}                                 #the value is printed. in 2nd iteration count is incremented
#by 1 i.e 6,so again the value is printed.
#In the 3rd iteration count is 7,so cond is not met and loop exits.


#HOMEWORK
#Define a variable i and assign a value of 1.
#then create a while loop

i<-1
while (i<6)
{
  print(i)
  i=i+1
}

#LOOP CONTROL STATEMENT
#BREAK STATEMENT

#When present inside a loop, it stops the iterations from executing and forces the flow to exit the
#loop.
x = 1:5
for (val in x){
  if(val==3){
    
    break
  }
  print(val) 
}



#Now say we dont want value 3 but we want the reamining values to be printed,i.e 1,2,4,5 
#Then we use the NEXT Statement.

x = 1:5
for (val in x)
{ if(val==3)
{
  next
}
  print(val) 
  
}

#NEXT STATEMENT
#It helps in skipping the current iteration of a loop.
x <- 1
while(x < 5) 
{
  x <- x + 1; 
  if (x == 3) 
    next; 
  print(x);
} 


lt <- LETTERS[1:6]

for (s in lt) {
  if (s == "C") {
    next
  }
  print(s)
}
#HOMEWORK
num <- 1:5

for (val in num)
{
  if (val == 2)
  {
    next
  }
  print(val)
}  

#The break and Next statement are very important to make changes in the execution of the loop

x <- 1
while(x < 5) 
{
  x <- x + 1; 
  if (x == 3 | x == 4) 
    next; 
  print(x);
} 


######-------------------FUNCTIONS-----------------------------#####

#TOLOWER FUNCTION

#lets create a dataframe first 

A = data.frame(State = c('Arizona AZ','Georgia GG', 'Newyork NY','Indiana IN','Florida FL'), 
               Score=c(62,47,55,74,31))
str(A)

A$State_lower = tolower(A$State)

A

#out
# State Score State_lower
# 1 Arizona AZ    62  arizona az
# 2 Georgia GG    47  georgia gg
# 3 Newyork NY    55  newyork ny
# 4 Indiana IN    74  indiana in
# 5 Florida FL    31  florida fl

#####################GREP---------------------------##########

# The grep R function searches for matches of certain character pattern in a vector
# of character strings and returns the indices that yielded a match.

# lets create a vector first

Z <- c('a','ben','cat')
Z

grep("a",Z)  

#########STR-------------------------

#Compactly display the internal structure of an R object,alterantive to summary function.

str(A)

###########CLASS---------

# Determine the class of an object or its "internal" type.

x<- c(1,2,3)
class(x)

Z <- c("a","2","c")
class(Z)
##########APPEND--------
# append() method in R programming is used to append 
# the different types of integer values into a vector in the last.

#Syntax: append(x, value, index(optional))

d<- c(1,2,3,4,5)
s<-append(d,10)
print(s)
#[1]  1  2  3  4  5 10



bbb<- c(10:15)

bbb   #10 11 12 13 14 15
?append

bbb1 <- append(bbb, 2, 1)

print(bbb1) 
?append

########LENGTH

#length() function in R Language is used to get or set the length of a vector (list) or other objects.

ffff<-c(3,6,5,4,7)
gggg<-c("i", "am"," madhu")
length(ffff)  

####Rep

n<-c(2,3)
m<-rep(n,5)
m#[1] 2 3 2 3 2 3 2 3 2 3


#######SEQ---------------------------

#Generating Sequence from X to Y

r<-seq(5, 10)
r
#seq fn from- to  
#[1]  5  6  7  8  9 10

#Generating Sequence from X to Y by Certain Value

seq(5,10,0.5)   #[1]  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5  9.0  9.5 10.0


#####UNIQUE

#unique function in R -unique(), eliminates duplicate elements/rows from a vector, data frame 

P<-c(1:10,5:15)     
P

unique(P)        





