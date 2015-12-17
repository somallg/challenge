#lang scheme

(define factor
  (lambda (n m)
    (cond
      ((< m 2) n)
      ((zero? (modulo n m)) m) 
      (else (factor n (sub1 m))))))
       

(factor 600851475143 (integer-sqrt 600851475143))
(factor 486847 (integer-sqrt 486847))