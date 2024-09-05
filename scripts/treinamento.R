
treinamento <- function(filename, tipo, y, X, npr_metodo = "GCV" ) {
  
  dados <- read_csv(paste("entradas/",filename , sep = ""))
  
  if(tipo == "linear"){
    formula <- paste(y,"~", X[1])
    
    if(length(X) > 1) {
      for (i in 2:length(X)){
        formula <- paste(formula,"+",X[i])
      }
    }
    
    formula <- as.formula(formula)
    
    modelo_lm <- lm(formula,dados)
    
    return (modelo_lm)
  }
  if (tipo == "np"){
    modelo_np <- ss(x = as.matrix(dados[,X]), y = as.matrix(dados[,y]), method = npr_metodo)
    
    return(modelo_np)
  }
  if(tipo == "lasso") {
    cv_model <- cv.glmnet(as.matrix(dados[,X]), as.matrix(dados[, y]), alpha = 1)
    modelo_lasso <- glmnet(as.matrix(dados[,X]), as.matrix(dados[, y]), alpha = 1, lambda = cv_model$lambda.min)
    return(modelo_lasso)
  }
}
  