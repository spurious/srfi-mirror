#!r6rs
(library (xitomatl srfi specialize-procedures)
  (export cut cute)
  (import (rnrs) (xitomatl srfi private include-resolve))
  
  (include/resolve ("xitomatl" "srfi" "specialize-procedures") "cut.scm")  
)
