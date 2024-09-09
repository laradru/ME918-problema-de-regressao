getPredicao <- function() {
  
  leitura <- fromJSON("entradas/preditores.json",
                      simplifyDataFrame = FALSE)
  resultado <- list()
  
  for(i in 1:length(leitura$modelos)) {
    nome_modelo <- leitura$modelos[[i]][[1]]
    modelo <- readRDS(paste("saidas/.data/", nome_modelo, ".rds", sep = ""))
    predicao = c()
    
    for(j in 1:length(leitura$modelos[[i]][[2]])) {
      df <- data.frame(leitura$modelos[[i]][[2]][j])
      
      if(class(modelo)[1] != "lm") {
        df <- as.matrix(df)
      }
      
      if("ss" %in% class(modelo)) {
        predicao <- c(predicao, predict(modelo, df)[, 2])
      } else {
        predicao <- c(predicao, predict(modelo, df))
      }
      
    }
    
    resultado[[i]] <- list(modelo = nome_modelo, 
                           valores_preditos = predicao
    )
    
    write(toJSON(list(modelo = nome_modelo, valores_preditos = predicao)),
          file = paste("saidas/.data/predicao_", nome_modelo, ".json", sep=""))
    
  }
  
  return(resultado)
}
