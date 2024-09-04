getPredicao <- function() {
  leitura <- fromJSON("entradas/preditores.json",
                      simplifyDataFrame = FALSE)
  resultado <- list()
  for(i in 1:length(leitura$modelos)) {
    modelo <- readRDS(paste("saidas/", leitura$modelos[[i]][[1]], ".rds", sep = ""))
    
    predicao = c()
    for(j in 1:length(leitura$modelos[[i]][[2]])) {
      df <- data.frame(leitura$modelos[[i]][[2]][j])
      
      if(class(modelo)[1] != "lm") {
        df <- as.matrix(df)
      }
                   
      predicao <- c(predicao,
                    ifelse(class(modelo) == "ss",
                           predict(modelo, df)[, 2],
                           predict(modelo, df)
                    )
      )
    }
    
    
    resultado[[i]] <- list(modelo = leitura$modelos[[i]][[1]], 
                           valores_preditos = predicao
    )
    
    write(toJSON(
      list(modelo = leitura$modelos[[i]][[1]], 
           valores_preditos = predicao
    )),
    file = paste("saidas/", leitura$modelos[[i]][[1]], ".json", sep=""))
    
  }
  
  return(resultado)
}
