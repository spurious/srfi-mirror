#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi private platform-features)
  (export
    OS-features
    implementation-features)
  (import
    (rnrs)
    (only (scheme base) system-type)
    (srfi private OS-id-features))
  
  (define (OS-features)
    (OS-id-features
     (string-append (symbol->string (system-type 'os))
                    " " (system-type 'machine))
     '(("linux" linux posix)
       ("macosx" mac-os-x darwin posix)
       ("solaris" solaris posix)
       ("gnu" gnu)
       ("bsd" bsd)
       ("freebsd" freebsd posix)
       ("openbsd" openbsd posix)
       ("windows" windows))))
  
  (define (implementation-features)
    '(mzscheme))
)
