#!r6rs
(library (xitomatl srfi string-ports compat)
  (export 
   (rename
    (make-string-output-port open-output-string)
    (get-accumulated-string get-output-string)))
  (import
   (only (core) make-string-output-port get-accumulated-string))
)
