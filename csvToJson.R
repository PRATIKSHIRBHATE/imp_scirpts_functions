
setwd("D:/Users/PShirbhate/Downloads/Machine_Learning_A-Z-master/Machine_Learning_A-Z-master/Part 2 - Regression/Section 4 - Simple Linear Regression/")
  
dataset = read.csv("Salary_Data.csv")

#install.packages("rjson")

library(rjson)

# convert csv to json
dfjson = toJSON(dataset)

cat(dfjson)

str(dfjson)
# save json object as json file 
write(dfjson, file="sampledata.JSON")

# read .json file and convert it to dataframe
json_data <- fromJSON(file="sampledata.JSON")



# replacing null with NA's
dffromJson <- lapply(json_data, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})

dffromJson1 <- do.call("rbind",json_data)
dffromJson2 <- as.data.frame(dffromJson1)
str(dffromJson2)

dffromJson1 <- do.call("cbind",json_data)
dffromJson2 <- as.data.frame(dffromJson1)
