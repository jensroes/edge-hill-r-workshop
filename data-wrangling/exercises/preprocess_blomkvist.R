library(tidyverse)
library(readxl) # read in excel files
library(janitor) # clean names

# Basic preprocessing (wide format)
data <- read_xlsx("data/samlet.xlsx") %>%
  clean_names() %>%
  mutate(across(smoking_y_1_n_2_former_smoker_3, str_trim),
         sex = recode(sex_m_1, `1` = "male",
                               `2` = "female"),
         smoker = recode(smoking_y_1_n_2_former_smoker_3,
                         `1` = "yes",
                         `2` = "no",
                         `0` = NA_character_,
                         `3` = "former"),
         # Recode "medicine"
         meds_cat = case_when(medicin_n == 0 ~ "none",
                              medicin_n <= 2 ~ "little",
                              medicin_n <= 4 ~ "few",
                              TRUE ~ "a lot")) %>%
  drop_na(medicin_n) %>%
  select(id, sex, age, medicine = medicin_n, meds_cat, smoker, rt_hand_d = rth_d, rt_hand_nd = rth_nd,
         rt_foot_d = rtf_d, rt_foot_nd = rtf_nd)

write_csv(data, "data/blomkvist.csv")
