(library (srfi lightweight-testing)
  (export
    check
    check-ec
    check-report
    check-set-mode!
    check-reset!
    check-passed?
    ;;; All of (srfi eager-comprehensions):
    do-ec list-ec append-ec string-ec string-append-ec vector-ec 
    vector-of-length-ec sum-ec product-ec min-ec max-ec any?-ec 
    every?-ec first-ec last-ec fold-ec fold3-ec 
    : :list :string :vector :integers :range :real-range :char-range 
    :port :dispatched :do :let :parallel :while :until
    :-dispatch-ref :-dispatch-set! make-initial-:-dispatch 
    dispatch-union :generator-proc)
  (import 
    (except (rnrs) error)
    (only (ikarus) pretty-print with-output-to-string make-parameter parameterize)
    (srfi private include-resolve)
    (prefix (srfi error-reporting) ER:)
    (srfi eager-comprehensions))
  
  (define (error . args)
    (parameterize ([ER:error-who
                    '(library (srfi lightweight-testing/78))])
      (apply ER:error args)))
  
  ;;; check.scm says a pretty-print with a trailing newline 
  ;;; will make its print-outs look bad, so:
  (define pretty-print/no-trailing-newline
    (case-lambda
      [(datum output-port)
       (let* ([os (with-output-to-string (lambda () (pretty-print datum)))]
              [os (if (and (positive? (string-length os))
                           (char=? #\newline (string-ref os (- (string-length os) 1))))
                    (substring os 0 (- (string-length os) 1))
                    os)])
         (display os output-port))]
      [(datum) 
       (pretty-print/no-trailing-newline datum (current-output-port))]))
  
  (include/resolve ("srfi" "lightweight-testing") "check.scm")
  
  (set! check:write pretty-print/no-trailing-newline)  
)
