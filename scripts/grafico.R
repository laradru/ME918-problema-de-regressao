getGrafico <- function(dados_nome,modelo_nome, tipo, X = 0, y = 0) {
  
  dados <- read_csv(paste("entradas/",dados_nome , sep = ""))
  
  modelo <- readRDS(paste("saidas/.data/", modelo_nome,".rds", sep = ""))
  valores_preditos <- fromJSON(paste("saidas/.data/predicao_",modelo_nome,".json", sep =""))
  
  if (tipo == "linear"){
    valores_fitados <- modelo$fitted.values
    valores_observados <- modelo$model[, 1]
    residuos_studentizados <- rstudent(modelo)
    qqplot <- ggplot(data.frame(residuos_studentizados), 
                     aes(sample = residuos_studentizados)) +
      stat_qq(col = "blue", size = 2, alpha = 0.6) +
      stat_qq_line(col = "red", size = 1) +
      labs(title = "QQ-Plot", x = "Quantis Teóricos", y = "Quantis Amostrais") +
      theme_bw()
    
  }
  if  (tipo == "lasso"){
    valores_fitados <- predict(modelo,as.matrix(dados[,X]), s = modelo$a0[1])
    valores_observados <- as.matrix(dados[,y])
  }
  if (tipo == "np"){
    valores_fitados <- predict(modelo,as.matrix(dados[,X]))[,2]
    valores_observados <- as.matrix(dados[,y])
  }
  
  df <- data.frame(valores_observados, valores_fitados)
  
  ggrafico <- ggplot(df,aes(x = valores_fitados, y = valores_observados)) +
    geom_point() +
    geom_vline(xintercept =  valores_preditos[[2]], color = 2) +
    labs(title = "Valores ajustados x valores observados",
         x = "Valores ajustados",
         y = "Valores observados") +
    theme_bw()
  
  if (tipo == "linear") {
    return(list(ggrafico = ggrafico, qqplot = qqplot))
  } else {
    return(ggrafico)
  }
}

