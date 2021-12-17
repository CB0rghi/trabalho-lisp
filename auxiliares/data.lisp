(defun dia-em-horas (dia)
  "Considerando um dia igual a 24 horas."
  (* dia 24)
)

(defun mes-em-horas (mes)
  "Considerando mes igual a 30 dias."
  (dia-em-horas (* mes 30))
)

(defun ano-em-horas (ano)
  "Considerando ano igual a 12 meses."
  (mes-em-horas (* ano 12))
)

(defun data-em-horas (ano mes dia hora)
  "Retorna data em horas de acordo com as funções anteriores"
  (if (>= ano 0)
    (+ (ano-em-horas ano) (mes-em-horas mes) (dia-em-horas dia) hora)
    (- (ano-em-horas ano) (mes-em-horas mes) (dia-em-horas dia) hora)
 )
)

(defun fim-em-horas (&optional &key nome inicio fim)
  "Converte a propriedade fim do objeto evento para horas"
  (apply #'data-em-horas (car (cdr fim)))
)

(defun inicio-em-horas (&optional &key nome inicio fim)
  "Converte a propriedade início do objeto evento para horas"
  (apply #'data-em-horas (car (cdr inicio)))
)

(defun data-em-texto (ano mes dia hora)
  (format nil "~d/~d/~d, ~dh" dia mes ano hora)
)

(defun dia-ou-max (mes dia hora)
  "Retorna mes-dia-hora mas, em caso de algum valor nulo, retorna o máximo (Ex: Dia = 30)"
  (let 
    (
      (valor-mes (troca-se-nil mes 12))
      (valor-dia (troca-se-nil dia 30))
      (valor-hora (troca-se-nil hora 23))
    )
    (list valor-mes valor-dia valor-hora)
  )
)

(defun dia-ou-min (&optional mes dia hora)
  "Retorna mes-dia-hora mas, em caso de algum valor nulo, retorna o mínimo (Ex: Dia = 1)"
  (let
    (
      (valor-mes (troca-se-nil mes 1))
      (valor-dia (troca-se-nil dia 1))
      (valor-hora (troca-se-nil hora 0))
    )
    (list valor-mes valor-dia valor-hora)
  )
)