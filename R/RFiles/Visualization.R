library(ggplot2)
library(dplyr)



############## BAR CHART GRAPHS   #################
counts <- table(mtcars$gear)
counts
#length(counts)
#m1 <- matrix(counts,nrow = 8,ncol = 4, byrow = TRUE)
#m1
# Simple BarPlot

barplot(counts,
        main = "Bar Plot",
        xlab = "Frequency",
        ylab = "Count Of Gears",
        legend=rownames(counts),
        col = c("red","yellow","green")
        )


levels(factor(mtcars$vs))

# Stcked Barplot
counts1 <- table(mtcars$vs,mtcars$gear)
counts1
#length(counts)
#m1 <- matrix(counts,nrow = 8,ncol = 4, byrow = TRUE)
#m1


barplot(counts1,
        main = "Gears with VS",
        xlab = "Number of gears",
        ylab = "stacked bar",
        legend.text = rownames(counts1),
        col = c("red","green","cornflowerblue")
        )


# Beside Barplot

besideBarPlot <- table(mtcars$vs,mtcars$gear)
barplot(besideBarPlot,
        main = "Beside Bar Plot with gears and vs",
        xlab = "Frequency of VS and Gears",
        ylab = "Number of vs and Gears",
        legend.text = rownames(besideBarPlot),
        beside = TRUE,
        col = c("grey","cornflowerblue")
        
        )



############## PIE CHART GRAPHS   #################



slices <- c(10,12,4,16,8)
CountryName <- c("US","UK","AUSTRALIA","GERMANY","FRANCE")

per <-round(slices/sum(slices)*100)

lbls <- paste(CountryName," ",per,"%",sep = "")
lbls

pie(slices,
    labels = lbls,
    main = "Pie Chart",
    col = rainbow(5)
)

# 3D Pie Chart

library(plotrix)
pie3D(
  slices,
  labels = lbls,
  main = "3D Pie",
  explode = 0.0,
  col = rainbow(5)
  
)


############## HISTOGRAM CHART GRAPHS   #################

hist(
  mtcars$mpg,
  breaks = 8,
  col = "cornflowerblue"
  )
#levels(factor(mtcars$mpg))


############## KERNAL DENSITY PLOT(KDP) GRAPHS   #################

density_data <- density(mtcars$mpg)
#plot(density_data)

plot(
  density_data,
  main = "Kernal Density of Miles Per Gallon",
  )

polygon(
    density_data,
    col = "skyblue",
    border = "black"
    
  )
  
############## LINE PLOT GRAPHS   #################


weight <- c(2.4,2.6,2.8,3.2,3.8,4.4,4.6,5.3,5.6,5.9,6.1,6.3,7.1,7.9,8.4)

numberOfMonths <- seq(0,length(weight)-1,1)

plot(numberOfMonths,
     weight,
     main = "Baby weight chart by month",
     type = "b",
     col = "darkred",
     xlab = "Months"
     )

############## BOX PLOT GRAPHS   #################

str(airquality)

boxplot(
  airquality$Ozone,
  main = "Mean ozone in parts per billion at Roosevelt Island",
  xlab = "Parts Per Billion",
  ylab = "Ozone",
  horizontal = TRUE,
  col = "green"
)


############## HEAT MAP  #################

# Create a matrix of the given data to implement heat map

mat1 <- as.matrix(mtcars)

heatmap(mat1,
        Colv = NA,
        Rowv = NA,
        scale = "column"
        )

############## WORLD CLOUD MAP  #################

install.packages("wordcloud")
library(wordcloud)

data1 <- read.csv("D:/DS/R/RFiles/excels/import3.csv")

head(data1)


wordcloud(
  words = data1$Nunavut,
  freq = data1$X1,
  min.freq = 2,
  max.words = 100,
  random.order = FALSE,
  rot.per = 0.35,
  colors = brewer.pal(8,"Dark2")
  
)




