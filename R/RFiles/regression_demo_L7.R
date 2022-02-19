
#Importing the dataset
dataset<-read.csv('Demo 1_Perform simple linear regression.csv')
dataset = dataset[,4:5]
names(dataset)
#Splitting the dataset 
#install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Weight,SplitRatio = 0.7)
training_set = subset(dataset,split==TRUE)
test_set = subset(dataset,split==FALSE)

#Feature Scaling
#training_set[,4:5]=scale(training_set[,4:5]) #As the simple linear package in R takes care of Feature
#test_set[,4:5]=scale(test_set[,4:5])         #scaling,so we omit this step

#Fitting Simple Linear Model to the Training Set

Classifier = lm(formula = Weight~Height,
                data=training_set)
                                        #implies weight is proportional to height
Classifier                               #We build the model with the training set

#To get info on the classifier we type summary(Classifier)in the console.
#We get 3 stars for the height coefficient which proves that the results 
#are statistically significant,and DV and IDV has a strong linear relationship
#the p value gives us an idea how strong the relationship bw DV and IDV is.
#the standard threshold is 0.05 and p should be lower than that,for significant results


#Predicting the Test Set Results

y_est <- predict(Classifier,newdata = test_set )

y_est

#Now we compare the results in the console to the test_set vector in the environment.


#####Visualisations

library(ggplot2)   #To plot with ggplot2 package we start with ggplot() and we start building the plot step by step
ggplot()+
  geom_point(aes(x=training_set$Height,y=training_set$Weight),
             colour='red')+
  geom_line(aes(x=training_set$Height,y=predict(Classifier,newdata = training_set )),
            colour = 'blue')+
  ggtitle('Weight vs Height (Training Set)')+
  xlab('Height')+
  ylab('Weight')

  
#1st component  
#are the observation points,we use the geom_point to scatterplot all the obs in the training set
#with the aes function we specify the points for X axis,and points for Y axis.
#Now to plot the regression line,we will use geom_line with a '+' as it comprises the second part 
#of plotting.In this case when we input the x and y values using the 'aes'function,
#x is the IDV height,and y is the predicted weight values for the training set.
#Now we know the regression line will have the predicted values of DV(Weight)against the real 
#values of IDV(Height)in the training set.
#We add colours red,blue for the obs points and regression line respectively.
#The third component is the title to the graph,which help makes the presentation more appealing
#the the end user.
#While visualising the test set results,we do not modify the geom_line argument as it gives
#us the regression line,which is built on the training data itself.
#If we change it to test set too,we will get the same reg line,as the regression classifier is built
#using the training data.



library(ggplot2)   #To plot with ggplot2 package we start with ggplot() and we start building the plot step by step
ggplot()+
  geom_point(aes(x=test_set$Height,y=test_set$Weight),
             colour='red')+
  geom_line(aes(x=training_set$Height,y=predict(Classifier,newdata = training_set )),
            colour = 'blue')+
  ggtitle('Weight vs Height (Test Set)')+
  xlab('Height')+
  ylab('Weight')

