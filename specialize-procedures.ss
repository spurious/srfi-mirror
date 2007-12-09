(library (srfi specialize-procedures)
  (export cut cute)
  (import (rnrs) (srfi include-resolve))
  
  (include/resolve ("srfi" "specialize-procedures") "cut.scm")
  
)