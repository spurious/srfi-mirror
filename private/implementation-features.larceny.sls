(library (xitomatl srfi private implementation-features)
  (export
    OS-features
    implementation-features)
  (import
    (rnrs base))
  
  (define OS-features
    ;;; I couldn't find any facility in the Larceny User's Manual
    ;;; which tells what OS we're running on.
    ;;; Anyone know if Larceny has such a facility?
    '())
  
  (define implementation-features
    '(larceny))
)
