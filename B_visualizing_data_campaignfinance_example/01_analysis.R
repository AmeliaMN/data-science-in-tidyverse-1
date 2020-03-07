library(tidyverse)
library(janitor)
library(lubridate)
library(readxl)
options(scipen = 999)


# REPUBLICANS ####
#point to the files from the relevant reporting period directory you're interested in

rnc <- read_excel("feb2020reports/rnc.xlsx")
nrcc <- read_excel("feb2020reports/nrcc.xlsx")

gop_combined <- rbind(rnc, nrcc)

gop_combined %>% 
  count(flag_orgind)

# gop_combined$date <- ymd(gop_combined$date)
gop_combined$month <- month(gop_combined$date)

gop_combined %>% 
  select(date) %>% 
  arrange(date)

gop_combined %>% 
  count(month)

# gop_combined %>% 
#   filter(month == 1)


#individual contribs top zips
topzips_gop <- gop_combined %>% 
  filter(flag_orgind == "IND") %>% 
  group_by(zip) %>% 
  summarise(sumtotal = sum(amount)) %>% 
  arrange(desc(sumtotal))

head(topzips_gop, 10)



# DEMOCRATS ####
#point to the files from the relevant reporting period directory you're interested in

dnc <- read_excel("feb2020reports/dnc.xlsx")

dccc <- read_excel("feb2020reports/dccc.xlsx", 
                   col_types = c("text", "text", "text", 
                                "text", "text", "text", "text", "text", 
                                "text", "text", "text", "text", "text", 
                                "text", "text", "text", "date", "numeric", 
                                "numeric", "text", "text", "numeric", 
                                "text", "numeric"))


dem_combined <- rbind(dnc, dccc)

dem_combined %>% 
  count(flag_orgind)

# dem_combined$date <- ymd(dem_combined$date)
dem_combined$month <- month(dem_combined$date)

dem_combined %>% 
  select(date) %>% 
  arrange(date)

dem_combined %>% 
  count(month)

# dem_combined %>% 
#   filter(month == 1)

#individual contribs top zips
topzips_dem <- dem_combined %>% 
  filter(flag_orgind == "IND") %>% 
  group_by(zip) %>% 
  summarise(sumtotal = sum(amount)) %>% 
  arrange(desc(sumtotal))

head(topzips_dem, 10)

#write to file
write_csv(topzips_gop, "topzips_gop.csv")
write_csv(topzips_dem, "topzips_dem.csv")


### compare D and R in each zip ####

colnames(topzips_dem) <- c("zip_code", "demtotal")
colnames(topzips_gop) <- c("zip_code", "goptotal")

#join
zipcompare <- full_join(topzips_dem, topzips_gop)

#change nas to 0
zipcompare <- zipcompare %>% 
  replace(., is.na(.), 0)

#party with more
zipcompare <- zipcompare %>% 
  mutate(
    winner = ifelse(demtotal>goptotal, "D", "R"),
    advantage = abs(demtotal-goptotal)  
  )


### bring in the zipcode data table for adding names to zips 
zip_codes_lookup <- read_csv("zip-codes-database-STANDARD.csv")

zip_codes_lookup <- zip_codes_lookup %>% 
  clean_names

zip_codes_lookup <- zip_codes_lookup %>% 
  mutate(
    city = str_to_title(city),
    name = paste0(city, ", ", state),
    zipname = paste0(zip_code, " (", name, ")")
  ) %>% 
  select(zip_code, city, state, zipname)

#remove dups
zip_codes_lookup <- zip_codes_lookup %>% 
  distinct(zip_code, city, state, zipname)


#join to our table
zipcompare <- left_join(zipcompare, zip_codes_lookup)

#save table as rds for later use
saveRDS(zipcompare, "zipcompare.rds")
