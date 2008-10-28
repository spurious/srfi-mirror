#!r6rs
(library (xitomatl srfi private implementation-features)
  (export
    OS-features
    implementation-features)
  (import
    (rnrs)
    (only (scheme base) system-type))
  
  (define OS-features
    (let*          ;; TODO? more
        ([alist '(["unix" posix]
                  ["linux" linux posix]
                  ["macosx" mac-os-x darwin posix]
                  ["solaris" solaris posix]
                  ["gnu" gnu]
                  ["windows" windows])]
         [st (string-append (symbol->string (system-type 'os))
                            " " (system-type 'machine))]
         [st-len (string-length st)]
         [contains? 
          (lambda (str)
            (define str-len (string-length str))
            (and (>= st-len str-len)
                 (let loop ([i 0])
                   (and (<= (+ i str-len) st-len)
                        (or (string-ci=? str (substring st i (+ i str-len)))
                            (loop (+ 1 i)))))))]
         [features 
          (apply append
                 (map cdr (filter (lambda (x) (contains? (car x))) 
                                  alist)))])          
      (unless (positive? (length features))
        (error "(library (xitomatl srfi private implementation-features))"
               "Unknown system-type. Please report your's to maintainer person."
               st))
      features))
  
  (define implementation-features
    '(mzscheme))
)
