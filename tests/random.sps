#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import (rnrs) (srfi :27 random-bits))

(do ((i 0 (+ i 1)))
  ((= i 10) 'done)
  (display (random-integer 100))
  (newline))

(do ((i 0 (+ i 1)))
  ((= i 10) 'done)
  (display (random-real))
  (newline))
