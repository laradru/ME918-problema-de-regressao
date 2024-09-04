
treinamento <- function(filename, tipo, y, X, npr_metodo = "GCV" ){
  dados <- read_csv(paste("entradas/",filename , sep = ""))
  
  if(tipo == "linear"){
    formula <- paste(y,"~", X[1])
    
    for (i in 2:length(X)){
      formula <- paste(formula,"+",X[i])
    }
    formula <- as.formula(formula)
    
    modelo_lm <- lm(formula,dados)
    
    return (modelo_lm)
  }
  if (tipo == "ss"){
    modelo_ss <- ss(x = dados[,X], y = dados[,y], method = npr_metodo)
    
    return(modelo_ss)
  }
}

teste <- treinamento("iris.csv","linear","Sepal.Width", c("Petal.Width", "Petal.Length"))

#as.matrix(dados[,c("Petal.Width", "Petal.Length")]
#ss(x = as.matrix(dados[,c("Petal.Width", "Petal.Length")]), y = dados[,"Sepal.Length"], method = npr_metodo)

  