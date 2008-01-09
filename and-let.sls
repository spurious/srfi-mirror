(library (srfi and-let)  
  ;; can't be named (srfi and-let*) because some OS's filenames can't have *
  (export and-let*)
  (import (rnrs) (srfi private unique-ids))
  
  (define-syntax and-let*
    (lambda (stx)
      (define (get-and-check-ids clauses)
        (syntax-case clauses ()
          [([var expr] . rest)
           (or (identifier? #'var)
               (syntax-violation #f "not an identifier" stx #'var))
           (cons #'var (get-and-check-ids #'rest))]
          [(whatever . rest)
           (get-and-check-ids #'rest)]
          [() '()]))
      (syntax-case stx ()
        [(_ (clause* ...) body* ...)
         (unique-ids?/raise (get-and-check-ids #'(clause* ...)) stx)
         #'(and-let*-core #t (clause* ...) body* ...)])))
  
  (define-syntax and-let*-core
    (lambda (stx)
      (syntax-case stx ()
        [(kw ignore ([var expr] clause* ...) body* ...)
         #'(let ([var expr])
             (if var
               (kw var (clause* ...) body* ...)
               #f))]
        [(kw ignore ([expr] clause* ...) body* ...)
         (with-syntax ([(g) (generate-temporaries '(var))])
           #'(let ([g expr])
               (if g
                 (kw g (clause* ...) body* ...)
                 #f)))]
        [(kw ignore (id clause* ...) body* ...)
         (or (identifier? #'id)
             (syntax-violation #f "invalid clause" stx #'id))
         #'(if id
             (kw id (clause* ...) body* ...)
             #f)]
        [(kw last () body* ...)
         (if (positive? (length #'(body* ...)))
           #'(begin body* ...)
           #'last)])))
)
