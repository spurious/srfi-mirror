#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi :2 and-let*)  
  (export 
    and-let*)
  (import 
    (rnrs))
  
  (define-syntax and-let*
    (lambda (stx)
      (define (get-id c)
        (syntax-case c () ((var expr) #'var) (_ #F)))
      (syntax-case stx ()
        ((_ (clause* ...) body* ...)
         (for-all identifier? (filter values (map get-id #'(clause* ...))))
         #'(and-let*-core #T (clause* ...) body* ...)))))
  
  (define-syntax and-let*-core
    (lambda (stx)
      (syntax-case stx ()
        ((kw _ ((var expr) clause* ...) body* ...)
         #'(let ((var expr))
             (if var
               (kw var (clause* ...) body* ...)
               #F)))
        ((kw _ ((expr) clause* ...) body* ...)
         #'(let ((t expr))
             (if t
               (kw t (clause* ...) body* ...)
               #F)))
        ((kw _ (id clause* ...) body* ...)
         (or (identifier? #'id)
             (syntax-violation #F "invalid clause" stx #'id))
         #'(if id
             (kw id (clause* ...) body* ...)
             #F))
        ((kw last () body* ...)
         (if (positive? (length #'(body* ...)))
           #'(begin body* ...)
           #'last)))))
)
