#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi :78 lightweight-testing)
  (export
    check
    check-ec
    check-report
    check-set-mode!
    check-reset!
    check-passed?)
  (import 
    (rnrs)
    (srfi :78 lightweight-testing compat)
    (srfi :39 parameters)
    (srfi private include)
    (srfi :23 error tricks)
    (srfi :42 eager-comprehensions))
  
  (SRFI-23-error->R6RS "(library (srfi :78 lightweight-testing))"
   (include/resolve ("srfi" "%3a78") "check.scm"))
)
