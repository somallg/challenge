#lang scheme

(define sumDivisibleBy
  (lambda (n)
    (let ([p (quotient 999 n)]) (/ (* n (* p (+ p 1))) 2))))

(- (+ (sumDivisibleBy 3) (sumDivisibleBy 5)) (sumDivisibleBy 15))