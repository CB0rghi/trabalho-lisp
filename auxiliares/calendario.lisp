(load "dados/eventos.lisp")
(load "dados/meses.lisp")

(defun mostra-dias-e-eventos (ano mes)  
  (loop for dia from 1 to 30 do
    (if 
      (existe-evento-na-data ano mes dia) 
      (format t "*~d* " dia)
      (format t "~d " dia)
    )
  )
)

(defun mostra-dias-mes(ano mes) 
  "Exibe um mês específico do ano junto com seus dias"
  (format t "~%Mês ~a (~d)~%" (nth (1- mes) *meses*) mes)
  (mostra-dias-e-eventos ano mes)
  (terpri)
)

(defun mostra-meses (&optional ano mes)
  "Exibe todos os meses do ano junto com seus dias e eventos"
  (if (null mes)
    (loop for i from 1 to 12 do
      (mostra-dias-mes ano i) 
    )
    (mostra-dias-mes ano mes)
  )
)

(defun mostra-dias-com-eventos (ano mes)
  (loop for dia from 1 to 30 do
    (when 
      (existe-evento-na-data ano mes dia) 
      (format t "*~d* " dia)
    )
  )
)

(defun mostra-eventos-mes(ano mes)
  "Exibe um mês específico do ano junto com seus eventos"
  (format t "~%Mês ~a (~d)~%" (nth (1- mes) *meses*) mes)
  (mostra-dias-com-eventos ano mes)
  (terpri)
)

(defun mostra-meses-com-eventos (&optional ano mes)
  "Exibe calendario de eventos"
  (if 
    (null mes)
    
    (loop for i from 1 to 12 do
      (when (existe-evento-na-data ano i nil) 
        (mostra-eventos-mes ano i)
      )
    )
    (when (existe-evento-na-data ano mes nil)
      (mostra-eventos-mes ano mes)
    )
  )
)