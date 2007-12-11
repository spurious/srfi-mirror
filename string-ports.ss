; I wish there was a standard port type which could be sub-typed 
; so it could hold on to its string sink, then accumed-alist stuff
; would not be needed.

; NOTE: This is not thread-safe because of accumed-alist.
;       Once Ikarus gets threads, uses of accumed-alist will need to be mutexed

; TODO: If/when Ikarus gets the ability to register actions to do after a GC collect
;       is done, remove-inaccessible will be registered and the calls to it in this
;       library's procedures will be removed; this will reliably cleanup, whereas
;       the way it is now, if none of the procedures are called again, 
;       remove-inaccessible won't get run.

(library (srfi string-ports)
  (export
    open-input-string
    open-output-string
    get-output-string)
  (import
    (rnrs)
    (rnrs mutable-pairs)
    (only (ikarus) make-guardian weak-cons weak-pair?))
  
  (define G (make-guardian))
  
  (define (open-input-string str)
    (remove-inaccessible)
    (open-string-input-port str))
  
  (define accumed-alist '())
  
  (define (remove-inaccessible)
    (let ([x (G)])
      (when x
        (set! accumed-alist 
              (remq (let ([y (assq x accumed-alist)])
                      (assert (weak-pair? y))
                      y) 
                    accumed-alist))
        (remove-inaccessible))))
  
  (define (open-output-string)
    (remove-inaccessible)
    (letrec ([sop
              (make-custom-textual-output-port
                "string-output-port"
                (lambda (string start count)  ; write!
                  (when (positive? count)
                    (let ([x (assq sop accumed-alist)])
                      (set-cdr! x (cons (substring string start (+ start count)) (cdr x)))))
                  count)
                #f  ; until Ikarus supports get-position
                #f  ; until Ikarus supports set-position!
                #f  #| closed |# )])
      (set! accumed-alist (cons (weak-cons sop '()) accumed-alist))
      (G sop)
      sop))
  
  (define (get-output-string sop)
    (remove-inaccessible)
    (if (output-port? sop)
      (cond [(assq sop accumed-alist)
             => (lambda (x) (apply string-append (reverse (cdr x))))]
            [else
             (assertion-violation 'get-output-string "not a string-output-port" sop)])
      (assertion-violation 'get-output-string "not an output-port" sop)))
  
)
