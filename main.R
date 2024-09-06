# Instalações de pacotes registrados no renv.lock
renv::restore()

# Pacotes
library(readr)
library(yaml)
library(npreg)
library(jsonlite)
library(ggplot2)
library(glmnet)
library(renv)

set.seed(123456)

config <- read_yaml("configuracao.yaml")

source("scripts/treinamento.R")

for (i in 1:length(config$modelos)){
  modelo <- treinamento(config$tabela,
                        config$modelos[[i]]$tipo,
                        config$modelos[[i]]$y,
                        config$modelos[[i]]$x
                        )
  saveRDS(modelo, file = paste("saidas/.data/",
                               config$modelos[[i]]$nome_modelo,
                               ".rds",
                               sep = "")
          )

}

source("scripts/predicao.R")

# Escrevendo predições
write(toJSON(getPredicao(), pretty = TRUE), file = "saidas/todas_predicoes.json")

# Definindo funçao gráfico
source("scripts/grafico.R")

# Escrevendo graficos
for (i in 1:length(config$modelos)) {
  grafico <- getGrafico(config$tabela, 
                        config$modelos[[i]]$nome_modelo, 
                        config$modelos[[i]]$tipo, 
                        config$modelos[[i]]$x, 
                        config$modelos[[i]]$y)
  
  if (config$modelos[[i]]$tipo == "linear") {
    ggsave(paste("saidas/grafico_", config$modelos[[i]]$nome_modelo, ".jpeg", sep = ""), 
           plot = grafico$ggrafico)
    ggsave(paste("saidas/qqplot_", config$modelos[[i]]$nome_modelo, ".jpeg", sep = ""), 
           plot = grafico$qqplot)
  } else {
    ggsave(paste("saidas/grafico_", config$modelos[[i]]$nome_modelo, ".jpeg", sep = ""), 
           plot = grafico)
  }
}