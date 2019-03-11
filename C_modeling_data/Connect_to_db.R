# install.packages("RPostgres")

library(dbplyr)
library(RPostgres)
library(DBI)

# devtools::install_github("rstats-db/odbc")

con <- DBI::dbConnect(RPostgres::Postgres(), host="ec2-54-83-12-22.compute-1.amazonaws.com", 
                 port="5432",
                 dbname="d8gs69rv5lm1nl", 
                 user='avlyznyhemltxn', 
                 password="s_XPVEKvuwFK4RUgXeqxMSkk9z")

dbListTables(con)
