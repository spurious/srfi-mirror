(library (srfi registry)
  (export 
    aliases
    available-features)
  (import (rnrs))
  
  (define aliases
    ; structured: ([primary [library-aliases ...] [feature-aliases ...]] ...)
    ;
    ;   primary                     library aliases        feature aliases
    '([(srfi feature-expand)         [(srfi |0|)]           [srfi-0]]
      [(srfi error-reporting)        [(srfi |23|)]          [srfi-23]]
      [(srfi eager-comprehensions)   [(srfi |42|)]          [srfi-42]]
      [(srfi lightweight-testing)    [(srfi |78|)]          [srfi-78]]))
  
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