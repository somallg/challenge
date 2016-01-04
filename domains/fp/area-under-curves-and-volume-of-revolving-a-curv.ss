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

(define p
  (lambda (la lb x)
    (cond
      ((or (null? la) (null? lb)) 0)
      (else (+ (* (car la) (^ x (car lb))) (p (cdr la) (cdr lb) x))))))

(define aria-curve
  (lambda (la lb step low high)
    (cond
      ((>= low high) 0)
      (else (+ (- (p la lb (+ low step)) (p la lb low)) (aria-curve la lb step (+ low step) high))))))


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
;(let ([l (read->lat)])
;  (let ([rl (reverse l)])
;    (let ([le (/ (- (length l) 2) 2)])
;      (let ([high (car rl)])
;        (let ([low (car (cdr rl))])
;          (let ([la (my-filter (less-than-eq le) 1 l)])
;            (let ([lb (my-filter (more-than le) 1 l)])
;             (let ([step (/ 1 8)])
                ;high))))))))
;                (aria-curve la lb step low high)))))))))
(aria-curve '(1 2) '(0 1) (exact->inexact (/ 1 8)) 2 20)
            
      

