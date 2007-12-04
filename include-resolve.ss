(library (srfi include-resolve)
  (export include/resolve)
  (import (ikarus))
  
  
  (define-syntax include/resolve
    (lambda (stx)
      (syntax-case stx ()
        [(kw (lib-path* ...) file-path)
         (for-all (lambda (s) (and (string? s) (positive? (string-length s)))) 
                  (syntax->datum #'(file-path lib-path* ...)))
         (let* ([sep "/"]
                [lp*/sep (apply string-append (map (lambda (ps) (string-append ps sep)) 
                                                   (syntax->datum #'(lib-path* ...))))]
                [fp (syntax->datum #'file-path)])
           (let loop ([search (library-path)])
             (if (null? search)
               (syntax-error stx (format "can't find file ~a in library-path" (string-append lp*/sep fp)))
               (let ([full (string-append (car search) sep lp*/sep fp)])
                 (if (file-exists? full)
                   #`(include #,(datum->syntax #'kw full))
                   (loop (cdr search)))))))])))
  
)
