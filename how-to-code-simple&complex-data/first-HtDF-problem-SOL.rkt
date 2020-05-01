;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname first-HtDF-problem-SOL) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String String
;; puts 's' or 'es' at the end of the given string
(check-expect (plural "cat") (string-append "cat" "s"))
(check-expect (plural "dress") (string-append "dress" "es"))
;(define (plural s) "s") ;this is the stub

;(define (plural s) ; this is the template
 ; (... s))

(define (plural s)
  (if (string=? (string-ith s (- (string-length s) 1)) "s")
      (string-append s "es")
      (string-append s "s")))