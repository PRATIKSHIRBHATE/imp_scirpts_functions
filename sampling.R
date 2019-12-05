# Sampling Methods in R

# Read sample data

dataset <- read.csv("D:/Users/PShirbhate/Downloads/Learning Resources/Datacamp-Python-Datasets/titanic.csv")

prop.table(table(dataset$Survived))

# Random Sampling
random_sample <- dataset[sample(1:nrow(dataset), 89, replace = FALSE),]
prop.table(table(random_sample$Survived))

# Stratified Sampling
# install.packages("splitstackshape")
library(splitstackshape)

strt_sample_1 <- stratified(dataset,"Survived",0.1)
prop.table(table(strt_sample_1$Survived))

# CLuster Sampling
#less precision - when sample size within clusters same
# probabilities proportional to size of samples
# Ex city-school-class-students

# install.packages("sampling")
library(sampling)
cl <- cluster(dataset,clustername=c("Survived"),size=89,method="srswr")

clust_sample_1 <- getdata(dataset,cl)
