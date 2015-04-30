#lang racket

(provide test-suite)

(define (test-suite name . tests)
   (let* ([total (length tests)]
          [pass (count (lambda (x) (eq? #t x)) tests)]
          [fail (- total pass)])
      (if (= total pass)
         (let ()
            (printf "[~a] ~a tests PASSED.~n" name total)
            #t)
         (let ()
            (printf "[~a] ~a/~a tests FAILED.~n" name fail total)
            #f))))

