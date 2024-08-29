library(readr)
library(yaml)
library(npreg)

install.packages("npreg")

config <- read_yaml("configuracao.yaml")

source("scripts/treinamento")