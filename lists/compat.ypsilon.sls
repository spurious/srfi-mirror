(library (xitomatl srfi lists compat)
  (export 
    last-pair make-list)
  (import 
    (rnrs)
    (only (core) make-list))
  
  (define (last-pair x)
    (unless (pair? x)
      (assertion-violation 'last-pair "not a pair" x))
    (let loop ([x x])
      (if (pair? (cdr x))
        (loop (cdr x))
        x)))  
  
)
