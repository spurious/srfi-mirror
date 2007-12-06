(library (srfi lightweight-testing)
  (export
    check
    check-ec
    check-report
    check-set-mode!
    check-reset!
    check-passed?)
  (import 
    (only (rnrs base) quote) 
    (srfi |78|))
  
  (srfi-78:error-who '(library (srfi lightweight-testing)))
)
