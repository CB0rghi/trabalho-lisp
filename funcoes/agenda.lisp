(load "dados/eventos.lisp")
(load "dados/meses.lisp")
(load "auxiliares/evento.lisp")
(load "auxiliares/calendario.lisp")

(defun calendario (&optional &key ano mes)
  "Exibe o calendário do ano ou do mês(opcional)"
  (if (null ano) 
    (format t "Erro: Ano necessário!~%")
    (mostra-meses ano mes)
  )
)

(defun calendario-eventos (&optional &key ano mes)
 "Exibe o calendário de eventos do ano + mês(opcional)"
  (if (null ano) 
    (format t "Erro: Ano necessário!~%")
    (mostra-meses-com-eventos ano mes)
  )
)

(defun mostra-eventos (&optional &key ano mes dia hora)
  "Exibe detalhes de todos os eventos"
  (loop for evento in (ordena-eventos *eventos*) do
    (when (evento-ocorre ano mes dia hora evento)
      (apply (function exibe-evento) evento)
    )
  )
)
