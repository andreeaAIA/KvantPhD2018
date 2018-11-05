library(haven)
library(sjPlot)


# YOU NEED TO CHANGE THIS TO YOUR OWN WORDKING DIRECTORY AND FILE
data <- read_sav("Datafi_phd_kurs.sav")

### Look at the data ### 

View(data)

#Prints the names of each variable in the dataset
names(data)

#Prints the summary statistics for all the variables in the dataset
summary(data)

#To print the mean,
mean(data$Lese, na.rm=T)




# Running a regressions 
?lm
# lm is used to fit linear models like OLS 

model1 <- lm(Lese ~ DigKomp + as.factor(Kjønn), data = data)

summary(model1)



## Plotting the effect of DigKomp on Lese 

plot_model(model1, type = "pred", terms = "DigKomp")


plot_model(model1, type = "pred", terms = "Kjønn")



### A model with an interaction between gender and month of birth


summary(test <- lm(Lese ~ DigKomp + Kjønn*Mnd , data = data))


# Looking at the interaction
plot_model(test, type = "pred", terms = c("Mnd","Kjønn")) + theme_sjplot() 





