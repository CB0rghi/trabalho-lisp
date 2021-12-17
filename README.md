# Agenda Lisp #

Projeto desenvolvido para a disciplina **Linguagens de Programação Não Convencionais**, ministrada pelo [Professor Dr. Thiago Gottardi](https://bv.fapesp.br/pt/pesquisador/104729/thiago-gottardi/), durante o sexto semestre da graduação em [Bacharelado em Ciências da Computação na Unesp de Rio Claro](https://igce.rc.unesp.br/#!/departamentos/demac/pagina-do-curso-de-bcc/home/).

## Aluno ##
* [Caio Borghi](https://github.com/CB0rghi)

## Inicialização do projeto: ##
* Compile uma imagem Docker
```docker
    docker build -t trabalho-caio .
```
* Inicialize o contâiner
```docker
    docker run -d -t --name trabalho-caio trabalho-caio
```

* Acesse o contâiner "trabalho-caio"
```bash
    docker exec -it trabalho-caio bash
```

** Caso opte por rodar as funções exigidas na documentação do trabalho, execute:
```bash
    clisp exemplos.lisp
```

** Caso prefira abrir o REPL, execute:
``` lisp
    clisp
    (load "main.lisp")
```

## Uso das funções: ##
A agenda possui 3 funções principais: calendario, calendario-eventos e mostra-eventos.

### ( calendario :ano :mes ) ###

``` lisp
    (calendario :ano 2021)
        ;; Irá retornar todos os meses e dias daquele ano

    (calendario :ano 2021 :mes 7)
        ;; Irá retornar os dias para o mês escolhido
```

**Considerações**
* Quando houver um evento, o dia aparecerá destacado com um asterisco **\*** ao seu redor
``` lisp
    [1]> (calendario :ano 2021 :mes 9)

    Mês Setembro (9)
    1 2 3 4 5 6 7 8 9 10 11 12 13 14 *15* 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
```
* O único parâmetro obrigatório é o **ano**, os demais são opcionais.

### ( calendario-eventos :ano ) ###

``` lisp
    ( calendario-eventos :ano 2021 )
```

**Considerações**
* Tem como objetivo listar todos os eventos de um ano especifico, exibindo somente os meses e dias.

``` lisp
    [1]>  ( calendario-eventos :ano 2021)
    
    Mês Março (3)
    *1*

    Mês Maio (5)
    *8* *9* *10* *11* *12* *13* *14* *15* *16* *17* *18* *19* *20* *21* *22* *23* *24* *25* *26* *27* *28*

    Mês Julho (7)
    *10*

    Mês Setembro (9)
    *15*
```

* O parâmetro **ano** é obrigatório.

### ( mostra-eventos :ano :mes :dia :hora ) ###
```lisp
    (mostra-eventos :ano 2021)
        ;; Irá retornar todos os eventos deste ano

    (mostra-eventos :ano 2021 :mes "Julho")
        ;; Irá retornar todos os eventos deste ano, no mês especificado

    (mostra-eventos :ano 2021 :mes "Julho" :dia 10)
        ;; Irá retornar todos os eventos deste ano, no mês e dias especificados
```

**Considerações**
* Tem como objetivo listar todos os eventos encontrados de acordo como os campos invocados na função.
```lisp
    [1]> (mostra-eventos :ano 2021 :mes 9 :dia 15)
    Evento: Almoço aniversário
    Início: 15/9/2021, 12h
    Fim:    15/9/2021, 16h
```
* O parâmetro **ano** é obrigatório.

## Inclusão de novas informações: ##
Para adicionar eventos na agenda acesse o arquivo ["dados/eventos.lisp"](../agenda-lisp/functions/eventos.lisp) e adicione o seguinte exemplo na linha `";; adição de novos eventos"`:

``` lisp
    (:inicio '(2022 3  13 16) :fim '(2022 3  13 22) :nome "Recepção Bixos")
```

Com isso, o arquivo deve estar de acordo com o seguinte:

``` lisp
    (defvar *eventos*
        '(
            (:inicio '(2021 9  15 12) :fim '(2021 9  15 16) :nome "Almoço aniversário")
            (:inicio '(2021 3 1 19) :fim '(2021 3 1 23) :nome "Primeira aula do ano")
            (:inicio '(2022 1 1  0) :fim '(2022 1 1  1) :nome "Ano novo!")
            (:inicio '(2021 5  8 14) :fim '(2021 5 28 14) :nome "Curso TS")
            (:inicio '(2021 7 10  1) :fim '(2021 7 10 23) :nome "Day off")
            (:inicio '(2022 3  13 16) :fim '(2022 3  13 22) :nome "Recepção Bixos")
        )
    )
```

Note que as informações sobre o inicio e fim do evento seguem o padrão **ano mês dia hora**, e o nome do evento deve estar entre aspas.

**Depois de adicionado o novo evento, compile novamente a imagem e recrie o contâiner (caso não tenha realizado a alteração dentro dele), reinicialize o REPL de clisp e reimporte as funções com `(load "agenda.lisp")`.**
