


;; ----------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------
;; ------------------------------------ DATA ----------------------------------------
;; ----------------------------------------------------------------------------------







;; ---------------------------------
;;
;; HELA SIDANS EGENSKAPER
;; 
;; ---------------------------------

;; total-width - bredden på hela sidan (anpassat för minst 800*600)
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
	(inner-margin . 2)
	))


(define frames-properties
	'(
	(header (bg-color . "222544") (border-color . "eeeee6") (color . "eeeee6"))
	(menu 	(bg-color . "88aabb") (border-color . "222544") (color . "000000"))
	(main 	(bg-color . "eeeee6") (border-color . "88aabb") (color . "000000"))
	(footer (bg-color . "335533") (border-color . "eeeee6") (color . "000000"))
	))



;; ---------------------------------
;;
;; ENSKILDA SIDORS EGENSKAPER
;; 
;; ---------------------------------

;; height - öka denna om innehållet inte får plats
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





;; -----------------------------------------------------------------------------------
;; -----------------------------------------------------------------------------------
;; -----------------------------------------------------------------------------------
;; ----------------------------------- CODE ------------------------------------------
;; -----------------------------------------------------------------------------------


(define (generate-page-width)
	(number->string (cdr (assoc 'total-width page-properties))))
	

;; define main-heights
(define main-heights '())

;; fill up main-heights with unique values
(for-each (lamnda (x) 
				(let ((main-height (cdr (assoc 'main-height (cdr x)))))
						(if (not (member main-height main-heights))
							(set! main-heights (cons main-height main-heights)))))
			main-pages-properties)


(define (generate-css-attrib name value post)
			(build-string "	" name ": " value post #\; #\newline))
				


(define (generate-css-frame-colors name bg-color color)
	(build-string
		"." name "-" "colors {"									#\newline
			(generate-css-attrib "background" bg-color "")		#\newline
			(generate-css-attrib "color" color "")				#\newline
		"}"														#\newline
	))


;; main-height - If main-height = zero no main-height will be skipped when generating
(define (generate-css-frame name x y w h main-height border-margin inner-margin dash-width border-color)
	
	(define (generate-frame-id type)
			(build-string
					"#"
					name
					(if (= main-height 0) "" (build-string #\- main-height))
					(if (eq? type "") "" #\-)
					type))
					
	(let* ((bw (- w (* 2 border-margin)))
			(bh (- h (* 2 border-margin)))
			(iw (- bw (* 2 inner-margin)))
			(ih (- bh (* 2 inner-margin))))
			
	
		(build-string
			(if (= main-height 0) ""
				(build-string
					"/* -------------------------- */" 					#\newline
					"/* ---------- " main-height " ---------- */" 		#\newline
					"/* -------------------------- */" 					#\newline
					#\newline
					))
		
			(generate-frame-id "") " {" 								#\newline
				(generate-css-attrib "position" "absolute" "") 			#\newline
				(generate-css-attrib "left" x "px") 					#\newline
				(generate-css-attrib "top" 	y "px") 					#\newline
				(generate-css-attrib "width" w "px") 					#\newline
				(generate-css-attrib "height" h "px") 					#\newline
			"}"															#\newline
			#\newline
		
			(generate-frame-id "dashed") " {"							#\newline
				(generate-css-attrib "position" "relative" "")			#\newline
				(generate-css-attrib "left" border-margin "px")			#\newline
				(generate-css-attrib "top" border-margin "px")			#\newline
				(generate-css-attrib "width" bw "px")					#\newline
				(generate-css-attrib "height" bh "px")					#\newline
				#\newline
				"border: #" border-color " " dash-width "px dashed;"	#\newline
			"}"															#\newline
			#\newline
			
			(generate-frame-id "inner") " {"							#\newline
			(generate-css-attrib "position" "relative" "")				#\newline
			(generate-css-attrib "left" inner-margin "px")				#\newline
			(generate-css-attrib "top" inner-margin "px")				#\newline
			(generate-css-attrib "width" iw "px")						#\newline
			(generate-css-attrib "height" ih "px")						#\newline
			"}"															#\newline
			#\newline
			)))


;; type -   'single / 'multiple-pos / 'multiple-size
(define (generate-css-frames name x y w h type bg-color border-color color)
	
	(let ((dash-width (cdr (assoc 'dash-width frame-properties)))			
			(border-margin (cdr (assoc 'border-margin frame-properties)))
			(inner-margin (cdr (assoc 'inner-margin frame-properties))))

			(build-string				
				(generate-css-frame-colors bg-color color)
				#\newline
								
				(apply build-string (map (lambda (main-height)											
											(generate-css-frame
												name
												x
												(if (eq? type 'multiple-pos) (+ y main-height) y)
												w
												(if (eq? type 'multiple-size) (+ h main-height) h)
												main-height												
												border-margin
												inner-margin
												dash-width
												border-color))
										main-heights)))))
	



(define (generate-page-css-frames)
	(let ((dash-width (cdr (assoc 'dash-width frame-properties)))
			(border-margin (cdr (assoc 'border-margin frame-properties)))
			(inner-margin (cdr (assoc 'inner-margin frame-properties)))
			
			(page-width (cdr (assoc 'total-width page-properties)))
			(top-margin (cdr (assoc 'top-margin page-properties)))
			(frames-margin (cdr (assoc 'frames-margin frame-properties)))
			
			(header-properties (cdr (assoc 'header main-pages-properties)))
			(menu-properties (cdr (assoc 'menu main-pages-properties)))
			(main-properties (cdr (assoc 'main main-pages-properties)))
			(footer-properties (cdr (assoc 'footer main-pages-properties))))
		
		(let* ((header-x 0)
				(header-y top-margin)
				(header-w page-width)
				(header-h (cdr (assoc 'header-height page-properties)))
				
				(menu-x 0)
				(menu-y (+ header-y header-h frames-margin))
				(menu-w (cdr (assoc 'menu-width page-properties)))
				(menu-h 0)
				
				(main-x (+ menu-w frames-margin))
				(main-y menu-y)
				(main-w (- page-width main-x))
				(main-h menu-h)
				
				(footer-x 0)
				(footer-y (+ menu-y menu-h frames-margin))
				(footer-w page-width)
				(footer-h (cdr (assoc 'footer-height page-properties))))
			
			(build-string
				
				
				"/* ------------------------------------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				"/* ------------------- header ---------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				#\newline
				;; genereate header color class				
				(generate-css-frame-colors "header"
					(cdr (assoc 'bg-color header-properties)) 	;; bg-color
					(cdr (assoc 'color header-properties))) 	;; color
				#\newline
				
				;; genereate header classes
				(generate-css-frame "header" header-x header-y header-w header-h 0 border-margin inner-margin dash-width
					(cdr (assoc 'border-color header-properties)))
				#\newline
				
				
				"/* ------------------------------------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				"/* -------------------- menu ----------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				#\newline
				;; genereate menu classes
				(generate-css-frames "menu" menu-x menu-y menu-w menu-h 'multiple-size
					(cdr (assoc 'bg-color menu-properties)) 		;; bg-color
					(cdr (assoc 'border-color menu-properties)) 	;; border-color
					(cdr (assoc 'color menu-properties))) 			;; color
				#\newline
				
				
				"/* ------------------------------------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				"/* -------------------- main ----------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				#\newline
				;; genereate main classes
				(generate-css-frames "main" main-x main-y main-w main-h 'multiple-size
					(cdr (assoc 'bg-color main-properties)) 		;; bg-color
					(cdr (assoc 'border-color main-properties)) 	;; border-color
					(cdr (assoc 'color main-properties))) 			;; color
				#\newline
				
				
				"/* ------------------------------------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				"/* ------------------- footer ---------------------- */"	#\newline
				"/* ------------------------------------------------- */"	#\newline
				#\newline
				;; genereate footer classes
				(generate-css-frames "footer" footer-x footer-y footer-w footer-h 'multiple-pos
					(cdr (assoc 'bg-color footer-properties)) 		;; bg-color
					(cdr (assoc 'border-color footer-properties)) 	;; border-color
					(cdr (assoc 'color footer-properties))) 		;; color				
				))))
				
				
				
				





				




		





					
					
					
	
	