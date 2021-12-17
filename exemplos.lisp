(load "funcoes/agenda.lisp")

(format t "~a~%~a~%" "Função mostra eventos:" "(mostra-eventos :ano 2021 :mes 9 :dia 15)")
(mostra-eventos :ano 2021 :mes 9 :dia 15)

(format t "~%~%~a~%~a~%" "Função calendario:" "(calendario)")
(calendario)

(format t "~%~%~a~%~a~%" "Função calendario:" "(calendario :ano 2021)")
(calendario :ano 2021)

(format t "~%~%~a~%~a~%" "Função calendario:" "(calendario :ano 2021 :mes 9)")
(calendario :ano 2021 :mes 9)

(format t "~%~%~a~%~a~%" "Função calendario-eventos" "(calendario-eventos :ano 2021)")
(calendario-eventos :ano 2021)

(format t "~%~%~a~%~a~%" "Função calendario-eventos" "(calendario-eventos :ano 2021 :mes 9)")
(calendario-eventos :ano 2021 :mes 9)