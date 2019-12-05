# -*- coding: utf-8 -*-
"""
Stats understanding through python
Created on Tue Nov 13 11:49:46 2018

@author: PShirbhate
"""
import numpy as np
import random

coin_out = random.choice(("head","tail"))

sample_array = []

for x in range(100):
  randnum = random.randint(1,11)
  sample_array.append(randnum)
  
sample_array = np.random.choice(range(1, 10), size = 100, replace=True)

import matplotlib.pyplot as plt
plt.hist(sample_array, bins = 10, alpha=1, rwidth=1)
plt.show()

from scipy.stats import itemfreq
table = itemfreq(sample_array)

plt.bar(table[:,0],table[:,1])
plt.show()


np.min(sample_array)
np.max(sample_array)
np.mean(sample_array)
np.median(sample_array)

sorted_data = np.sort(sample_array)

np.mode(sample_array)
# mode is not available in numpy
from statistics import mode
mode(sample_array)
# display only one mode, for multiple modes- Error
#StatisticsError: no unique mode; found 2 equally common values

from collections import Counter
data = Counter(sample_array)
data.most_common()   # Returns all unique items and their counts
data.most_common(2) 

from statistics import stdev,variance
stdev(sample_array)
variance(sample_array)

#Standard deviation-how measurements for a group are spread out from mean

x = sample_array
y = np.random.normal(5,2,100)

y = np.random.normal(5,2,100)


# 68.3 %
one_sd_up = np.mean(x)+stdev(x)
one_sd_lw = np.mean(x)-stdev(x)
# 95.4%
two_sd_up = np.mean(x)+2*stdev(x)
two_sd_lw = np.mean(x)-2*stdev(x)
# 99.7%
three_sd_up = np.mean(x)+3*stdev(x)
three_sd_lw = np.mean(x)-3*stdev(x)

import scipy.stats as stats
# stats.norm (Equivalent of R norm generates) random numbers from normal distribution
# norm()
z = stats.norm(5,2)
y = z.rvs(100)
#density function in python and plot it
import seaborn as sns
sns.distplot(y)
#dnorm- probability density function
#probability distribution function pdf- equivalent of dnorm in R
stats.norm.pdf(0)
# pdf of 0 given mean =5 and std 2
stats.norm.pdf(0,loc = 5, scale = 2)

x = sample_array
y = stats.norm.pdf(x,4.6, 2.75681)

plt.plot(x,y)
plt.show()

#cumulative distribution function cdf- area under curve (one side) (Equivalent of pnorm)
x = sample_array
z = stats.norm.cdf(x,4.6, 2.75681)

plt.plot(x,z)
plt.show()

# scipy.stats.norm.ppf() (Equivalent of qnorm)- quantile function- inverse of pnorm
x = sample_array
z = stats.norm.ppf(x,4.6, 2.75681)
plt.plot(x,z)
plt.show()

xseq = np.arange(-4,4, step = .01)
densities = stats.norm.pdf(xseq,1,2)
cumulative = stats.norm.cdf(xseq,1,2)

plt.plot(xseq)
plt.show()

plt.plot(xseq,densities)
plt.show()

plt.plot(xseq,cumulative)
plt.show()

# Play around with mean and sd
# pdf

plt.plot(xseq,stats.norm.pdf(xseq,0,1))
plt.show()

plt.plot(xseq,stats.norm.pdf(xseq,0,2))
plt.show()

plt.plot(xseq,stats.norm.pdf(xseq,1,1))
plt.show()

plt.plot(xseq,stats.norm.pdf(xseq,1,2))
plt.show()

#cdf
plt.plot(xseq,stats.norm.cdf(xseq,0,1))
plt.show()

plt.plot(xseq,stats.norm.cdf(xseq,0,2))
plt.show()

plt.plot(xseq,stats.norm.cdf(xseq,1,1))
plt.show()

plt.plot(xseq,stats.norm.cdf(xseq,1,2))
plt.show()