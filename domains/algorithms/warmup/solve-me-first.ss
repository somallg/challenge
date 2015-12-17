#lang racket

(define (sum-of-two-integers a b)
  (+ a b))
    ; Hint: Type (+ a b)) below

(let ([a (read)]
      [b (read)])
    (printf "~a~%" (sum-of-two-integers a b)))