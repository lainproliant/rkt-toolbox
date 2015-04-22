#lang racket
;
; Lain's Racket data utilities
; Functions to help with data processing.
;
; Author: Lain Supe (lainproliant)
; Date: Monday April 20 2015
;

(require json)

(provide struct->json)
(provide json->struct)
(provide struct->list)
(provide list->struct)

(define (struct->json st)
   (jsexpr->string (struct->list st)))

(define (json->struct ctor json)
   (apply ctor (string->jsexpr json)))

(define (list->struct ctor L)
   (apply ctor L))

(define (struct->list st)
   (when (not (struct? st))
      (error "Parameter is not a struct or struct is opaque."))
   (cdr (vector->list (struct->vector st))))

