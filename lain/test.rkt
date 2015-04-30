#lang racket

(require "data.rkt")
(require "test.rkt")

(test-suite "Struct to JSON tools"
   ((lambda ()
      (struct A (a b c) #:transparent)
      (let* ([obj (A 1 2 3)]
             [json (struct->json obj)]
             [obj2 (json->struct A json)]
             [json2 (struct->json obj2)])
         (equal? json json2)))))

