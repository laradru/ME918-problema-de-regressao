grafico <- function(model_name,tipo,x = 0,y = 0){
  modelo <- readRDS(paste("saidas/", model_name,".rds", sep = ""))
  
  if (tipo == "linear"){
    valores_preditos <- modelo$fitted.values
    valores_observados <- modelo$model[,1]
  }
  
  if (tipo == ""){
    
  }
  
  df <- data.frame(valores_observados, valores_preditos)
  
  ggrafico <- ggplot(df,aes(x = valores_preditos, y = valores_observados))+
    geom_point()
  
  return(ggrafico)
  
}