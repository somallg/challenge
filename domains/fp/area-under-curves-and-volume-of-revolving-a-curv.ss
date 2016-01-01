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

(define aria-curve
  (lambda (la lb lx)
    (define helper
      (lambda (la lb x)
        (cond
          ((or (null? la) (null? lb)) 0)
          (else (+ (* (car la) (/ 1 (add1 (car lb))) (^ x (add1 (car lb)))) (helper (cdr la) (cdr lb) x))))))
    (- (helper la lb (car (cdr lx))) (helper la lb (car lx)))))


(define list-char->lat
  (lambda (ls)
    (cond
      ((or (null? ls) ) '())
      ((char=? (car ls) #\space) (list-char->lat (cdr ls)))
      (else (cons (- (char->integer (car ls)) (char->integer #\0)) (list-char->lat (cdr ls)))))))

(define less-than-eq
  (lambda (n)
    (lambda (m)
      (<= m n))))

(define more-than
  (lambda (n)
    (lambda (m)
      (> m n))))

(define my-filter
  (lambda (f n l)
    (cond
      ((null? l) '())
      ((f n) (cons (car l) (my-filter f (add1 n) (cdr l))))
      (else (my-filter f (add1 n) (cdr l))))))

; main
;(let ([a (read-line)]
;      [b (read-line)]
;      [x (read-line)])
;  (let ([la (list-char->lat (string->list a))]
;        [lb (list-char->lat (string->list b))]
;        [lx (list-char->lat (string->list x))])
;    lx))
(let ([l (read->lat)])
  (let ([rl (reverse l)])
    (let ([le (/ (- (length l) 2) 2)])
      (let ([lx (cons (car rl) (cons (car (cdr rl)) '()))])
        (let ([la (my-filter (less-than-eq le) 1 l)])
          (let ([lb (my-filter (more-than le) 1 l)])
            (aria-curve la lb lx)))))))

            
      

