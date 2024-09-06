
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Problema de regressão

<!-- badges: start -->
<!-- badges: end -->

Este produto foi desenvolvido por Enzo Putton Tortelli de Souza, Felipe
Camilo Queiroz, Lara Maria Herrera Drugowick e Rodrigo Caldiron, como
parte das atividades realizadas na disciplina de ME918-2S-2024 (Produto de
Dados) do curso de Estatística da UNICAMP.

# Instruções de uso e funcionamento

O objetivo com este produto é fornecer ao usuário predições decorrentes da
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
- y: valores observados para cada observação no conjunto de dados do **treinamento** (sendo o *default* y = 0 na regressão linear)  
- x: valores preditos para as observações do conjunto de dados do **treinamento** (sendo o *default* x = 0 na regressão linear)

### Para o USUÁRIO:

Por favor, antes de utilizar o produto, certifique-se que:
- seu banco de dados esteja no formato `.csv`. Coloque-o na pasta “entradas”.  
- suas variáveis (preditoras e resposta) sejam do tipo “quantitativas”, caso contrário, ao rodar o projeto, um *output* será gerado com uma mensagem de erro.
- o arquivo `configuracao.yaml` esteja devidamente padronizado, com os nomes das variáveis escritas da mesma maneira que aparecem no banco de dados. Este arquivo deve respeitar a seguinte estrutura:

``` r
{tabela: iris.csv
modelos:
  - "nome_modelo": modelo_lm
    "y": Sepal.Length
    "x": [Petal.Length]
    "tipo": linear
  - "nome_modelo": modelo_np
    "y": Sepal.Length
    "x": [Sepal.Width]
    "tipo": np
    "metodo_np":
  - "nome_modelo": modelo_lasso
    "y": Sepal.Length
    "x": [Sepal.Width, Petal.Length]
    "tipo": lasso
}
```

onde:
- `"tabela"` recebe o nome do banco de dados e sua respectiva extensão `.csv`; 
- `"nome_modelo"` define o nome do modelo. **Por favor, mantenha a escrita sempre da mesma forma**;
- `"y"` define a variável resposta **(escrita como no banco de dados)**;
- `"x"` define a variável preditora ou um vetor de variáveis preditoras **(escritas como no banco de dados)**;
- `"tipo"` define o modelo a ser executado (linear, np, lasso).

Você também encontrará na pasta "entradas" o arquivo `preditores.json`. É um arquivo editável, para que você insira os valores das variáveis preditoras para gerar novas predições, bem como o nome do modelo, como disposto nas especificações do arquivo `configuracao.yaml`.


### Execução
No arquivo `main.R` você encontrará todos os pacotes necessários para executar o produto. Você também encontrará a função `read_yaml()` que realizará a leitura do arquivo de configuração e a função `source()`, para a leitura do treinamento dos modelos de regressão. Baixe o projeto clicando em:

https://github.com/laradru/ME918-problema-de-regressao/archive/refs/heads/main.zip

Abra o projeto, clicando em `Regressao.Rproj`. Após fornecer o banco de dados e os preditores na pasta "entrada", abra o arquivo `main.R` e execute o *"script"* (selecione o *"script"* por completo e clique em *"Run"*).

### Resultados produzidos
Após a execução, os resultados produzidos poderão ser acessados na pasta "saidas". Os resultados incluem:

- o arquivo `todas_predicoes.json`, que contém os valores preditos pelos modelos de regressão;
- um gráfico de dispersão com os valores ajustados *versus* valores observados, no formato `.jpeg` (um gráfico por modelo);
- e um gráfico QQ-Plot (no caso do modelo linear).


You can also embed plots, for example:
![](README_files/figure-gfm/pressure-1.png)<!-- -->

