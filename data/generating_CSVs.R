library(ratdat)
library(tidyverse)

complete <- left_join(left_join(surveys, species), plots) %>%
  mutate(across(where(is.factor), as.character))

set.seed(100)

# generating CSVs ---------------------------------------------------------

complete_old <- complete %>%
  filter(year < 1990)

species_new <- species %>%
  mutate(species_name = paste(genus, species)) %>%
  select(species_id, species_name, taxa)

plots_new <- plots %>%
  pivot_wider(names_from = plot_id, values_from = plot_type, names_prefix = "Plot ")

surveys_new <- surveys %>%
  filter(year >= 1990)

surveys_new <- surveys_new %>%
  slice_sample(n = 5) %>%
  bind_rows(surveys_new) %>%
  arrange(record_id)

bad_dates <- surveys_new %>%
  filter(month %in% c(4,9), day == 30) %>%
  slice_sample(n = 6) %>%
  mutate(day = day+1)

surveys_new <- surveys_new %>%
  filter(!(record_id %in% bad_dates$record_id)) %>%
  bind_rows(bad_dates) %>%
  arrange(record_id)


surveys_new$hindfoot_length[18] <- paste0(surveys_new$hindfoot_length[18], "'")

surveys_new <- surveys_new %>%
  mutate(weight = if_else(is.na(weight), 9999L, weight))

surveys_new <- surveys_new %>%
  mutate(`date (mm/dd/yyyy)` = paste(month, day, year, sep = "/")) %>%
  relocate(`date (mm/dd/yyyy)`, .after = record_id) %>%
  select(-year, -month, -day)

write_csv(complete_old, "episodes/data/cleaned/surveys_complete_77_89.csv")
write_csv(surveys_new, "episodes/data/raw/surveys_new.csv")
write_csv(plots_new, "episodes/data/raw/plots_new.csv")
write.table(species_new, "episodes/data/raw/species_new.txt", row.names = F)


# solutions ---------------------------------------------------------------


plots_new <- read_csv("episodes/data/raw/plots_new.csv")
species_new <- read_delim("episodes/data/raw/species_new.txt", delim = " ")

surveys_new <- read_csv("episodes/data/raw/surveys_new.csv")

summary(surveys_new)

problems(surveys_new)

surveys_new %>%
  print(n=20)

surveys_new %>%
  mutate(weight = if_else(weight == 9999, NA_real_, weight))

surveys_new %>%
  mutate(weight = na_if(weight, 9999))

plots_new %>%
  pivot_longer(cols = everything(), names_to = "plot_id", values_to = "plot_type") %>%
  mutate(plot_id = str_remove(plot_id, "Plot "),
         plot_id = as.integer(plot_id))

species_new %>%
  separate(species_name, into = c("genus", "species"), sep = " ")
