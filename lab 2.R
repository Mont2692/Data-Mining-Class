# Find dimentsion and head of dataset "airquality"
dim(airquality)
head(airquality)

#Find summary of airqulity
sum(is.na(airquality))

#Determine if dataset has any missing values
is.na(airquality)
which(is.na(airquality))

#Find the percentage and the pattern graph of the missing values
p=function(airquality){sum(is.na(airquality))/length(airquality)*100}
apply(airquality,2,p)
install.packages(c("VIM"))
library(VIM) 
aggr (airquality, col=c('navyblue','yellow'), 
     numbers=TRUE, sortVars=TRUE, 
     labels=names(airquality), cex.axis=.7,
     gap=3, ylab=c("missing data", "pattern"))

#remove fields with missing values and put them into a new dataset
missingdata=airquality[!complete.cases(airquality),]
gooddata=airquality[complete.cases(airquality),]

#practice filling in missing values with both mean and median
Airquality$ozone[is.na(airquality$ozone)]<- mean(airquality$ozone.na.rm=TRUE)
Airquality$ozone[is.na(airquality$ozone)]<- median(airquality$ozone.na.rm=TRUE)

#Graph scatterplot of Ozone vs Temp
plot(gooddata$ozone, gooddata$temperature)