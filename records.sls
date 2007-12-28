; By Derick Eddington

(library (srfi records)
  (export 
    (rename (srfi:define-record-type define-record-type)))
  (import 
    (rnrs))
  
  (define-syntax srfi:define-record-type
    (lambda (stx)
      (syntax-case stx ()
        [(_ type
            (constructor constructor-tag ...)
            predicate
            (field-tag accessor . more) ...)
         
         (and (for-all identifier? 
                       #'(type constructor predicate  
                               constructor-tag ... field-tag ... accessor ...))
              (for-all (lambda (m) 
                         (and (list? m)
                              (< (length m) 2)
                              (for-all identifier? m)))
                       (syntax->datum #'(more ...)))
              (for-all (lambda (ct) (member ct (syntax->datum #'(field-tag ...))))
                       (syntax->datum #'(constructor-tag ...))))
         
         (with-syntax ([(field-clause ...)
                        (map (lambda (clause)
                               (if (null? (cddr clause)) 
                                 #`(immutable #,@(datum->syntax #'type clause)) 
                                 #`(mutable #,@(datum->syntax #'type clause))))
                             (syntax->datum #'((field-tag accessor . more) ...)))]
                       [(unspec-tag ...)
                        (datum->syntax #'type  
                                       (remp (lambda (ft) 
                                               (member ft (syntax->datum #'(constructor-tag ...))))
                                             (syntax->datum #'(field-tag ...))))])
           #'(define-record-type (type constructor predicate)
               (sealed #t)
               (protocol (lambda (ctor)
                           (lambda (constructor-tag ...)
                             (define unspec-tag (if #f #f))
                             ...
                             (ctor field-tag ...))))
               (fields field-clause ...)))])))
  
)
