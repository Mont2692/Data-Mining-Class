install.packages("MASS")
library("MASS")
install.packages("e1071")
library("e1071")
cats
dim(cats)
summary(cats)

#split data into training and testing sets
smp_sizec=floor(0.80*nrow(cats))
index=sample(seq_len(nrow(cats)), size=smp_size)
traincats=cats[index,]
testcats=cats[-index,]
testcats
traincats

# use Naive classifier
Naive_Modelc=naiveBayes(traincats[,2:3], traincats[,1])
#contingincy table
Predc=predict(Naive_Modelc, testcats[,-1])
Predc
table(Predc, testcats[,1])

#probability contingincy table
Predc=predict(Naive_Modelc, testcats[,-1])
prop.tablec=prop.table(table(Predc, testcats[,1]))
prop.tablec

#overall accuracy
mean(Predc==testcats[,1])
  

# use SVM 
  SVM_Modelc=svm(traincats[,2:3], traincats[,1], kernel = "linear")
SVM_Model1

#svm contingincy table
Predc2=predict(SVM_Modelc, testcats[,-1])
table(Predc2, testcats[,1])

#svm prob contingincy table
prop.tablec2=prop.table(table(Predc2, testcats[,1]))
prop.tablec2

#overall accuracy
mean(Predc2==testcats[,1])


#mosaic plot
plot(prop.tablec2, col=c('red', 'blue'))

#compare kernal functions
SVM_Model1=svm(traincats[,2:3], traincats[,1], kernel = "linear")
SVM_Pred= predict(SVM_Model1, testcats[,-1])
mean(SVM_Pred==testcats[,1])

SVM_Model1=svm(traincats[,2:3], traincats[,1], kernel = "polynomial")
SVM_Pred= predict(SVM_Model1, testcats[,-1])
mean(SVM_Pred==testcats[,1])

SVM_Model1=svm(traincats[,2:3], traincats[,1], kernel = "radial")
SVM_Pred= predict(SVM_Model1, testcats[,-1])
mean(SVM_Pred==testcats[,1])

SVM_Model1=svm(traincats[,2:3], traincats[,1], kernel = "sigmoid")
SVM_Pred= predict(SVM_Model1, testcats[,-1])
mean(SVM_Pred==testcats[,1])

SVM_Model1
