#lang scheme

(define f
  (lambda (n)
    (cond
      ((zero? n) '())
      (else (cons '() (f (sub1 n)))))))

; main
(let ([n (read)])
  (printf (number->string (length (f n)))))