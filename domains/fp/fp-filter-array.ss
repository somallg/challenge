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

(define less-than
  (lambda (n)
    (lambda (m)
      (< m n))))

(define my-filter
  (lambda (f l)
    (cond
      ((null? l) '())
      ((f (car l)) (cons (car l) (my-filter f (cdr l))))
      (else (my-filter f (cdr l))))))

; main
(let ([n (read)][l (read->lat)])
  (printf (lat->string (flatten (my-filter (less-than n) l)))))