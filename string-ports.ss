;; Once Ikarus's I/O stuff stabilizes and its open-input-string, 
;; open-output-string, and get-output-string are back in action,
;; this library will simply re-export them from (ikarus).
;; Otherwise, if they disappear, we'll have to make our own port types.

(library (srfi string-ports)
  (export
    open-input-string
    open-output-string
    get-output-string)
  (import
    (rnrs base)
    (only (ikarus) open-string-input-port open-output-string get-output-string))
  
  (define (open-input-string str) 
    (open-string-input-port str))
  
)