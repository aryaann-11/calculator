;;the program uses early evaluation for multiplication and division ops
;;that means, certain parts of the expression are evaluated while the expression is being parenthesized


(defun is-higher-op (op)
   (if (or (equal op '*) (equal op '/))
       T 
       nil
   )
)

(defun parenthesize (expr) 
   (if (listp expr)
       (if (= (length expr) 1)
           (parenthesize (car expr))
           (if (= (length expr) 3)
               (list (parenthesize (car expr)) (cadr expr) (parenthesize (caddr expr)))
               (if (is-higher-op (cadr expr))
                  (parenthesize 
                    (cons 
                        (eval-infix (list (parenthesize (car expr)) (cadr expr) (parenthesize (caddr expr))))
                        (cdddr expr)    
                    )
                  )
                  (list (parenthesize (car expr)) (cadr expr) (parenthesize (cddr expr)))
               )
           )
       )
       expr 
   )
)

(defun eval-infix (operation) (
    if(listp operation)
      (eval (list (eval-infix (cadr operation)) (eval-infix (car operation)) (eval-infix (caddr operation))))
      operation
))

(format t "~&Enter: ")
(setf expr (read))
(format t "~%")
(princ (parenthesize expr))
(format t "~%")
(princ (eval-infix (parenthesize expr)))


