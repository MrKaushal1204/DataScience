BankCustomer = read.csv("Bank_Data_3_2.csv",stringsAsFactors = FALSE)
str(BankCustomer)
#head(BankCustomer)

#data1 <- data.frame(BankCustomer)
#data1
max(BankCustomer$age)
min(BankCustomer$age)

BankCustomerAgeCategorizaed <- transform(BankCustomer,Generation = ifelse(age<22,"Z",ifelse(age<41,"Y",ifelse(age<52,"X", "Baby Boomers"))))
head(BankCustomerAgeCategorizaed)



# final insight-- baby boomers and gen Z are more likely 
# to have a higher conversion rate and reacted positively 
# in the previous marketing campaign than Gen X and Y, 
# and hence can be the target group for the current 
# marketing campaign

