# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd
import numpy as np

dataset = pd.read_sas("//grid/sasdev/truven/sasdata/2/claims.sas7bdat")

dataset1 = pd.read_sas("C:/Users/PShirbhate/Downloads/HVC/chronic.sas7bdat")

for columns in list(dataset1):
    if dataset1[columns].dtype.kind == 'O':
        dataset1[columns]= dataset1[columns].str.decode("utf-8")
    else:
        dataset1[columns]=dataset1[columns]
