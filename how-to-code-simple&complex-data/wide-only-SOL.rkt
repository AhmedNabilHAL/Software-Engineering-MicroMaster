;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname wide-only-SOL) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; wide-only-starter.rkt

;; (listof image) -> (listof image)
;; consumes a list of images and produces a list containing only those 
;; images that are wider than they are tall
(check-expect (wide-only empty) empty)
(check-expect (wide-only (list (rectangle 2 1 "solid" "red")))
              (list (rectangle 2 1 "solid" "red")))
(check-expect (wide-only (list (rectangle 2 1 "solid" "red")(rectangle 2 2 "solid" "red")))
              (list (rectangle 2 1 "solid" "red")))
(check-expect (wide-only (list (rectangle 2 1 "solid" "red")
                               (rectangle 2 2 "solid" "red")
                               (rectangle 1 2 "solid" "red")))
              (list (rectangle 2 1 "solid" "red")))

;; (define (wide-only loi) empty) ;stub
(define (wide-only loi)
  (local [(define (fn i) (> (image-width i) (image-height i)))]
    (filter fn loi)))