#lang scheme

(define fibo
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((= n 2) 2)
      (else (+ (fibo (- n 1)) (fibo (- n 2)))))))

(define sumEven
  (lambda (n m s)
    (let ([f (fibo n)])
      (cond
        ((> f m) s)
        ;((even? f) (sumEven (add1 n) m (+ f s)))
        (else (sumEven (+ n 3) m (+ f s)))))))

(sumEven 2 4000000 0)