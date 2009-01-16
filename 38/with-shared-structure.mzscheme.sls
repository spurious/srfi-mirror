;;; Copyright (c) 2008 Derick Eddington
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a
;;; copy of this software and associated documentation files (the "Software"),
;;; to deal in the Software without restriction, including without limitation
;;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the Software, and to permit persons to whom the
;;; Software is furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in
;;; all copies or substantial portions of the Software.
;;;
;;; Except as contained in this notice, the name(s) of the above copyright
;;; holders shall not be used in advertising or otherwise to promote the sale,
;;; use or other dealings in this Software without prior written authorization.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
;;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.

#!r6rs
(library (srfi :38 with-shared-structure)
  (export
    write-with-shared-structure
    (rename (write-with-shared-structure write/ss))
    read-with-shared-structure
    (rename (read-with-shared-structure read/ss)))
  (import
    (except (rnrs) read write)
    (only (scheme base) read write parameterize print-graph read-accept-graph))
  
  ;;; NOTE: Not using R6RS read and write probably means the 
  ;;;       full R6RS lexical syntax does not work.  PLT should be
  ;;;       asked to make their print-graph and read-accept-graph
  ;;;       extend their R6RS read and write.
  
  (define write-with-shared-structure
    (case-lambda 
      [(obj)
       (write-with-shared-structure obj (current-output-port))]
      [(obj port)
       (parameterize ([print-graph #t])
         (write obj port))]
      [(obj port optarg)
       (assertion-violation 'write-with-shared-structure
         "this implementation does not support optarg")]))
  
  (define read-with-shared-structure
    (case-lambda
      [()
       (read-with-shared-structure (current-input-port))]
      [(port)
       (parameterize ([read-accept-graph #t]) 
         (read port))]))
  
)
