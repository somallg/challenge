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

(define my-reverse
  (lambda (l)
    (define my-reverse-2
      (lambda (acc l)
        (cond
          ((null? l) acc)
          (else (my-reverse-2 (cons (car l) acc) (cdr l))))))
    (my-reverse-2 '() l)))

; main
(let ([l (read->lat)])
  (printf (lat->string (my-reverse l))))