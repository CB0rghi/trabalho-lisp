(load "auxiliares/data.lisp")
(load "auxiliares/valor.lisp")

(defun compara-igual (a b)
  "Compara se a é igual a b."
  (eql a b )
)

(defun maior-recursivo (x o-maior)
  "Retorna o maior elemento da lista x."
  (if (endp x)
    o-maior
    (if (comeca-depois (car x) o-maior)
      (maior-recursivo (cdr x) (car x))
      (maior-recursivo (cdr x) o-maior)
    )
  )
)

(defun maior (x)
  "Retorna o maior elemento da lista x."
  (maior-recursivo x (car x))
)

(defun exceto (retira lista)
    "Retorna a lista 'lista' sem elemento 'retira'."
    (loop for i in lista when (not (compara-igual retira i) ) collect i)
)

(defun comeca-depois (a b)
  "Valida se evento A começa depois que evento B"
  (> (apply #'inicio-em-horas a) (apply #'inicio-em-horas b))
)

(defun ordena-recursivo (entrada saida)
  "Retira elementos de 'entrada' e move para lista 'saida' de forma ordenada. Algoritmo selection sort, seleciona maior e move para o final. Exclui elementos duplicados."
  (if (endp entrada)
    saida
    (concatenate 'list (ordena-eventos (exceto (maior entrada) entrada)) (list (maior entrada)) )
 )
)

(defun ordena-eventos (eventos)
  "Retorna lista 'eventos' como ordenada e sem elementos duplicados."
  (ordena-recursivo eventos '())
)

(defun evento-ocorre (ano mes dia hora evento)
  "Valida se parâmetro evento ocorre na data formada por ano mes dia hora"

  ; Converte início e fim do evento para horas
  (setq inicio-evento (apply #'inicio-em-horas evento))
  (setq fim-evento (apply #'fim-em-horas evento))
  
  ; Converte data selecionada para horas
  (setq data-comeco-horas (dia-ou-max mes dia hora))
  (setq inicio-data-selecionada (apply #'data-em-horas ano data-comeco-horas))
  (setq data-fim-horas (dia-ou-min mes dia hora))
  (setq fim-data-selecionada (apply #'data-em-horas ano data-fim-horas))

  ; Valida se evento acontece na data selecionada  
  (and 
    (>= inicio-data-selecionada inicio-evento) 
    (<= fim-data-selecionada fim-evento)
  )
)

(defun existe-evento-na-data (ano mes dia)
  (loop for evento in *eventos* do
    (when (evento-ocorre ano mes dia nil evento) 
      (return-from existe-evento-na-data T)
    )
  )
  nil
)

(defun exibe-evento (&optional &key nome inicio fim)
  "Exibe detalhes de um evento"

  (setq inicio-formatado (apply #'data-em-texto (car (cdr inicio))))
  (setq fim-formatado (apply #'data-em-texto (car (cdr fim))))

  (format t "Evento: ~a~%" nome)
  (format t "Início: ~a~%" inicio-formatado)
  (format t "Fim:    ~a~%~%" fim-formatado)
)