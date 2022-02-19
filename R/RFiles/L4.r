counts3 <- table(mtcars$vs,
                 mtcars$gear)


barplot(counts3,
        
        main="Car Distribution by Gears

and VS",
        
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts),
        beside = TRUE) 

#A bar chart represents data in rectangular bars with length of the bar proportional to the value of the variable.
#R uses the function barplot() to create bar charts.

# The basic syntax to create a bar-chart in R is ???
# 
# barplot(H,xlab,ylab,main, names.arg,col)
# Following is the description of the parameters used ???
# 
# H is a vector or matrix containing numeric values used in bar chart.
# xlab is the label for x axis.
# ylab is the label for y axis.
# main is the title of the bar chart.
# names.arg is a vector of names appearing under each bar.
# col is used to give colors to the bars in the graph.

#Bar plots are horizontal or vertical bars used to show comparisons between categorical
#values. They represent length, frequency, or proportion of categorical values.

#Use the mtcars dataset (inbuilt in R) to create simple and horizontal barplots:
#In this case,we use the table function which is used to create a categorical representation of data 
# with variable name and the frequency in the form of a table.

counts <- table(mtcars$gear)
print(counts)
barplot(counts)


#each vertical line shows the count of cars having 3,4,5 gears.

#horizontal bar chart
barplot(counts, horiz=TRUE) #using horiz command true

#Editing the Bar Chart

counts <- table(mtcars$gear)           #vector created above
barplot(counts,
        
        main="Simple Bar Plot",
        xlab="Improvement",      #The legend tells us what each bar represents. 
        ylab="Frequency",
        legend=rownames(counts),#The legend of a graph reflects the data displayed in the graph's Y-axis
        col=c("red", "yellow", "green") #rownames(count)gives the counts along each row which is the freq
        
)

#table() function in R Language is used to create a categorical representation of data 
#with variable name and the frequency in the form of a table
counts

#------------------------Stacked Bar Plot-------------------------------------#
# We can create bar chart with groups of bars 
# and stacks in each bar by using a matrix as input values.
#A stacked bar plot with colors and legends can
#be created using the following code:

counts1 <- table(mtcars$vs,
                 mtcars$gear)        #V and straight engine are two types of engine used 
#which depends on the power of the engine.
barplot(counts1,
        
        main="Car Distribution by Gears

and VS",
        
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts1))

head(counts1)
head(mtcars)

#0 & 1 corresponds to VS and ends up equating to the number of gears.the graph shows how many VS within gear
#3,4,5 are 1(blue) and how many VS within gear 3,4,5 are 0 i.e grey.


#Example 2:

# Create the data for the chart
sale <- c(9,10,18,30,41)
Mnt <- c("Mar","Apr","May","Jun","Jul")

# Give the chart file a name
png(file = "Monthly_sales.png")

# Plot the bar chart 
barplot(sale,names.arg=Mnt,xlab="Month",ylab="Sales",col="Green",    #The args.name describes the meaning of each bar.
        main="Sales Plot")

# Save the file
dev.off()         #dev.off returns the number and name of the new active device (after the specified device has been shut down).
#Do not use the RStudio graphics device even if specified as the default device: it does not accept arguments such as width and height.
#---------------------------------Grouped Bar Plot---------------------------------#

#A grouped bar plot can be created using
#the following code:

counts3 <- table(mtcars$vs,
                 mtcars$gear)


barplot(counts3,
        
        main="Car Distribution by Gears

and VS",
        
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts),
        beside = TRUE)    #--------------This extra line creates a grouped Bar plot from a stacked Bar Plot


#----------------------PIE CHARTS------------------------------------#

# A pie chart is a graph in which a circle is divided into sectors, each representing a
# proportion of the whole.
# 
# The basic syntax for creating a pie-chart using the R is ???
# 
# pie(x, labels, radius, main, col, clockwise)
# Following is the description of the parameters used ???
# 
# x is a vector containing the numeric values used in the pie chart.
# 
# labels is used to give description to the slices.
# 
# radius indicates the radius of the circle of the pie chart.(value between ???1 and +1).
# 
# main indicates the title of the chart.

# col indicates the color palette.
# 
# clockwise is a logical value indicating if the slices are drawn clockwise or anti clockwise.


#A Simple Pie Chart

?pie

#A pie chart is a graph in which a circle is divided into sectors, each representing a
#proportion of the whole.

#Syntax: pie(attributes)

# Consider a pie chart that contains values 10, 12, 4, 16,8
# as slices and US, UK, Australia, Germany, and France
# as labels. Use pie(x, labels =) function to create the pie chart.

slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK",
          "Australia", "Germany",
          "France")
pie( slices, labels = lbls,
     main="Simple Pie Chart")

#Example:2

# Create data for the graph.
Z <- c(12, 26, 50, 73)
labels <- c("AU", "US", "UK", "IND") 

# Give the chart file a name.
png(file = "country.png")

# Plot the chart.
pie(Z,labels)

# Save the file.
dev.off()

#Percentages can be added to a pie chart using the following code:

#A PASTE FUNCTION CONCATENATES VECTORS BY CONVERTING THEM INTO CHARACTER

slices <- c(10,12,4,16,8)
pct <- round(slices/sum(slices)*100)
lbls2 <- paste(c("US","UK","AUS","GERMANY","FRANCE")," ",pct,"%"," ")   #first"" is the gap 
#bw the country name and the precentages,the second "" is for the number and % sign
pie(slices,labels = lbls2,col=rainbow(5),main = "Pie Chart With Percentages")

?pie3D

#---------3D Pie Chart---------------------------------------------#

#library(plotrix)
library(plotrix)
slices <- c(10, 12,4, 16, 8)
lbls3 <- paste(
  c("US", "UK", "Australia",
    "Germany", "France"),
  "", pct, "%", sep=" ")    
pie3D(slices,
      labels=lbls3,explode=0.00001, #EXPLODE FUNCTION DEPICTS 
      #HOW MUCH WE WANT THE PIE TO EXPLODE IN USER UNITS
      #In this case we use the function pie3D,and explode shows the deapth of
      #each slice
      main="3D Pie Chart")


#-----------------------------------------HISTOGRAM-----------------------------#

A histogram represents the frequencies of values of a variable bucketed into ranges. Histogram is similar to bar chat but the difference is it groups the values into continuous ranges. Each bar in histogram represents the height of the number of values present in that range.

It is used to summarize discrete/continuous data that are measured on an interval scale. It is often used to illustrate the major features of the distribution of the data

R creates histogram using hist() function. This function takes a vector as an input and uses some more parameters to plot histograms.

Syntax
The basic syntax for creating a histogram using R is ???
  
  hist(v,main,xlab,xlim,ylim,breaks,col,border)
Following is the description of the parameters used ???
  
  v is a vector containing numeric values used in histogram.

main indicates title of the chart.

col is used to set color of the bars.

border is used to set border color of each bar.

xlab is used to give description of x-axis.

xlim is used to specify the range of values on the x-axis.

ylim is used to specify the range of values on the y-axis.

breaks is used to mention the width of each bar.

#the first step is "bin" the values which means bucketing the values.
#Now its not possible that we will get a bar for each unique value of
#mpg.so we note the entire range of values of mpg,divide it into
#intervals,and see how many cars fall into a specific interval.
#Refer mtcars dataset,consider variable 'mpg' and cars.

#EXAMPLE

The script given below will create and save the histogram in the current R working directory.

# Create data for the graph.
v <-  c(9,13,21,8,36,22,12,41,31,33,19)

# Give the chart file a name.
png(file = "histogram.png")

# Create the histogram.
hist(v,xlab = "Weight",col = "yellow",border = "blue")

# Save the file.
dev.off()




#Creating a simple histogram using the mtcars
# dataset:
# The first step is to "bin" the range of values, i.e.,
# divide the entire range of values into a series of
# intervals and then count how many values fall
# into each interval. Next, use the following code:

mtcars$mpg #miles per gallon data
hist(mtcars$mpg)

#In this plot we note that the majority of cars fall in the interval of 15-20 mpg

#To color histograms with different number of bins, use the following code:

# Colored Histogram with Different Number of Bins
mtcars$mpg
hist(mtcars$mpg,col = "darkgreen",breaks = 8)
hist(mtcars$mpg,col = "darkgreen",breaks = 8, labels = TRUE)

#Breaks are used to create the intervals/bins which also shows the width of each bar.
#the breaks command gives only a suggestion on the number of bins we want.
#now if we want to create 10 equally spaced bins,then we can do it by
mtcars$mpg
hist(mtcars$mpg, breaks = seq(min(mtcars$mpg), max(mtcars$mpg), length.out = 11))

#Col arg cannot be used along with the seq arg

#seq function creates a sequence of elements in a vector

#The length should be n+1 where n is the number of desired bins.

#Range of X and Y values
# To specify the range of values allowed in X axis and Y axis, we can use the xlim and ylim parameters.
#The function break = controls the number of bin.

# Create data for the graph.
v <- c(9,13,21,8,36,22,12,41,31,33,19)

# Create the histogram.
hist(v,xlab = "Weight",col = "green",border = "red", xlim = c(0,45), ylim = c(0,5),
     breaks = 5)
# Give the chart file a name.
png(file = "histogram_lim_breaks.png")

# Save the file.
dev.off()

#---------------------------KERNEL DENSITY PLOTS--------------------------------------

#KDP shows the distribution of a continuous variable.
#Kernel distribution plot is a smoother version of a histogram
#The Histogram is not a great method for determining the shape of a distribution
# because it depends on the number of bins used(So,each value is not plotted as it falls in an interval) To aid this, Kernel density plots
# are used over histograms.
#KDP on the other hand shows the distribution of a variable over a period of time,hence
#it has to be continuous and most generally follows a normal distribution.
#Syntax: plot(density(x))

#we work with the mtcars dataset
#PLOT HISTOGRAM
library(dplyr)
hist(mtcars$mpg)

??dplyr
#The only difference between KDP and hist is in HIST we have frequency/counts on the Y axis
#whereas we have % in the Y axis in KDP and the area under the plot equals 1

density_data <- density(mtcars$mpg)
plot(density_data)
# Give the chart file a name.
png(file = "kernel_Density_plot.png")
#save the file
dev.off()

#in this case we see the distribution is pretty normal like a normal distribution,with a spike
#at value 30.

#to make the plot visually appealing for the end user,we add color and border to the plot,
#use the following codes:

# Filling density Plot with color
density_data <-
  density(mtcars$mpg)
plot(density_data,main="Kernel
     Density of Miles Per Gallon")
polygon(density_data,main="kernel",
        col="skyblue", border="black")
#THIS FUNCTION "POLYGON" IS VERY IMP which will
#fill in the area under the curve.

density_data <- density(mtcars$mpg, adjust= 11)
plot(density_data,main="KernelDensity of Miles Per Gallon")
polygon(density_data ,
        main="kernel",
        col="skyblue",
        border="black")   

#Changing the bandwidth using the adjust parameter,
#so that the KDP closely approximates a normal distribution.
# Start with values 0.1---->a spiked,bumpy plot
#a value of 11 for adjust gives the best approximation of a ND 
#?density         #kernel is a weighting function used in kernel density estimation to estimate random variables' density functions
#??Polygon     #he bandwidth is a measure of how closely we want the density to match the distribution.
########LINE CHART#####################---------------------------

A Line chart is used to represent a series of data points connected by a straight line. It
helps visualize data that changes over time.Most commonly used in forecasting methods.

Syntax: lines(x, y,type=)

type: This parameter has the following value:
  "p" : This value is used to draw only the points.
"l" : This value is used to draw only the lines.
"o": This value is used to draw both points and lines.
#This "type" parameter tells us how we want to visualise a line chart.

#We create a line chart using plot() function by
#plotting body weight against months.

weight <- c(2.5, 2.8, 3.2, 4.8, 5.1,
            5.9, 6.8, 7.1, 7.8,8.1)
months <- c(0,1,2,3,4,5,6,7,8,9)
plot(months,
     weight, type = "b",
     main="Baby Weight Chart")                     #b=points joined by lines

#To change the color of the plot
weight <- c(2.5, 2.8, 3.2, 4.8, 5.1,
            5.9, 6.8, 7.1, 7.8,8.1)
months <- c(0,1,2,3,4,5,6,7,8,9)
plot(months,weight, type = "b",
     main="Baby Weight Chart",col= "green")

#EXAMPLE2:

# Create the data for the chart.
# Create the data for the chart.
Attendence <- c(7,12,28,3,41)
Sessions <- c(14,7,6,19,3)

# Give the chart file a name.
png(file = "line_chart_n_lines.jpg")

# Plot the bar chart.
plot(Attendence,type = "o",col = "red", xlab = "Sessions", ylab = "Attendence", 
     main = "Attendence chart")

lines(Sessions, type = "o", col = "blue")

# Save the file.
dev.off()
?plot




#############################BOXPLOT###############################################

# Box plot, also called whisker diagram, displays the distribution of data based on the five-
#   number summary:
#   
# . Minimum
# . First quartile
# . Median
# . Third quartile
# . Maximum
# 
# The box of a boxplot starts in the first quartile (25%) and ends in the third (75%). Hence, the box represents the 50% of the central data, with a line inside that represents the median. 
# On each side of the box there is drawn a segment(whiskers) to the furthest data(variability outside Q1 and Q3) without counting boxplot outliers, that in case there exist, will be represented with circles.

#REF:BOXPLOT_INTRO
#An outlier is that observation that is very distant from the rest of the data.
#A data point is said to be an outlier if it is greater than (Q3+1.5IQR)(right Outlier)
#or is less than (Q1-1.5IQR)(left Outlier)
#Q1=1st Quartile,Q3=3rd Quartile and IQR=Interquartile Range(Q3-Q1) which also represents
#the width of the box of horizontal boxplots.

# Use the following code to create a box plot
# using the inbuilt R dataset "airquality":
str(airquality)

boxplot(airquality$Ozone,
        main="Mean Ozone in parts perbillion at Roosevelt Island",
        xlab="Parts Per Billion",
        ylab="Ozone",
        horizontal=TRUE)

# boxplot(airquality$Ozone,
#         main="Mean Ozone in parts per
# billion at Roosevelt Island",
#         xlab="Parts Per Billion",
#         ylab="Ozone",
#         horizontal=TRUE)
#EXAMPLE2:

png(file = "boxplot1.png")

# Plot the chart.
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")

# Save the file.
dev.off()

# the 1st,2nd,3rd,4th line represent the minimum,Q1,Median,Q3 and the box shows the IQR
# we notice the max level of Ozone lies within the box.THe 2 points outside the range
#are called "outliers" as it falls beyond the max value and is out of range



#To change the color of the plot, use the following code:

boxplot(airquality$Ozone,
        main="Mean Ozone in parts per billion at Roosevelt Island",
        xlab="Parts Per Billion",
        ylab="Ozone",
        col="green",
        horizontal=TRUE)

#Note that boxplots hide the underlying distribution of the data. In order to solve this issue, 
#you can add points to boxplot in R with the stripchart function (jittered data points will avoid to overplot the outliers) as follows:


library(ggplot2)
# Basic stripchart
ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_jitter()  

#aes=In ggplot2 , aesthetic means "something you can see". 
# Each aesthetic is a mapping between a visual cue and a variable. 
# Examples include: position (i.e., on the x and y axes)

#The point geom is used to create scatterplots. 
#The scatterplot is most useful for displaying the relationship between two continuous variables.
