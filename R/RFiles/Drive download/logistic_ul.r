#Logistic Regression

mydata<- read.csv('edu_logis.csv')
str(mydata)

#As rank and admit are integer values,we convert both to factor variables

mydata$admit<- as.factor(mydata$admit)
mydata$rank = as.factor(mydata$rank)

str(mydata)

#Checking for null values or "0" we do a cross tab

xtabs(~admit+rank,data = mydata)

#Data Split into 80-20 ratio

set.seed(1234)
indp = sample(2, nrow(mydata),replace = T,prob = c(0.8,0.2))
train_set = mydata[indp==1,]
test_set = mydata[indp==2,]

model1 = glm(admit~ gre+gpa+rank,data = train_set,family = 'binomial')  #as DV takes only 2 values
summary(model1)

#OUTPUT

# only gpa is significant as the confidence level is 1-.003=99.7% same applies for rank3 and rank4
#we can drop gre from our analysis as it is insignificant

#RERUNNING THE MODEL DROPPING "GRE"

model2 = glm(admit~ gpa+rank,data = train_set,family = 'binomial')
summary(model2)

#OUTPUT 
# shows that gpa p value has decreased or its confidence level has increased.
# rank3 and rank 4 are significant too

#Predictions

p1 = predict(model2,train_set,type = 'response')
head(p1)
head(train_set)

#output
# for first obs,there are 28% chance that 1st student having gre of 380,gpa of 3.61 
# and graduating from a rank3 school will get addmission.
# as 28%<50% so it will fall in the rejection zone
# now taking all values and putting it in the equation we get,
# log(p/1-p)= -4.727+1.3735*gpa+(-0.5715*rank2)+(-1.1645*rank3)+(-1.5642*rank4)
# now as rank1,rank2,rank3,rank4 are treated as dummies,so if we want to
#focus on rank1,rank2,3,4 will be 0 likewise for rank2,rank 1,3.4 will be 0

#Focusing on 1st applicant

# > y= -4.727+1.3735*3.61+(1*-1.1645)
# > y
# [1] -0.933165
# > exp(y)/(1+exp(y))
# [1] 0.282283

#focusing on 3rd applicant

# y= -4.727+1.3735*4
# > y
# [1] 0.767
# > exp(y)/(1+exp(y))
# [1] 0.6828716

#MISCLASSIFICATION ERROR

predict1 = ifelse(p1>0.5,1,0)
tab1 = table(predicted= predict1,Actual = train_set$admit)
tab1         #CONFUSION MATRIX

1-sum(diag(tab1))/sum(tab1)

#27% is the misclassification rate for training data

#TEST DATA

p2 = predict(model2,test_set,type = 'response')

predict2 = ifelse(p2>0.5,1,0)
tab2 = table(predicted= predict2,Actual = test_set$admit)
tab2         #CONFUSION MATRIX

1-sum(diag(tab2))/sum(tab2)

#29% is the misclassification rate.





