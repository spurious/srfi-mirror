(library (srfi |23|)
  (export error error-who)
  (import 
    (rename (rnrs) (error rnrs:error))
    (only (ikarus) make-parameter))
  
  (define error-who (make-parameter #f))
  
  (define (error . args)
    (apply rnrs:error (error-who) args))
)
