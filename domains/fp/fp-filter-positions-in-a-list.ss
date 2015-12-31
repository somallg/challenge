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

(define my-filter
  (lambda (f n l)
    (cond
      ((null? l) '())
      ((f n) (cons (car l) (my-filter f (add1 n) (cdr l))))
      (else (my-filter f (add1 n) (cdr l))))))

; main
(let ([l (read->lat)])
  (printf "~a~%" (lat->string (flatten (my-filter even? 1 l)))))