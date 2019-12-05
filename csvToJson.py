# -*- coding: utf-8 -*-
"""
Created on Wed Oct 24 17:56:07 2018

@author: PShirbhate
"""

import os
os.chdir("D:/Users/PShirbhate/Downloads/Machine_Learning_A-Z-master/Machine_Learning_A-Z-master/Part 2 - Regression/Section 4 - Simple Linear Regression/")

import pandas as pd
dataset = pd.read_csv("Salary_Data.csv")

'convert CSV to JSON'

jsonobj = dataset.to_json(orient='split')
' other values for orient parameter - index, records, table'

'read .json file and convert it to dataframe'

import json

with open('sampledata.json') as json_data:
    d = json.load(json_data)
    print(d)
    
dataset1 = pd.DataFrame(d)

from pandas.io.json import json_normalize
print json_normalize(d)
