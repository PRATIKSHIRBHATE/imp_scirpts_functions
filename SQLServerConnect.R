
# Useful Information

# 1)  DNS: IPE1PRDWDB003
#     Server: ipe1pr-dwdb-003.ehpr.corp.evolenthealth.com
#     Databases: STGAnalytics,PRDAnalytics,EVH_DW
#     Default Database: STGAnalytics
# 2)  DNS: PRDWDB02
#     Server: PR-DWDB-02.EHPR.CORP.EVOLENTHEALTH.COM
#     Databases: STAGING,PRELOAD,EVH_LOAD,LOGGING,IDA,IDA_RS
#     Default Database: STAGING
# 3)  DNS: IPE1PRDWDB002
#     Sever: IPE1ST-DWDB-002.EHPR.CORP.EVOLENTHEALTH.COM
#     Databases: STAGING,PRELOAD,EVH_LOAD,LOGGING,IDA,IDA_RS
#     Default Database: STAGING


# Import required libraries
# This is the interface between the database driver and R
library(odbc)
#library(rstudioapi)
#library(RODBC)
# Standardizes the functions related to database operations
#library(DBI)

# Connection without windows authentification
# con1 <- dbConnect(odbc::odbc(),
#                Driver = "ODBC Driver 13 for SQL Server",
#               Server = "PR-DWDB-02.EHPR.CORP.EVOLENTHEALTH.COM",
#                Database = "STAGING",
#                UID = "EVOLENTHEALTH\\PShirbhate",
#                PWD = rstudioapi::askForPassword("Database password"),
#                Port = 1433)

# Connection with windows authentification
con <- dbConnect(odbc::odbc(),"IPE1PRDWDB003")

#List Databases on the server
databases <- dbGetQuery(con,"SELECT name FROM master.dbo.sysdatabases")

# List tables from the required database
tables <- dbListTables(con,"STGAnalytics")

# List the column names from the required table
fields <- data.frame(dbListFields(con,"MEG_MEDICAL_CLAIM_FACT"))
# Fetching Daata from the required table
sqlquery <- 'select TOP (200) * from "MEG_MEDICAL_CLAIM_FACT"'
df <- dbGetQuery(con,sqlquery)

# Displaying the results
df_head <- head(df)

sum(is.null(df_head))

str(df)

fun1 <- function(x) { ifelse(x %in% c("     ","NA"), NA, x) }

df_head1 <- data.frame(apply(df_head,2,FUN = fun1))

sum(is.na(df_head1))

# Disconnecting the database
dbDisconnect(con)


