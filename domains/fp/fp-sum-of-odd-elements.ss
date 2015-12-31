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

(define sum
  (lambda (f l)
    (cond
      ((null? l) 0)
      ((f (car l)) (+ (car l) (sum f (cdr l))))
      (else (sum f (cdr l))))))

; main
(let ([l (read->lat)])
  (printf (format "~a" (sum odd? l))))