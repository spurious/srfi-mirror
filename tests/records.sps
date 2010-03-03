#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (rnrs base) ; no R6RS records
  (only (rnrs io simple) display write newline)
  (srfi :9 records))

(define-record-type thing
  (make-thing x)
  thing?
  (x thing-x)
  (y thing-y set-thing-y!))

(define t (make-thing 123))
(display "t => ") (write t) (newline)
(set-thing-y! t 'blah)
(display "t => ") (write t) (newline)
