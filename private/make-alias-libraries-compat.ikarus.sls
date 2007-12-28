(library (srfi private make-alias-libraries-compat)
  (export
    impl-name-ext printf pretty-print)
  (import
    (rnrs base)
    (only (ikarus) printf pretty-print))  
  
  (define impl-name-ext ".ikarus")
)
