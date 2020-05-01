;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quiz2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

;; a program which shows a flower getting bigger

;; ==================
;; Constanst:

(define WIDTH 400)
(define HEIGHT 600)
(define MTS (empty-scene WIDTH HEIGHT))
(define DS 2)

;; ==================
;; Data definitions:

(define-struct flower (x y size))
;; Flower is (make-flower Integer Integer Number)
;; interp. (make-flower x y size) is the position of a flower and its size
;;         x is the x-coord
;;         y is the y-coord
;;         size is the size of the flower in pixels

(define F1 (make-flower 0 0 0))
(define F2 (make-flower 3 4 5))
#;
(define (fn-for-flower f)
  (... (flower-x f)        ; Integer
       (flower-y f)        ; Integer
       (flower-size f)))   ; Number

;; Template rules used:
;;  - Compound: 3 fields

;; ================
;; Functions:
;; Flower -> Flower
;; start the world with (main (make-flower 0 0 0))
;;
(define (main f)
  (big-bang f           ; Flower -> Flower
    (on-tick enlarge)   ; Flower -> Flower
    (to-draw render)    ; Flower -> Image
    (on-mouse handler))); Flower Integer Integer MouseEvent -> Flower 

;; Flower -> Flower
;; increase the size of the flower by ds if size is larger than 0
;; 

(check-expect (enlarge (make-flower 0 0 0)) (make-flower 0 0 0))
(check-expect (enlarge (make-flower 12 12 1)) (make-flower 12 12 (+ 1 DS)))
(check-expect (enlarge (make-flower 1 1 12)) (make-flower 1 1 (+ 12 DS)))

;; (define (enlarge f) (make-flower 0 0 0)) ;stub

;;<use template from Flower>

(define (enlarge f)
  (make-flower (flower-x f)
               (flower-y f)
               (if (> (flower-size f) 0)
                   (+ (flower-size f) DS)
                   0)))

;; Flower -> Image
;; renders an image of a flower if the size is larger than 0
;;

(check-expect (render (make-flower 2 2 1)) (place-image
                                            (pulled-regular-polygon 1 5 1.1 140 "solid" "purple")
                                           2
                                           2
                                           MTS))


(check-expect (render (make-flower 2 2 0)) MTS)

;; (define (render f) MTS) ;stub

(define (render f)
  (if (> (flower-size f) 0)
      (place-image
       (pulled-regular-polygon (flower-size f) 5 1.1 140 "solid" "purple")
       (flower-x f)
       (flower-y f)
       MTS)
      MTS))   

;; Flower Integer Integer MouseEvent -> Flower
;; make a flower at the clicked spot
;; !!!

(check-expect (handler (make-flower 0 0 0) 10 10 "button-down") (make-flower 10 10 0.1))
(check-expect (handler (make-flower 20 20 10) 10 10 "button-down") (make-flower 10 10 0.1))
(check-expect (handler (make-flower 10 10 10) 10 10 "button-up") (make-flower 10 10 10))

;; (define (handler f x y me) (make-flower 5 6 0.1)) ;stub
#;
(define (handler ws x y me)
  (cond [(mouse=? me "button-down") (... ws x y)]
        [else
         (... ws x y)])) ;template

(define (handler f x y me)
  (cond [(mouse=? me "button-down") (make-flower x y 0.1)]
        [else
         (make-flower (flower-x f) (flower-y f) (flower-size f))]))