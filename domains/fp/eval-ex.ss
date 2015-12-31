#lang scheme

; helper function
(define read->lat
  (lambda ()
    (let ([n (read)])
      (cond
        ((eof-object? n) '())
        (else (cons n (read->lat)))))))

(define lat->string
  (lambda (l)
    (cond
      ((null? l) "")
      (else (string-append (format "~a" (car l)) "\n" (lat->string (cdr l)))))))
; helper function end

(define ^
  (lambda (x n)
    (cond
      ((zero? n) 1)
      (else (* x (^ x (sub1 n)))))))

(define factorial
  (lambda (n)
    (cond
      ((zero? n) 1)
      (else (* n (factorial (sub1 n)))))))

(define e^x
  (lambda (x)
    (define helper
      (lambda (n x)
        (cond
          ((zero? n) 1)
          (else (+ (exact->inexact (/ (^ x n) (factorial n))) (helper (sub1 n) x))))))
    (helper 9 x)))

(define map
  (lambda (f l)
    (cond
      ((null? l) '())
      (else (cons (f (car l)) (map f (cdr l)))))))

; main
(let ([n (read)][l (read->lat)])
  (printf (lat->string (map e^x l))))