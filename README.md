
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Problema de regressão

<!-- badges: start -->
<!-- badges: end -->

Este produto foi desenvolvido por Enzo Putton Tortelli de Souza, Felipe
Camilo Queiroz, Lara Maria Herrera Drugowick e Rodrigo Caldiron, como
parte das atividades realizadas na disciplina de ME918-2S-2024 (Produto de
Dados) do curso de Estatística da UNICAMP.

# Instruções de uso e funcionamento:

O objetivo deste produto é fornecer ao usuário predições decorrentes da
análise de dados com variáveis quantitativas, utilizando diferentes
modelos de regressão. Antes de utilizar o produto, por favor, garanta
que você tenha os seguintes requisitos em sua máquina:

- Um banco de dados em na extensão .csv ;  
- Software R (versão 4.3.1 ou superior) e R-studio (versão 2024.4.2.764 "Chocolate Cosmos" ou superior)  

### Ambiente de desenvolvimento e avaliação

Os scripts para o treinamento, predição e análise gráfica dos dados
estão disponíveis na pasta “scripts”.

O script “treinamento” contém as funções de regressão do produto. As
regressões utilizadas no treinamento são: Regressão Linear, Regressão
Lasso e Regressão Não-Paramétrica.

treinamento(): é a função principal com os modelos preditivos. Recebe os
seguintes argumentos:  
- filename: banco de dados forncedidos pelo usuário na pasta
“entradas”;  
- tipo: é tipo da regressão escolhida pelo usuário (Linear, Lasso ou
Não-paramétrica);  
- y: variável resposta a ser predita;  
- x: variáveis preditoras;  
- npr_metodo: por default, npr_metodo.  

O script “predição” contém a função getPredicao(), para leitura dos
valores das variáveis preditoras do modelo treinado e geração dos
valores preditos.

<<<<<<< HEAD
O script “gráfico” contém o código para a geração dos gráficos de
dispersão dos dados. Recebe como argumentos:  
- model_name: o nome do modelo do arquivo de configuração;  
- tipo: é tipo da regressão escolhida pelo usuário (Linear, Lasso ou
Não-paramétrica);  
- y: variável resposta (o default é y = 0 na regressão linear)  
- x: variáveis preditoras (o default é x = 0 na regressão linear)

### Requisitos de entrada (para o USUÁRIO):

Por favor, ao utilizar o produti verifique os seguintes requisitos: -
colocar o banco de dados no formato “.csv” na pasta “entradas”.  
- utilize somente variáveis do tipo “quantitativas”, caso contrário
retornará um erro na utilização do produto. -
=======
O script “gráfico” contém

grafico \<- function(model_name,tipo,x = 0,y = 0)

### Requisitos de entrada
>>>>>>> 0ccf707bcd69305654c7dd8f20eaa8d3b1d7aada

config …nome é o mesmo do modelo de cofiguracao nao pode colocar 2
modelos cm mesmo nome nao pode var categorica. aruqivos
alteraveis….arquiv csv , preditores jason…configuracao.yaml.

### Resultados produzidos

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub.
