#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi private platform-features)
  (export
    OS-features
    implementation-features)
  (import
    (rnrs)
    (only (core) architecture-feature)
    (srfi private OS-id-features))
  
  (define (OS-features)
    (OS-id-features
     (architecture-feature 'operating-system)
     '(("linux" linux posix)
       ("solaris" solaris posix)
       ("darwin" darwin posix)
       ("bsd" bsd)
       ("freebsd" freebsd posix)
       ("openbsd" openbsd posix)
       ("windows" windows))))
  
  (define (implementation-features)
    '(ypsilon))
)
