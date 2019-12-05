# -*- coding: utf-8 -*-
"""
Created on Tue Jan  8 10:29:26 2019
Script to count number of files and subfolders in a given folder
schedule a daily job
@author: PShirbhate
"""
#import the required classes
import os, os.path

#ask user to enter the path of the directory where files are located
#dir = input("Enter the path of the directory: ")
dir = r"D:\\Users\\PShirbhate\\Downloads\\imp_scripts"
#ask user to enter the path of the directory to store the output results
#in this case the path is set up as default
output_dir = r"D:\Users\PShirbhate\Downloads\imp_scripts\output_file_count"

#change the working directoty to output_dir
os.chdir(output_dir)

#create a output result file and append the file name with timestamp
import datetime
format = '%Y-%m-%d-%H-%M-%S'
dt = str(datetime.datetime.now().strftime(format))
filename = 'result_1_'+dt+'.txt'
f= open(filename,"w+")
#printing the number of files including subfolders
list = os.listdir(dir) # dir is your directory path
number_files = len(list)
f.write("Total Number of files including subfolders are {0}".format(number_files))
f.close()

# This python script can be scheduled to run using Windows Task Scheduler
# Identify where python is installed
# D:\Users\PShirbhate\AppData\Local\Continuum\anaconda3\python.exe
# Mention the .py file path in the argument


#printing the number of files excluding subfolders
filename = 'result_2_'+dt+'.txt'
f= open(filename,"w+")
onlyfiles = next(os.walk(dir))[2] #dir is your directory path as string
f.write("Total Number of files excluding subfolders are {0}".format(len(onlyfiles)))
f.close()

#Additional work- get the count of files wrt file type

import fnmatch
num_files = len(fnmatch.filter(os.listdir(dir),'*.r'))
print(num_files)



