install.packages("vctrs")
                 
#find dimension and head
dim(Wine)
head(Wine)

#determine if there are any missing values
which(is.na(Wine))

#Scale dataset for clustering
Wine_Scale <- scale(Wine)
head(Wine_Scale)

install.packages("factoextra")
library("factoextra")

#determine best number of clusters for Kmeans
fviz_nbclust(Wine_Scale, kmeans, method = "gap_stat")

#kmean with k=3
km_w <- kmeans(Wine_Scale, centers = 3, nstart = 1)
km_w
fviz_cluster(km_w, Wine_Scale)

#Perform Agglomerative Hierarchical clustering using Ward's method.
dendrogram = hclust(d=dist(Wine_Scale, method = 'euclidean'), method = 'ward.D')
dendrogram

#plot clustering with borders around clusters
plot(dendrogram, main ="centroid")
rect.hclust(dendrogram, k=3, border = 3)

install.packages("dendextend")
library("dendextend")

#color code clusters
dend1<-as.dendrogram(dendrogram)
dend1_G<- color_branches(dend1, h=50)
plot(dend1_G)