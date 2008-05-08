#!r6rs
(library (xitomatl srfi format compat)
  (export
    pretty-print
    ascii-tab)
  (import
    (rnrs base)
    (only (scheme pretty) pretty-print))
  
  (define ascii-tab #\tab)
)
