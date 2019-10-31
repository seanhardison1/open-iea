library(ecodata)
library(tidyverse)

d <- ls("package:ecodata")
d <- d[!d %in% c("geom_gls","epu_sf","theme_map","theme_ts","theme_facet",
            "seasonal_oisst_anom_gridded","species_groupings","new_england",
            "eng_rel","hp_density","ne_inshore_survey_species",
            "nefsc_survey_disaggregated", "stock_status")]

all <- NULL
for (i in d){
  df <- eval(parse(text = paste0("ecodata::",i)))
  assign('all', rbind(all,df))
  print(i)
}

vars <- all %>% filter(EPU %in% c("GOM","GB")) %>%
  pull(Var)
length(unique(vars))
