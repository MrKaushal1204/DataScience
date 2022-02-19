#Apriori Algoritm

#Import the data(Weekly transactional data of a store)

#dataset = read.csv('Market_Basket_Analysis.csv')
dataset = read.csv('Market_Basket_Analysis.csv',header = FALSE)

#head(dataset)
str(dataset)

#Installing the arules package

#install.packages('arules')
library(arules)
dataset = read.transactions('Market_Basket_Analysis.csv',sep = ',',rm.duplicates = TRUE)
summary(dataset)


itemFrequencyPlot(dataset,topN=10)

itemFrequencyPlot(dataset,topN=100)     



#Training Apriori model on the sparse matrix

-------------------#TRAINING THE APRIORI MODEL-----------------------------------#
  rules = apriori(data= dataset,parameter = list(support=0.003,confidence=0.8))
#?apriori

#3*7/7500

#In the output we see minlen=1 so the rules contain 1 item in the basket,and we find rules=0
#so no rules have been set,due to a high confidence of 0.8 which implies that these rules should 
#be applicable to 80% of the transactions,which is highly unreal.so we try decreasing the conf 
#parameter by dividing the value by 2

rules = apriori(data= dataset,parameter = list(support=0.003,confidence=0.4))
#rules = apriori(data= dataset,parameter = list(support=0.003,confidence=0.8))
#rules = apriori(data= dataset,parameter = list(support=0.003,confidence=0.8))
rules = apriori(data= dataset,parameter = list(support=0.003,confidence=0.2))

#Now we find 281 rules created,and its time to explore them.

#Visualising the rules

#STEP 1,2 and 3 are already created satisfying the conditions.the apriori algo takes care of it.
#step 4 tells to sort rules by decreasing lift,lift is the main criteria to measure the 
#relevence of a rule

inspect(sort(rules,by ='lift')[1:10])  ###We get the first 10 rules with the highest lift.


















