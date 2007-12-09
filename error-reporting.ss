(library (srfi error-reporting)
  (export error error-who)
  (import 
    (rename (rnrs base) (error rnrs:error))
    (only (ikarus) make-parameter))
  
  (define error-who (make-parameter #f))
  
  (define (error . args)
    (apply rnrs:error (error-who) args))
)
