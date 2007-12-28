(library (srfi lightweight-testing compat)
  (export
    pretty-print/no-trailing-newline
    with-output-to-string)
  (import
    (rnrs)
    (only (ikarus) pretty-print with-output-to-string))
  
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
)
