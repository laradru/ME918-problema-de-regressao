getPredicao <- function() {
  leitura <- fromJSON("entradas/preditores.json",
                      simplifyDataFrame = FALSE)
  resultado <- list()
  for(i in 1:length(leitura$modelos)) {
    modelo <- readRDS(paste("saidas/", leitura$modelos[[i]][[1]], ".rds", sep = ""))
    
    predicao = c()
    for(j in 1:length(leitura$modelos[[i]][[2]])) {
      df <- data.frame(leitura$modelos[[i]][[2]][j])
      predicao <- c(predicao, predict(modelo, df))
    }
    
    
    resultado[[i]] <- list(modelo = leitura$modelos[[i]][[1]], 
                           valores_preditos = predicao
                           )
  }
  
  return(resultado)
}
