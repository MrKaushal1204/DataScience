
BankCustomer<-read.csv("d:/ds/r/rfiles/excels/Bank_Data_3_2.csv")

library(plyr)

#BankCustomer<-rename(BankCustomer,c("CAge" = "age"))
#str(BankCustomer)
#View(BankCustomer)

max(BankCustomer$age)
min(BankCustomer$age)

BankCustomerAgeCategorized <- transform(BankCustomer, Generation = ifelse(age<22,"Z",ifelse(age<41,"Y",ifelse(age<53,"X","Baby Boomers"))))

head(BankCustomerAgeCategorized)

tail(factor(BankCustomer$poutcome))



successPercetageTabel <- table(BankCustomerAgeCategorized$Generation,BankCustomerAgeCategorized$poutcome)

successPercetageTabel

#abc <- matrix(successPercetageTabel,nrow = 4,ncol = 4)
 # SuccessPercentage = abc[,3]/abc[,1]*100
