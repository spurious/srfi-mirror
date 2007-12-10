(library (srfi private registry)
  (export 
    aliases
    available-features)
  (import (rnrs))
  
  (define aliases
    ; structured: ([primary [library-aliases ...] [feature-aliases ...]] ...)
    ;
    ;   primary                     library aliases        feature aliases
    '([(srfi feature-expand)         [(srfi  |0|)]          [srfi-0]]
      [(srfi string-ports)           [(srfi  |6|)]          [srfi-6]]
      [(srfi let-values)             [(srfi |11|)]          [srfi-11]]
      [(srfi time)                   [(srfi |19|)]          [srfi-19]]
      [(srfi error-reporting)        [(srfi |23|)]          [srfi-23]]
      [(srfi specialize-procedures)  [(srfi |26|)]          [srfi-26]]
      [(srfi args-fold)              [(srfi |37|)]          [srfi-37]]
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
