
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Problema de regressão

<!-- badges: start -->
<!-- badges: end -->

Este produto foi desenvolvido por Enzo Putton Tortelli de Souza, Felipe
Camilo Queiroz, Lara Maria Herrera Drugowick e Rodrigo Caldiron, como
parte das atividades realizadas na disciplina de ME918-2S-2024 (Produto de
Dados) do curso de Estatística da UNICAMP.

# Instruções de uso e funcionamento

O objetivo deste produto é fornecer ao usuário predições decorrentes da
análise de dados com variáveis quantitativas, utilizando diferentes
modelos de regressão. Antes de utilizar o produto, por favor, garanta
que você tenha os seguintes requisitos em sua máquina:

- Um banco de dados em na extensão `.csv` ;  
- Software R (versão 4.3.1 ou superior) e R-studio (versão 2024.4.2.764 "Chocolate Cosmos" ou superior)  

### Ambiente de desenvolvimento e avaliação

Os *scripts* para o treinamento, predição e análise gráfica dos dados
estão disponíveis na pasta “*scripts*”.

O *script* “treinamento” contém as funções de regressão elaboradas para o produto. Os modelos de
regressão utilizados no treinamento são: Regressão Linear (linear), Regressão
Lasso (lasso) e Regressão Não-Paramétrica (np).

`treinamento()`: é a função principal com os modelos preditivos, salvos em `.rds`. Ela recebe os
seguintes argumentos:  
- *filename*: banco de dados fornecidos pelo usuário na pasta
“entradas”;  
- tipo: é tipo da regressão escolhida pelo usuário (linear, lasso ou
np);  
- y: variável resposta a ser predita;  
- x: vetor de variáveis preditoras;  
- npr_metodo: por "*default*", npr_metodo.  

O *script* “predição” contém a função `getPredicao()` para leitura dos
valores das variáveis preditoras do modelo treinado, disponíveis em um arquivo do formato `.json` na pasta "entradas", e geração dos
valores preditos.

O script “grafico” contém o código para a geração dos gráficos de
dispersão dos dados. A função executada é `grafico()` e possui como argumentos:  
- *model_name*: o nome do modelo do arquivo de configuração;  
- tipo: o tipo da regressão escolhida pelo usuário (linear, lasso ou
np);  
- y: variável resposta (sendo o *default* y = 0 na regressão linear)  
- x: variáveis preditoras (sendo o *default* x = 0 na regressão linear)

### Requisitos de entrada (para o USUÁRIO):

Por favor, ao utilizar o produto, certifique-se que:
- seu banco de dados esteja no formato `.csv`, e o coloque na pasta “entradas”.  
- suas variáveis (preditoras e resposta) sejam do tipo “quantitativas”, caso contrário, ao rodar o projeto, um *output* será gerado com uma mensagem de erro.
- 










### Requisitos de entrada
>>>>>>> 0ccf707bcd69305654c7dd8f20eaa8d3b1d7aada

config …nome é o mesmo do modelo de cofiguracao nao pode colocar 2
modelos cm mesmo nome nao pode var categorica. aruqivos
alteraveis….arquiv csv , preditores jason…configuracao.yaml.
o nome do modelo deve ser escrito sempre da mesma forma
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
