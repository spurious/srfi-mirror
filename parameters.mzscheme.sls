#!r6rs
(library (xitomatl srfi parameters)
  (export 
    make-parameter 
    parameterize)
  (import 
    (only (scheme base) make-parameter parameterize))
)
