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

(define cons-n
  (lambda (n l)
    (cond
      ((null? l) '())
      (else (cons (rep n (car l)) (cons-n n (cdr l)))))))

(define rep
  (lambda (n m)
    (cond
      ((zero? n) '())
      (else (cons m (rep (sub1 n) m))))))

(let ([n (read)][l (read->lat)])
  (printf "~a~%" (lat->string (flatten (cons-n n l)))))