#!/usr/bin/env scheme-script
(import
  (rename (ikarus) (format ikarus:format))
  (srfi format)
  (srfi lightweight-testing))

#;(define (format-lots n f fmt-str . args)
  (let loop ([i 0] [r #f])
    (if (= i n)
      r
      (loop (+ 1 i) (apply f fmt-str args)))))

(define-syntax expect
   (syntax-rules ()
     [(_ expected expr)
      (check expr => expected)]))

;;;===================================================

(expect (format "test ~s" 'me) (format #f "test ~a" "me"))

(expect  " 0.333" (format "~6,3F" 1/3))

(expect "  12" (format "~4F" 12))

(expect "  12.346" (format "~8,3F" 12.3456))

(expect "123.346" (format "~6,3F" 123.3456))

(expect "123.346" (format "~4,3F" 123.3456))

(expect "0.000+1.949i" (format "~8,3F" (sqrt -3.8)))  ;; Ikarus doesn't yet support complex numbers

(expect " 32.00" (format "~6,2F" 32))

(expect "    32" (format "~6F" 32))

(expect "  32.0" (format "~6F" 32.))
;; NB: (not (and (exact? 32.) (integer? 32.)))

(expect "  3.2e46" (format "~8F" 32e45))

(expect " 3.2e-44" (format "~8F" 32e-45))  ;; Ikarus's flonums are broken currently

(expect "  3.2e21" (format "~8F" 32e20))

;;(expect "   3.2e6" (format "~8F" 32e5)) ;; ok.  converted in input to 3200000.0

(expect "  3200.0" (format "~8F" 32e2))

(expect " 3.20e11" (format "~8,2F" 32e10))

(expect "      1.2345" (format "~12F" 1.2345))

(expect "        1.23" (format "~12,2F" 1.2345))

(expect "       1.235" (format "~12,3F" 1.2345))

(expect "        0.000+1.949i" (format "~20,3F" (sqrt -3.8)))  ;; Ikarus doesn't yet support complex numbers

(expect "0.000+1.949i" (format "~8,3F" (sqrt -3.8)))  ;; Ikarus doesn't yet support complex numbers

(expect " 3.46e11" (format "~8,2F" 3.4567e11))

(expect "#0=(a b c . #0#)"
        (format "~w" (let ( (c '(a b c)) ) (set-cdr! (cddr c) c) c)))

(expect "
"
        (format "~A~A~&" (list->string (list #\newline)) ""))

(expect "a new test"
        (format "~a ~? ~a" 'a "~s" '(new) 'test))

(expect "a new test, yes!"
        (format "~a ~?, ~a!" 'a "~s ~a" '(new test) 'yes))

(check-report)
