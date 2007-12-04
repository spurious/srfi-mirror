(library (srfi |42|)
  (export
    do-ec list-ec append-ec string-ec string-append-ec vector-ec 
    vector-of-length-ec sum-ec product-ec min-ec max-ec any?-ec 
    every?-ec first-ec last-ec fold-ec fold3-ec 
    : :list :string :vector :integers :range :real-range :char-range 
    :port :dispatched :do :let :parallel :while :until
    :-dispatch-ref :-dispatch-set! make-initial-:-dispatch 
    dispatch-union :generator-proc
    srfi-42:error-who)
  (import
    (rename (rnrs) (error rnrs:error))
    (only (ikarus) include make-parameter)
    (srfi include-resolve))
  
  
  (define srfi-42:error-who
    (make-parameter '(library (srfi |42|))))
  
  ;;; srfi-23 style
  (define (error . args)
    (apply rnrs:error (srfi-42:error-who) args))
  
  (include/resolve ("srfi" "42") "ec.scm")
)
