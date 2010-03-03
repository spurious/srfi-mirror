#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi :6 basic-string-ports)
  (export
    open-input-string
    open-output-string
    get-output-string)
  (import
    (rnrs base)
    (only (rnrs io ports) open-string-input-port)
    (srfi :6 basic-string-ports compat))
  
  (define (open-input-string str)
    (open-string-input-port str))
)
