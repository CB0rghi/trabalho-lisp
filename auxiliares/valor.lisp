(defun troca-se-nil (valor substituto)
  "Retorna segundo parâmetro caso o primeiro seja nulo"
  (if (null valor) substituto valor)
)