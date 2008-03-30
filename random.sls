#!r6rs
(library (xitomatl srfi random)
  (export random-integer
          random-real
          default-random-source
          make-random-source
          random-source?
          random-source-state-ref
          random-source-state-set!
          random-source-randomize!
          random-source-pseudo-randomize!
          random-source-make-integers
          random-source-make-reals)
  
  (import (except (rnrs) error)
          (rnrs r5rs)                 ; for modulo
          (xitomatl srfi parameters)
          (xitomatl srfi time)                 ; for time-nanosecond and current-time
          (prefix (xitomatl srfi error-reporting) ER:)
          (xitomatl srfi private include-resolve)
          )
  
  (define (error . args)
    (parameterize ([ER:error-who 
                    '(library (xitomatl srfi random/27))])
      (apply ER:error args)))
  
   (include/resolve ("xitomatl" "srfi" "random") "random.ss")
  )
