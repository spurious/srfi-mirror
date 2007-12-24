(library (srfi private registry)
  (export 
    aliases
    available-features)
  (import (rnrs))
  
  (define aliases
    ; construct: ([primary [library-aliases ...] [feature-aliases ...]] ...)
    (map 
      (lambda (x)
        (define pn (car x))
        (define cns (number->string (cadr x)))
        (list pn 
              `[(srfi ,(string->symbol cns))]
              `[,(string->symbol (string-append "srfi-" cns))]))
      ;      primary                SRFI code number
      '([(srfi feature-expand)          0]
        [(srfi lists)                   1]
        [(srfi string-ports)            6]
        [(srfi receive)                 8]
        [(srfi records)                 9]
        [(srfi let-values)             11]
        [(srfi strings)                13]
        [(srfi char-set)               14]
        [(srfi case-lambda)            16]
        [(srfi time)                   19]
        [(srfi error-reporting)        23]
        [(srfi specialize-procedures)  26]
        [(srfi random)                 27]
        [(srfi args-fold)              37]
        [(srfi parameters)             39]
        [(srfi streams)                41]
        [(srfi eager-comprehensions)   42]
        [(srfi compare)                67]
        [(srfi lightweight-testing)    78])))
  
  (define implementation-features
    '(ikarus))
  
  (define additional-features
    '())
  
  (define available-features
    ; construct: (implementation-features ...
    ;             additional-features ...
    ;             primary0 library-aliases0 ... feature-aliases0 ... 
    ;             ... 
    ;             primaryN library-aliasesN ... feature-aliasesN)
    (apply append 
           implementation-features
           additional-features
           (map (lambda (al)
                  (cons (car al) (append (cadr al) (caddr al))))
                aliases)))
  
  
)
