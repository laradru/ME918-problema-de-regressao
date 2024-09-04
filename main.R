library(readr)
library(yaml)
library(npreg)
library(jsonlite)
library(ggplot2)
library(glmnet)

config <- read_yaml("configuracao.yaml")

source("scripts/treinamento.r")

for (i in 1:length(config$modelos)){
  modelo <- treinamento(config$tabela,
                        config$modelos[[i]]$tipo,
                        config$modelos[[i]]$y,
                        config$modelos[[i]]$x
                        )
  saveRDS(modelo, file = paste("saidas/",
                               config$modelos[[i]]$nome_modelo,
                               ".rds",
                               sep = "")
          )

}

source("scripts/predicao.r")

# Escrevendo a predicão
write(toJSON(getPredicao()), file = "saidas/predicoes.json") #modificar o script predicao para comportar outros modelos

#definido funcao grafico
source("scripts/grafico.r")

teste <- grafico("modelo_lm", "linear")
teste


#testes

cv_model <- cv.glmnet(as.matrix(data.frame(Sepal.Length = iris$Sepal.Length, Sepal.Width = iris$Sepal.Width)), iris$Petal.Length, alpha = 1)

best_lambda <- cv_model$lambda.min

best_model <- glmnet(as.matrix(data.frame(Sepal.Length = iris$Sepal.Length, Sepal.Width = iris$Sepal.Width)), iris$Petal.Length, alpha = 1, lambda = best_lambda)
predict(best_model,as.matrix(data.frame(Sepal.Length = iris$Sepal.Length, Sepal.Width = iris$Sepal.Width)), s = best_lambda)

coisa <- ss(iris$Sepal.Length,iris$Petal.Width)
coisapred <-predict(coisa,as.matrix(data.frame(Sepal.Length = iris$Sepal.Length)))
