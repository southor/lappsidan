



;; ------------------------------------------------------------------------
;; ------------------------------------------------------------------------
;; --------------------------------- DATA ---------------------------------
;; ------------------------------------------------------------------------







;;
;; HELA SIDANS EGENSKAPER
;; 
;; total-width - bredden på hela sidan (anpassat för minst 800*600)
;;
(define page-properties
	'(
	(total-width . 752)
	(header-height . 80)
	(menu-width . 148)
	(footer-height . 64)
	(top-margin . 0)
	))

	
(define frame-properties
	'(
	(dash-width . 2)
	(frames-margin . 4)
	(border-margin . 2)
	(inside-margin . 2)
	))


(define frames-properties
	'(
	(header (bg-color . "222544") (border-color . "eeeee6") (color . "eeeee6"))
	(menu (bg-color . "88aabb") (border-color . "222544") (color . "000000"))
	(main (bg-color . "eeeee6") (border-color . "88aabb") (color . "000000"))
	(footer (bg-color . "335533") (border-color . "eeeee6") (color . "000000"))
	))



;;
;; ENSKILDA SIDORS EGENSKAPER
;;
;; Detta är varje sidas egenskaper
;; 
;; height - öka denna om innehållet inte får plats
;;
(define main-pages-properties
	'(
	(start . 		((main-height . 1200)))
	(bestallning . 	((main-height . 800)))
	(galleri . 		((main-height . 3000)))
	(historia . 	((main-height . 600)))
	(kontakt . 		((main-height . 800)))
	(salu . 		((main-height . 800)))
	(tillverkning . ((main-height . 2500)))
	))
	
	







;; ------------------------------------------------------------------------
;; ---------------------------------- KOD ---------------------------------
;; ------------------------------------------------------------------------
;; ------------------------------------------------------------------------


;; define main-heights
(define main-heights '())

;; fill up main-heights with unique values
(for-each (lamnda (x) 
				(let ((main-height (cdr (assoc 'main-height (cdr x)))))
						(if (not (member main-height main-heights))
							(set! main-heights (cons main-height main-heights)))))
			main-pages-properties)


(define (display-css-attrib name value post output-port)
			(display 		"	" 	output-port)
				(display 	name 	output-port)
				(display 	": " 	output-port)
				(display 	value 	output-port)
				(display 	post 	output-port)
				(display 	#\; 	output-port)
				(newline 			output-port))
				


;; pos - cons pair of x y
;; size - cons pair of width height
(define (generate-css-frames name pos size bg-color border-color color p)
	
	(define (display-frame-id name main-height type p)
			(display "#" p)
					(display name p)
					(display "-" p)				
					(display main-height p)
					(if (not (eq? type ""))
							(begin
								(display "-" p)
								(display type p)))
					(display " {" p)
					(newline p))
					
	(let ((dash-width (cdr (assoc 'dash-width frame-properties)))
			(frames-margin (cdr (assoc 'frames-margin frame-properties)))
			(border-margin (cdr (assoc 'border-margin frame-properties)))
			(inside-margin (cdr (assoc 'inside-margin frame-properties))))


			(define (generate-css-frame main-height)
				
				(let ((w (car size))(h (cdr size)))
				
					(display "/* -------------------------- */" p)
						(newline p)
					(display "/* ---------- " p)
						(display main-height p)
						(display " ---------- */" p)
						(newline p)
					(display "/* -------------------------- */" p)
						(newline p)
					(newline p)
				
					(display-frame-id name main-height "" p)
					(display-css-attrib "position" "absolute" "" p)
					(display-css-attrib "left" 	(car pos) "px" p)
					(display-css-attrib "top" 	(cdr pos) "px" p)
					(display-css-attrib "width" w "px" p)
					(display-css-attrib "height" h "px" p)
					(display "}" p)
					(newline p)
					
					(set! w (- w (* 2 border-margin)))
					(set! h (- h (* 2 border-margin)))
					
					(display-frame-id name main-height "dashed" p)
					(display-css-attrib "position" "relative" "" p)
					(display-css-attrib "left" border-margin "px" p)
					(display-css-attrib "top" border-margin "px" p)
					(display-css-attrib "width" w "px" p)
					(display-css-attrib "height" h "px" p)
					(display "}" p)
					(newline p)
					
					(set! w (- w (* 2 inner-margin)))
					(set! h (- h (* 2 inner-margin)))
					
					(display-frame-id name main-height "front" p)
					(display-css-attrib "position" "relative" "" p)
					(display-css-attrib "left" inner-margin "px" p)
					(display-css-attrib "top" inner-margin "px" p)
					(display-css-attrib "width" w "px" p)
					(display-css-attrib "height" h "px" p)
					(display "border: #" p)
						(display border-color p)
						(display " " p)
						(display dash-width p)
						(display "px" p)
						(display " dashed;" p)
					(display "}" p)
					(newline p)
									
					(display-css-attrib "left" (car pos) "px" p)
					(display "left: " p)
						(display (car pos) p)
						(display "px;" p)
						(newline p)
					(display "}" p)
					(newline p)))
					

		

			(display "." p)
				(display name p)
				(display "-" p)				
				(display "colors {" p)			
				(newline p)
			(display-css-attrib "background" "bg-color" "" p)
			(display-css-attrib "color" "color" "" p)
			(display "}" p)
			(newline p)
	
			(for-each generate-css-frame main-heights)))
	



;; p - output-port
(define (generate-page-css-frames p)
	(let* ((page-width (cdr (assoc 'total-width page-properties))))
			
		#f
		))
	
	