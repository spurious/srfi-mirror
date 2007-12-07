(library (srfi |78|)
  (export
    check
    check-ec
    check-report
    check-set-mode!
    check-reset!
    check-passed?
    srfi-78:error-who)
  (import 
    (rename (rnrs) (error rnrs:error))
    (only (ikarus) make-parameter pretty-print with-output-to-string)
    (srfi include-resolve)
    (srfi |42|))
  
  
  (define srfi-78:error-who
    (make-parameter '(library (srfi 78))))
  
  ;;; srfi-23 style
  (define (error . args)
    (apply rnrs:error (srfi-78:error-who) args))
  
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
