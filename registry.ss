(library (srfi registry)
  (export 
    aliases
    available-features)
  (import (rnrs))
  
  (define aliases
    ; structured: ([primary [library-aliases ...] [feature-aliases ...]] ...)
    ;
    ;   primary        library aliases                  feature aliases
    '([(srfi |0|)     [(srfi feature-expand)]           [srfi-0]]
      [(srfi |23|)    [(srfi error-reporting)]          [srfi-23]]
      [(srfi |42|)    [(srfi eager-comprehensions)]     [srfi-42]]
      [(srfi |78|)    [(srfi lightweight-testing)]      [srfi-78]]))
  
  (define implementation-features
    '(ikarus))
  
  (define additional-features
    '(#;match))
  
  (define available-features
    ; construct: (primary0 library-aliases0 ... feature-aliases0 ... 
    ;             ... 
    ;             primaryN library-aliasesN ... feature-aliasesN
    ;             additional 
    ;             ...)
    (apply append 
           ; construct: ([primary library-aliases ... feature-aliases ...] ...)
           (map (lambda (al)
                  (cons (car al) (append (cadr al) (caddr al))))
                aliases)
           implementation-features
           additional-features))
  
  
)