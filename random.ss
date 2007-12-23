(library (srfi random)
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
          (except (ikarus) error)     ; for time-nanosecond and current-time
          (rnrs r5rs)                 ; for modulo
          (srfi parameters)
          (prefix (srfi error-reporting) ER:)
          (srfi private include-resolve)
          )
  
  (define (error . args)
    (parameterize ([ER:error-who 
                    '(library (srfi random/27))])
      (apply ER:error args)))
  
   (include/resolve ("srfi" "random") "random.ss")
  )
