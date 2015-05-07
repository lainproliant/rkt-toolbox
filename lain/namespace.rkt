#lang racket
;
; Namespace and dynamic code analysis tools.
; Author: Lain Supe (lainproliant)
; Date: Wednesday, April 22 2015
;

; Determine if a particular symbol represents a defined
; transformer binding.
(define (is-macro? name)
   (not (eq? #f
            (identifier-transformer-binding (
               (datum->syntax #'is-macro? name))))))

; Determine if a symbol is defined in a namespace or
; as a known identifier or syntactic form.
(define (is-defined? name ns)
   (let ([r (gensym)])
      (or
         (not (eq? r (namespace-variable-value name #t
                        (lambda () r) ns)))
         (is-macro? name))))

