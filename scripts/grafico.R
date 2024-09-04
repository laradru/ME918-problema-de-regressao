grafico <- function(model_name, tipo, x = 0, y = 0) {
  modelo <- readRDS(paste("saidas/", model_name,".rds", sep = ""))
  
  if (tipo == "linear"){
    valores_fit <- modelo$fitted.values
    valores_observados <- modelo$model[, 1]
    valores_preditos <- fromJSON(paste("saidas/",model_name,".json", sep =""))
  }
  
  if (tipo == ""){
    
  }
  
  df <- data.frame(valores_observados, valores_preditos)
  
  ggrafico <- ggplot(df,aes(x = valores_fit, y = valores_observados)) +
    geom_point()+
    geom_vline(xintercept =  valores_preditos[[2]], color = 2)
  
  return(ggrafico)
  
}