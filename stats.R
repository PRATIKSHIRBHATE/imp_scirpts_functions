# Stats understanding through R coding
# Probability:
coin_out <- sample(c("head","tail"),3, replace = TRUE)


sample_array <- sample(1:10,1000,replace = TRUE)

hist(sample_array, breaks = 10)

barplot(table(sample_array))

min(sample_array)
max(sample_array)
mean(sample_array)

median(sample_array)

sorted_data <- sort(sample_array)
mode(sample_array)
#R does not have a standard in-built function to calculate mode

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

Mode(sample_array)
Modes(sample_array)

sd(sorted_data)

var(sorted_data)

#Standard deviation-how measurements for a group are spread out from mean

# 68.3 %
one_sd_up <- mean(x)+sd(x)
one_sd_lw <- mean(x)-sd(x)
# 95.4%
two_sd_up <- mean(x)+2*sd(x)
two_sd_lw <- mean(x)-2*sd(x)
# 99.7%
three_sd_up <-mean(x)+3*sd(x)
three_sd_lw <- mean(x)-3*sd(x)

# R norm generates random numbers from normal distribution
z <- rnorm(10, mean=5,sd =2)
plot(density(z))

x <- sample_array
y <- dnorm(x, mean=4.6, sd=2.75681)
plot(x, y, type="l", lwd=1)

plot(density(x))

#dnorm- probability density function
#pnorm- cumulative distribution function- area under curve (one side)
pnorm(sample_array, lower.tail = TRUE) #left side#
pnorm(sample_array, lower.tail = FALSE) #left side#
#qnorm- quantile function- inverse of pnorm

xseq<-seq(-4,4,.01)
densities<-dnorm(xseq, 1,2)
cumulative<-pnorm(xseq, 0, 1)

plot(xseq)
plot(xseq, densities)
plot(xseq, cumulative)

# Play around with mean and sd

plot(seq(-4,4,.01),dnorm(xseq,0,1),type="l", lwd=1)
plot(seq(-4,4,.01),dnorm(xseq,0,2),type="l", lwd=1)
plot(seq(-4,4,.01),dnorm(xseq,1,1),type="l", lwd=1)
plot(seq(-4,4,.01),dnorm(xseq,1,2),type="l", lwd=1)

plot(seq(-4,4,.01),pnorm(a,0,1),type="l", lwd=1)
plot(seq(-4,4,.01),pnorm(a,0,2),type="l", lwd=1)
plot(seq(-4,4,.01),pnorm(a,1,1),type="l", lwd=1)
plot(seq(-4,4,.01),pnorm(a,1,2),type="l", lwd=1)

# Skewness and Kurtosis
# skewness is a measure of symmetry
# negative skewness-mean of the data values is less than the median
# positive skewness-mean of the data values is greater than the median
# Pearson's Coefficient of Skewness- using mode and median
# (mean-mode)/sd 3*(mean-median)/sd
# Magnitude of skewness defines how distribution differs from a normal distribution

library(e1071)
skewness(sample_array)
mean(sample_array)
median(sample_array)

skewness(xseq)
mean(xseq)
median(xseq)

# Kurtosis
# kurtosis describes the tail shape of the data distribution
# normal distribution-zero kurtosis-the standard tail shape
# Negative kurtosis - thin tailed data distribution
# Positive kurtosis - flat tailed distribution
kurtosis(sample_array)
kurtosis(xseq)
# kurt = (((x-u)^4)/n)/(((x-u)^2)^2)/n^2

# Probability Distributions
# Bernoulli Distribution- Two possible outcomes (0/1)
#install.packages("Rlab")
library(Rlab)
z_bern <- rbern(10, 0.5)

d_bern <- dbern(xseq, 0.5)
plot(xseq, d_bern,type="l", lwd=1)
p_bern <- pbern(xseq,0.5)
plot(xseq, p_bern,type="l", lwd=1)

# Uniform Distribution
# probabilities of getting these outcomes are equally likely 
# ex- Rolling Dice, selecting number from 1-9

z_unif <- runif(10, min = 1, max = 10)

d_unif <- dunif(xseq, min = 1, max = 10)
plot(xseq, d_unif,type="l", lwd=1)
p_unif <- punif(xseq, min = 1, max = 10)
plot(xseq, p_unif,type="l", lwd=1)


# Binomial Distribution
# Same as Burn Distribution
# Two possible outcomes
# p(success) = p(failure)- Always
# Multiple trails are allowed

z_binom <- rbinom(5,size =10, prob = 0.5)

d_binom <- dbinom(xseq,size =10, prob = 0.5, log = FALSE)
p_binom <- pbinom(xseq,size =10, prob = 0.5, lower.tail = TRUE, log.p = FALSE)

plot(xseq, d_binom,type="l", lwd=1)

plot(xseq, p_binom,type="l", lwd=1)

# Normal Distribution
z_norm <- rnorm(10, mean=5,sd =2)
plot(density(z_norm))

d_norm <-dnorm(xseq, 1,2)
p_norm <-pnorm(xseq, 0, 1)

plot(xseq, d_norm,type="l", lwd=1)
plot(xseq, p_norm,type="l", lwd=1)
# Poisson Distribution
# probability- number of times an event occurs in an interval of time
# Ex-The number of patients arriving in an emergency room between 10 and 11 pm
#rpois(n, lambda)

z_pois <- rpois(10, lambda = 2)

d_pois <- dpois(xseq, lambda = 2)
plot(xseq, d_pois,type="l", lwd=1)
p_pois <- ppois(xseq, lambda = 2)
plot(xseq, p_pois,type="l", lwd=1)


# Exponential Distribution
# Exponential distribution is widely used for survival analysis.
# From the expected life of a machine to the expected life of a human.
z_exp <- rexp(10, rate = 2)

d_exp <- dexp(xseq, rate = 2)
plot(xseq, d_exp,type="l", lwd=1)
p_exp <- pexp(xseq, rate = 2)
plot(xseq, p_exp,type="l", lwd=1)


