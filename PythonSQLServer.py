# -*- coding: utf-8 -*-
"""
Created on Wed Oct 24 11:41:51 2018

@author: PShirbhate
"""

"""
Useful Information

1)  DNS: IPE1PRDWDB003
    Server: ipe1pr-dwdb-003.ehpr.corp.evolenthealth.com
    Databases: STGAnalytics,PRDAnalytics,EVH_DW
    Default Database: STGAnalytics
2)  DNS: PRDWDB02
    Server: PR-DWDB-02.EHPR.CORP.EVOLENTHEALTH.COM
    Databases: STAGING,PRELOAD,EVH_LOAD,LOGGING,IDA,IDA_RS
    Default Database: STAGING
3)  DNS: IPE1PRDWDB002
    Sever: IPE1ST-DWDB-002.EHPR.CORP.EVOLENTHEALTH.COM
    Databases: STAGING,PRELOAD,EVH_LOAD,LOGGING,IDA,IDA_RS
    Default Database: STAGING
"""
'Import required libraries
'This is the interface between the database driver and Python
import odbc
"""con = odbc.odbc('PRDWDB02/EVOLENTHEALTH\\PShirbhate/9960721599P$')
"""
'Connection with windows authentification
con = odbc.odbc('PRDWDB02')

""" Connection without windows authentification
import pyodbc
con = pyodbc.connect('PRDWDB02')
con = pyodbc.connect('Driver={ODBC Driver 13 for SQL Server};' +
                    'Server={PR-DWDB-02.EHPR.CORP.EVOLENTHEALTH.COM};' +
                    'port= 1433:'+
                    'Database={STAGING};' +
                    'Uid= {PShirbhate};' +
                    'Pwd={9960721599P$};')
"""
import pandas as pd

'List Databases on the server
databases = pd.read_sql_query("SELECT name FROM master.dbo.sysdatabases",con)

'List tables from the required database
tables = pd.read_sql_query("SELECT TABLE_NAME FROM STAGING.INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'",con)

'List the column names from the required table
fields = pd.read_sql_query("SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = N'EXTR_EVHT_WKMD_Viverae_Participation_CONTROL'",con)

'Fetching Data from the required table
' Method 1 
sqlquery = "select * from ActiveMember_LAB;"
df  = pd.read_sql_query(sqlquery, con)

"""Method 2
cursor = con.cursor()
cursor.execute(sqlquery)
for entry in cursor:
    print(entry)
cursor.close()
del cursor
"""
'sqlquery2 = "SELECT TOP (1000) [Member_Dim_Key] FROM [STAGING].[dbo].[ActiveMember_LAB]"
'df1  = pd.read_sql_query(sqlquery2, db)

' Displayig the results
df.head()
df1.head()
'Disconnecting the database
con.close()


