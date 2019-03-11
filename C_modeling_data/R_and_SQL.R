library(DBI)
library(dbplyr)
library(tidyverse)

# Connect to the database

source("Connect_to_db.R")

# Check for existing tables

dbListTables(con)

# Load a table to server

dbWriteTable(con, "schools_data_clean", schools_data_clean)

# Pull data down from the server into an R object with SQL syntax

x <- dbGetQuery(con, "SELECT * FROM schools_data_clean LIMIT 100")

# Do an operation on the server that doesn't result in data

dbSendQuery(con, "CREATE VIEW elementary_schools AS SELECT * FROM schools_data_clean WHERE type = \'ELEMENTARY\'")

dbListTables(con)

# Now let's get into dbplyr
# It lets us use R syntax and it generates (kinda weird) SQL on the back end

# First we connect the tables to an R object

schools <- tbl(con, "schools_data_clean")
school_financials <- tbl(con, "school_financials")

# It will show us the first few rows

schools

# But notice that it doesn't tell us how long - which it would do
# for a local table

# That's because it doesn't actually run the SQL until we tell it to
# It makes things much faster if your data is large

districts <- schools %>% select(name_dist) %>% distinct()

# If we want to check out the crazy sql it's generating I can do this

districts <- schools %>% select(name_dist) %>% distinct() %>% show_query()

# That's not so bad, but it could be this

our_dists <- c("Payson CUSD 1", "Irvington CCSD 11", "Giant City CCSD 130")

district_avg <- schools %>% group_by(name_dist) %>% summarize(avg = mean(pct_white, na.rm = TRUE)) %>% filter(name_dist %in% our_dists)

district_avg <- schools %>% group_by(name_dist) %>% summarize(avg = mean(pct_white, na.rm = TRUE)) %>% filter(name_dist %in% our_dists) %>% show_query()

# Why is there a random "txknvugktc" ?
# dbplyr has generated a nested query
# if you've done that before you may recall that the inner query
# needs a name
# dbplyr has generated a random name that no reasonable person
# would be likely to come up with

# When I'm happy with my analysis, I can pull the data into R

dist_means <- district_avg %>% collect()

# Suppose I want to turn a table I've created in dplyr into a table on the server

# Compute() will do that for me

school_join <- left_join(poor_schools, school_financials, by = c("id" = "rcdts"))

compute(school_join, name = "school_join")

print(dbListTables(con))







