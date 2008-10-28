(library (xitomatl srfi private implementation-features)
  (export
    OS-features
    implementation-features)
  (import
    (rnrs)
    (only (core) architecture-feature))
  
  (define OS-features
    (let*
        ([alist '(["linux" linux posix]
                  ["darwin" darwin posix]
                  ["freebsd" freebsd posix]
                  ["windows" windows])]
         [af-os (architecture-feature 'operating-system)]
         [af-os-len (string-length af-os)]
         [contains? 
          (lambda (str)
            (define str-len (string-length str))
            (and (>= af-os-len str-len)
                 (let loop ([i 0])
                   (and (<= (+ i str-len) af-os-len)
                        (or (string-ci=? str (substring af-os i (+ i str-len)))
                            (loop (+ 1 i)))))))]
         [features 
          (apply append
                 (map cdr (filter (lambda (x) (contains? (car x))) 
                                  alist)))])          
      (unless (positive? (length features))
        (error "(library (xitomatl srfi private implementation-features))"
               "Unknown operating-system. Please report your's to maintainer person."
               af-os))
      features))
  
  (define implementation-features
    '(ypsilon))
)
