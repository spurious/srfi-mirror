(library (srfi private registry)
  (export 
    aliases
    available-features)
  (import (rnrs))
  
  (define aliases
    #!ikarus  ;; because of |blah| extension to reader symbol syntax
    ; structured: ([primary [library-aliases ...] [feature-aliases ...]] ...)
    ;   primary                     library aliases        feature aliases
    '([(srfi feature-expand)         [(srfi  |0|)]          [srfi-0]]
      [(srfi lists)                  [(srfi  |1|)]          [srfi-1]]
      [(srfi string-ports)           [(srfi  |6|)]          [srfi-6]]
      [(srfi receive)                [(srfi  |8|)]          [srfi-8]]
      [(srfi records)                [(srfi  |9|)]          [srfi-9]]
      [(srfi let-values)             [(srfi |11|)]          [srfi-11]]
      [(srfi strings)                [(srfi |13|)]          [srfi-13]]
      [(srfi char-set)               [(srfi |14|)]          [srfi-14]]
      [(srfi case-lambda)            [(srfi |16|)]          [srfi-16]]
      [(srfi time)                   [(srfi |19|)]          [srfi-19]]
      [(srfi error-reporting)        [(srfi |23|)]          [srfi-23]]
      [(srfi specialize-procedures)  [(srfi |26|)]          [srfi-26]]
      [(srfi random)                 [(srfi |27|)]          [srfi-27]]
      [(srfi args-fold)              [(srfi |37|)]          [srfi-37]]
      [(srfi parameters)             [(srfi |39|)]          [srfi-39]]
      [(srfi streams)                [(srfi |41|)]          [srfi-41]]
      [(srfi eager-comprehensions)   [(srfi |42|)]          [srfi-42]]
      [(srfi compare)                [(srfi |67|)]          [srfi-67]]
      [(srfi lightweight-testing)    [(srfi |78|)]          [srfi-78]])
    #!r6rs)
  
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
