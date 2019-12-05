a <- c(1,2,3,4,5)
b <- c(2,3,5,6,1)
c <- c(3,5,5,5,10)
d <- c(10,20,30,40,50)
e <- c(7,8,9,4,6)

#create matrix from vectors
M <- cbind(a,b,c,d,e)

N <- data.frame(M)

var(a)
sd(a)

f <- c(10,20,30,15,10,30)
var(f)
sd(f)
mean(f)
median(f)


# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Create the vector with numbers.
v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
uniqv <- unique(v)
tabulate(match(v, uniqv))
match(v, uniqv)
which.max(tabulate(match(v, uniqv)))
uniqv[which.max(tabulate(match(v, uniqv)))]
# Calculate the mode using the user function.
result <- getmode(v)
print(result)



library(ggplot2)

hist(v)

ggplot() + aes(v)+ geom_histogram(binwidth=1, colour="white", fill="skyblue")

var(M)
cov(M)
corrcoef(M)

eigen(M)

cov2cor(cov(M))
