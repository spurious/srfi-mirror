#!r6rs
(library (xitomatl srfi receive)
  (export receive)
  (import (rnrs))
  
  (define-syntax receive
    (syntax-rules ()
      ((receive formals expression body ...)
       (call-with-values (lambda () expression)
                         (lambda formals body ...)))))
  
)
