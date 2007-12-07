(library (srfi |78|)
  (export
    check
    check-ec
    check-report
    check-set-mode!
    check-reset!
    check-passed?)
  (import 
    (rename (rnrs) (error rnrs:error))
    (only (ikarus) pretty-print with-output-to-string)
    (srfi include-resolve)
    (srfi |42|))
  
  ;;; srfi-23 style
  (define (error . args)
    (apply rnrs:error '(library (srfi lightweight-testing/78)) args))
  
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
  
  (include/resolve ("srfi" "78") "check.scm")
  
  (set! check:write pretty-print/no-trailing-newline)  
)
