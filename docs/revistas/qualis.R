library(readr)
library(tidyverse)

qualis_plan <-  read_csv("revistas/planejamento_urbano_e_regional.csv")
ciencias_ambientais <- read_csv("revistas/ciencias_ambientais.csv")

qualis <- dplyr::full_join(qualis_ambientais, qualis_plan, by = "ISSN")

qualis_a <-  qualis %>% na.exclude() %>% 
             filter(Estrato_ca %in% c("A1", "A2")) %>% 
              filter(Estrato_plan %in% c("A1", "A2"))


write_csv(qualis_a, "revistas/qualis_A_ciencia_amb_e_plan_urb_reg.csv")
