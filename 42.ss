(library (srfi |42|)
  (export
    do-ec list-ec append-ec string-ec string-append-ec vector-ec 
    vector-of-length-ec sum-ec product-ec min-ec max-ec any?-ec 
    every?-ec first-ec last-ec fold-ec fold3-ec 
    : :list :string :vector :integers :range :real-range :char-range 
    :port :dispatched :do :let :parallel :while :until
    :-dispatch-ref :-dispatch-set! make-initial-:-dispatch 
    dispatch-union :generator-proc)
  (import
    (rnrs r5rs)
    (rename (rnrs) (error rnrs:error))
    (srfi include-resolve))
  
  ;;; srfi-23 style
  (define (error . args)
    (apply rnrs:error '(library (srfi eager-comprehensions/42)) args))
  
  (include/resolve ("srfi" "42") "ec.scm")  
)
