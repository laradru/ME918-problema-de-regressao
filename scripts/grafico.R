getGrafico <- function(dados_nome,modelo_nome, tipo, X = 0, y = 0) {
  
  dados <- read_csv(paste("entradas/",dados_nome , sep = ""))
  
  modelo <- readRDS(paste("saidas/", modelo_nome,".rds", sep = ""))
  valores_preditos <- fromJSON(paste("saidas/",modelo_nome,".json", sep =""))
  
  if (tipo == "linear"){
    valores_fitados <- modelo$fitted.values
    valores_observados <- modelo$model[, 1]
    
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
    geom_point()+
    geom_vline(xintercept =  valores_preditos[[2]], color = 2)
  
  return(ggrafico)
  
}


ggplot(df,aes(x = coisa, y = coisa1)) +
  geom_point()

