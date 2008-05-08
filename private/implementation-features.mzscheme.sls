#!r6rs
(library (xitomatl srfi private implementation-features)
  (export
    implementation-features)
  (import
    (rnrs base))
  
  (define implementation-features
    '(mzscheme))
)
