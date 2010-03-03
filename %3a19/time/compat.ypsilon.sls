#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi :19 time compat)
  (export
   format
   host:time-resolution
   host:current-time
   host:time-nanosecond
   host:time-second
   host:time-gmt-offset)
  (import
   (rnrs base)
   (only (core) format microsecond microsecond->utc))

  (define host:time-resolution 1000)
  (define (host:current-time) (microsecond))
  (define (host:time-nanosecond t) (* (mod t 1000000) 1000))
  (define (host:time-second t) (div t 1000000))
  (define (host:time-gmt-offset t) (/ (- t (microsecond->utc t)) 1000000))
)
