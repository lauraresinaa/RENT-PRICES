#NAME: Laura Resina
#Student ID: 236bf07b

# Clears the log space and saved datasets #
cat("\f")
rm(list = ls())

#Clears dataset environmen
rm(e)

#MODEL FROM SAMPLE#
model_sample=lm(Rent~Square_Meters+Floodplain, data=Final_Project)
summary(model_sample)

#QUESTION 2#
View(Final_Project)
summary(Final_Project)

#Unit check
#scale River Distance
Final_Project$River_Distance_scaled=Final_Project$River_Distance/1000
#scale  Park Distance
Final_Project$Park_Distance_scaled=Final_Project$Park_Distance/1000

table(Final_Project$Park_Distance_scaled>1)
hist(Final_Project$Park_Distance_scaled, main="Park_Distance", xlab="Park_Distance", xlim=c(0,12), col="darkmagenta",freq=TRUE)
table(Final_Project$Park_Distance_scaled>2)

table(Final_Project$River_Distance_scaled>1)
table(Final_Project$River_Distance_scaled>3)
hist(Final_Project$River_Distance_scaled, main="River_Distance", xlab="River_Distance", xlim=c(0,7), col="darkmagenta",freq=TRUE)


hist(Final_Project$Rent, main="Rent", xlab="Rent", xlim=c(0,150000), col="darkmagenta",freq=TRUE)
table(Final_Project$Rent>110000)


 #removing outliers:
# Removing outliers for Park_Distance (above 2000 m) 
Final_Project <- Final_Project[Final_Project$Park_Distance_scaled <= 2, ]

# Removing outliers for River_Distance (above 3km)
Final_Project <- Final_Project[Final_Project$River_Distance_scaled <= 3, ]

# Removing outliers for Rent (above 110000)
Final_Project <- Final_Project[Final_Project$Rent <= 110000, ]


#QUESTION 3#

#INITIAL MODEL
model1=lm(Rent~ Square_Meters +Floodplain +Year_Built +Living_Room +AC +Time_On_Market +Floor +Dining_Room +Parking +Sale_Month + Sale_Year +Total_Rooms +Building_Elevator +Security_Cameras +Fast_Internet + Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1)


#QUESTION 4#
#the model without what i think it could be dropped#
model1b=lm(Rent~ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1b)

cor(Final_Project$Building_Steel, Final_Project$Building_Concrete)
table (Final_Project$Building_Steel)
table (Final_Project$Building_Concrete)

#test AC
model1_AC=lm(Rent~ Square_Meters +Floodplain +Year_Built +Living_Room +Time_On_Market +Floor +Dining_Room +Parking +Sale_Month + Sale_Year +Total_Rooms +Building_Elevator +Security_Cameras +Fast_Internet + Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1_AC)

#test Neighborhood ID
model1_neigh=lm(Rent~ Neighborhood_ID+ Square_Meters +Floodplain +Year_Built +Living_Room +AC +Time_On_Market +Floor +Dining_Room +Parking +Sale_Month + Sale_Year +Total_Rooms +Building_Elevator +Security_Cameras +Fast_Internet + Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1_neigh)

#test Total Rooms
model1_totrooms=lm(Rent~ Square_Meters +Floodplain +Year_Built +Living_Room +AC +Time_On_Market +Floor +Dining_Room +Parking +Sale_Month + Sale_Year +Building_Elevator +Security_Cameras +Fast_Internet + Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1_totrooms)

#test Time on Market
model1_timeonmarket=lm(Rent~ Square_Meters +Floodplain +Year_Built +Living_Room +AC +Floor +Dining_Room +Parking +Sale_Month + Sale_Year +Total_Rooms +Building_Elevator +Security_Cameras +Fast_Internet + Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1_timeonmarket)

#test One Room
model1_oneroom=lm(Rent~ One_Room + Square_Meters +Floodplain +Year_Built +Living_Room +AC +Time_On_Market +Floor +Dining_Room +Parking +Sale_Month + Sale_Year +Total_Rooms +Building_Elevator +Security_Cameras +Fast_Internet + Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model1_oneroom)


#QUESTION 5#
 #Include the variable of age of the building from Year_Built
Final_Project$Age_Building= Final_Project$Sale_Year - Final_Project$Year_Built

 #Include After-Typhoon variable
Final_Project$After_Typhoon= Final_Project$Sale_Month>6 & Final_Project$Sale_Year>2018

#Test inclusion of One Room
 #checking correlation between One room and Total rooms
cor(Final_Project$One_Room, Final_Project$Total_Rooms)

 #Adding One room in model 1b
model2b=lm(Rent~ One_Room+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model2b)

#Chow Test to compare whether the added variable One_Room significantly improves the model's fit
unrestricted_model= lm(Rent~ One_Room+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
restricted_model= lm(Rent~  Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
anova(restricted_model,unrestricted_model)

#Adding After_Typhoon in model 1b
model2c=lm(Rent~ After_Typhoon+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model2c)

#Chow Test to compare whether the added After-Typhoon significantly improves the model's fit
unrestricted_model_a= lm(Rent~ After_Typhoon+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
restricted_model_a= lm(Rent~  Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
anova(restricted_model_a,unrestricted_model_a)

#Chow Test to compare whether the added After-Typhoon + One_Room significantly improves the model's fit
unrestricted_model_b= lm(Rent~ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
restricted_model_b= lm(Rent~  Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
anova(restricted_model_b,unrestricted_model_b)

#new model
Model2d= lm(Rent~ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(Model2d)
##
#model2d + with Age_Building & Year_Built
model3d=lm(Rent~ Age_Building+ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Year_Built +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model3d) 

 #model2b + only Age_Building 
model4d=lm(Rent~ Age_Building+ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model4d)

#QUESTION 6# 
table(Final_Project$Floodplain)

# Creating a new dataset to include only floodplain apartments
floodplain_apartments <- subset(Final_Project, Floodplain == 1)

# creating the model on the new dataset
#From model4d
model_floodplain_only_4d <- lm(Rent~ Age_Building+ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=floodplain_apartments)
summary(model_floodplain_only_4d)


#QUESTION 7
#check correlation between Neighbourhood and Time on Market
cor(Final_Project$AC, Final_Project$Time_On_Market)
cor(Final_Project$AC, Final_Project$Rent)
cor(Final_Project$Time_On_Market, Final_Project$Rent)
#adding 2 new variables separetely: Time in market and AC 
model4d_timeonmarket=lm(Rent~ Time_On_Market+ Age_Building+ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model4d_timeonmarket)

model4d_ac=lm(Rent~ AC+ Age_Building+ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model4d_ac)

#adding them together
model4d_ac_timemarket=lm(Rent~  AC+ Time_On_Market+ Age_Building+ One_Room+ After_Typhoon+ Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model4d_ac_timemarket)

#based on model 4d
model5d=lm(Rent~ One_Room + Square_Meters +Floodplain +Living_Room + Age_Building +Time_On_Market +Floor +Dining_Room +Parking +Sale_Month + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet +Building_Steel +Building_Concrete +Station_Minutes +River_Distance_scaled +Park_Distance_scaled, data=Final_Project)
summary(model5d)



#QUESTION 8#
#plotting
hist(Final_Project$Age_Building, main="Age_Building", xlab="Age_Building", xlim=c(0,130), col="darkmagenta",freq=TRUE)
hist(Final_Project$Square_Meters, main="Square_Meters", xlab="Square_Meters", xlim=c(15,100), col="darkmagenta",freq=TRUE)
hist(Final_Project$Station_Minutes, main="Station_Minutes", xlab="Station_Minutes", xlim=c(0,100), col="darkmagenta",freq=TRUE)
hist(Final_Project$River_Distance_scaled, main="River_Distance_scaled", xlab="River_Distance_scaled", xlim=c(0,4), col="darkmagenta",freq=TRUE)
hist(Final_Project$Park_Distance_scaled, main="Park_Distance_scaled", xlab="Park_Distance_scaled", xlim=c(0,3), col="darkmagenta",freq=TRUE)

# Create scatter plot for River_Distance_scaled vs. Rent
library(ggplot2)
ggplot(Final_Project, aes(x = River_Distance_scaled, y = Rent)) +
  geom_point() +
  labs(x = "River Distance Scaled", y = "Rent") +
  ggtitle("Scatter Plot of River Distance Scaled vs. Rent")

#Change functional forms
#Age_Building
Final_Project$Age_Building_sq= (Final_Project$Age_Building^2)

#Square Meters
Final_Project$log_Square_Meters= log(Final_Project$Square_Meters)

#River Distance
Final_Project$log_River_Distance_scaled= log(Final_Project$River_Distance_scaled)

#Park Distance
Final_Project$log_Park_Distance_scaled= log(Final_Project$Park_Distance_scaled)

#new model
model4d_with_functionalforms=lm(Rent~ Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled, data=Final_Project)
summary(model4d_with_functionalforms)

#CREATION OF INTERACTION TERMS 
Final_Project$Aftertyphoon_floodplain=(Final_Project$After_Typhoon*Final_Project$Floodplain)



#Check the sample of houses sampled in 2018 differ in terms of their characteristics than houses sampled in 2017. 
#2016#
houses_2016 <- Final_Project[Final_Project$Sale_Year == 2016, ]
avg_age_2016 = mean(Final_Project$Age_Building)
avg_land_size_2016 <- mean(Final_Project$Floodplain)

print(avg_age_2016)
print(avg_land_size_2016)
#2018#
houses_2018 <- Final_Project[Final_Project$Sale_Year == 2018, ]
avg_age_2018 <- mean(Final_Project$Age_Building)
avg_land_size_2018 <- mean(Final_Project$Floodplain)

print(avg_age_2018)
print(avg_land_size_2018)

#New model with funt.form + interaction term
model5=lm(Rent~ Aftertyphoon_floodplain + Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled, data=Final_Project)
summary(model5)

#QUESTION 9#
model5= lm(Rent~ Aftertyphoon_floodplain + Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking + Sale_Year  +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled, data=Final_Project)
summary(model5)
car::vif(model5)

#check collinearity
cor_matrix <- cor(Final_Project[, c("Year_Built", "Living_Room", "AC", "Time_On_Market", "Floor", "Dining_Room", "Parking", "Sale_Year", "One_Room", "Total_Rooms", "Building_Elevator", "Security_Cameras", "Fast_Internet", "Building_Steel", "Building_Concrete", "Station_Minutes", "River_Distance", "Park_Distance")])

print(cor_matrix)

cor(Final_Project$Building_Concrete,Final_Project$Building_Steel)

cor(Final_Project$After_Typhoon,Final_Project$Sale_Year)
#model correction for Sale Year (removed)
model5_test= lm(Rent~ Aftertyphoon_floodplain + Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking   +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled, data=Final_Project)
summary(model5_test)

#QUESTION 10#

Final_Project= data.frame(Final_Project, Rent_hat=fitted(model5_test), e=residuals(model5_test))

plot(Final_Project$Rent_hat,Final_Project$e)
abline(a=NULL, b=NULL, h=0, v=NULL)
                           

Final_Project$e_sq = Final_Project$e^2
Final_Project$Rent_hat_sq = Final_Project$Rent_hat^2

White_test = lm(e_sq ~ Rent_hat + Rent_hat_sq, data=Final_Project)
summary(White_test)

#Durbin Watson
library("car")
durbinWatsonTest(model5_test)

 #fix heteroskedasticity: het.corrected SE
library("sandwich")
library("lmtest")

vcov=vcov(model5_test,type="HC0")
coeftest(model5_test,vcov)

#QUESTION 11 #

Final_Project$city_factor=factor(Final_Project$Neighborhood_ID)
model_city = lm(Rent~  Aftertyphoon_floodplain + Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking   +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled +city_factor , data = Final_Project)
summary(model_city)


#Question 13#
Final_Project$log_Rent=log(Final_Project$Rent)
log_model5_test= lm(log_Rent~ Aftertyphoon_floodplain + Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking   +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled, data=Final_Project)
summary(model5_test)

#fix heteroskedasticity: het.corrected SE
library("sandwich")
library("lmtest")

vcov=vcov(model5,type="HC0")
coeftest(model5,vcov)


#QUESTION 15#
Final_model= lm(Rent~ Aftertyphoon_floodplain + Age_Building+ One_Room+ After_Typhoon+ log_Square_Meters +Floodplain +Living_Room +Floor +Dining_Room +Parking   +Building_Elevator +Security_Cameras +Fast_Internet+Building_Steel+ Building_Concrete +Station_Minutes +log_River_Distance_scaled +log_Park_Distance_scaled, data=Final_Project)
summary(Final_model)


