#Lab 4

#Check the data dimension, and find the summary statistics. 
dim(iris)
summary(iris)

#Split the data into a training set and a test set. 
smp_size=floor(0.90 * nrow(iris))
smp_size
index=sample(seq_len(nrow(iris)), size=smp_size)
train=iris[index,]
dim(train)
test=iris[-index,]
dim(test)

#Perform KNN on the training data, with several values of K. 
install.packages("class")
library("class")

knn_pred1=knn(train[,1:4], test[,1:4], train[, 5], k = i)
knn_pred1


mean1=0
mean=mean(knn_pred1==test[, 5])
mean


mean1=0
for(i in 1:10){
  knn_pred1=knn(train[,1:4], test[,1:4], train[, 5], k = i)
  mean1[i]=mean(knn_pred1==test[, 5])}
mean1
plot(mean1, xlab="Number of neighbors (K)", ylab="Classification Accuracy")
lines(mean1)

iris
  