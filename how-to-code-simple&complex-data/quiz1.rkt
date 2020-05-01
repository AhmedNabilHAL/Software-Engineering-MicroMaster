;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quiz1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; Image Image -> Bool
;; produces true if first image is larger(area is larger) than second image else produce false
(check-expect (first-image-larger? (rectangle 20 10 "solid" "red")
                                   (rectangle 10 10 "solid" "red")) true)


(check-expect (first-image-larger? (rectangle 20 10 "solid" "red")
                                   (rectangle 20 10 "solid" "red")) false)

(check-expect (first-image-larger? (rectangle 10 10 "solid" "red")
                                   (rectangle 30 10 "solid" "red")) false)

;(define (first-image-larger? img1 img2) false) ;stub

;(define (first-image-larger? img1 img2)  ;template
;  (...img1 img2))   


(define (first-image-larger? img1 img2)
  (> (* (image-height img1) (image-width img1)) (* (image-height img2) (image-width img2))))