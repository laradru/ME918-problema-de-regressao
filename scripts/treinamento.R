
treinamento <- function(filename, tipo, y, X, npr_metodo = "GCV" ) {

  dados <- read_csv(paste("entradas/",filename , sep = ""))
  
  for (col_name in names(dados[,X])) {
    if (class(as.data.frame(dados)[,col_name]) != "numeric") {
      stop("Coluna ", col_name," contém uma variável não numérica")
    }
  }
  
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
    if (length(X) > 1){
      stop("Mais do que uma variável preditora em uma regressão não paramétrica")
    }
    
    modelo_np <- ss(x = as.matrix(dados[,X]), y = as.matrix(dados[,y]), method = npr_metodo)
    
    return(modelo_np)
  }
  if(tipo == "lasso") {
    cv_model <- cv.glmnet(as.matrix(dados[,X]), as.matrix(dados[, y]), alpha = 1)
    modelo_lasso <- glmnet(as.matrix(dados[,X]), as.matrix(dados[, y]), alpha = 1, lambda = cv_model$lambda.min)
    return(modelo_lasso)
  }
}
  