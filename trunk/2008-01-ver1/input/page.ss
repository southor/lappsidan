


;; ----------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------
;; ----------------------------------------------------------------------------------
;; ------------------------------------ DATA ----------------------------------------
;; ----------------------------------------------------------------------------------

(load "input/properties.ss")





;; -----------------------------------------------------------------------------------
;; -----------------------------------------------------------------------------------
;; -----------------------------------------------------------------------------------
;; --------------------------------- CSS CODE ----------------------------------------
;; -----------------------------------------------------------------------------------

;;(load "lob\\extra.ss")

(define (get-property symbol properties)
	(let ((p (assoc symbol properties)))
		(if p (cdr p) p)))
		

(define (get-number-property symbol properties)
	(number->string (get-property symbol properties)))

(define (generate-page-width)
	(get-number-property 'total-width page-properties))
	;;(number->string (cdr (assoc 'total-width page-properties))))
	

;; define main-heights
(define main-heights '())

;; fill up main-heights with unique values
(for-each (lambda (x) 
				(let ((main-height (cdr (assoc 'main-height (cdr x)))))
						(if (not (member main-height main-heights))
							(set! main-heights (cons main-height main-heights)))))
			main-pages-properties)
(set! main-heights (sort < main-heights))
;;(set! debug #t)
;;(breakpoint)

(define (generate-css-attrib name . rest)
			(apply build-string #\tab name ": " (append rest '(#\; #\newline))))
				


(define (generate-css-frame-colors name bg-color color)
	(build-string
		"." name "-" "colors {"									#\newline
			(generate-css-attrib "background" #\# bg-color)
			(generate-css-attrib "color" #\# color)
		"}"														#\newline
	))


;; main-height - If main-height = zero no main-height will be skipped when generating
(define (generate-css-frame name x y w h main-height border-margin inner-margin dash-width border-color text-align)
	
	(define (generate-frame-id type)
			(build-string
					"#"
					name
					(if (= main-height 0) "" (build-string #\- main-height))
					(if (eq? type "") "" #\-)
					type))
					
	(let* ((bw (- w (* 2 border-margin) (* 2 dash-width)))
			(bh (- h (* 2 border-margin) (* 2 dash-width)))
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
				(generate-css-attrib "position" "absolute")
				(generate-css-attrib "left" x "px")
				(generate-css-attrib "top" 	y "px")
				(generate-css-attrib "width" w "px")
				(generate-css-attrib "height" h "px")
			"}"															#\newline
			#\newline
		
			(generate-frame-id "dashed") " {"							#\newline
				(generate-css-attrib "position" "relative")
				(generate-css-attrib "left" border-margin "px")
				(generate-css-attrib "top" border-margin "px")
				(generate-css-attrib "width" bw "px")
				(generate-css-attrib "height" bh "px")
				#\newline
				#\tab "border: #" border-color " " dash-width "px dashed;"
																		#\newline
			"}"															#\newline
			#\newline
			
			(generate-frame-id "inner") " {"							#\newline
			(generate-css-attrib "position" "relative")
			(generate-css-attrib "left" inner-margin "px")
			(generate-css-attrib "top" inner-margin "px")
			(generate-css-attrib "width" iw "px")
			(generate-css-attrib "height" ih "px")
			(if text-align (generate-css-attrib "text-align" text-align) "")
			"}"															#\newline
			#\newline
			)))


;; type -   'single / 'multiple-pos / 'multiple-size
(define (generate-css-frames name x y w h type bg-color border-color color text-align)
	
	(let ((dash-width (cdr (assoc 'dash-width frame-properties)))			
			(border-margin (cdr (assoc 'border-margin frame-properties)))
			(inner-margin (cdr (assoc 'inner-margin frame-properties))))

			(build-string				
				(generate-css-frame-colors name bg-color color)
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
												border-color
												text-align))
										main-heights)))))
	



(define (generate-page-css-frames)
	(display "generate-page-css-frames start") (newline)
	;;(throw-exception 'kossa '((k . 56)) #f)
	
	(let ((dash-width (cdr (assoc 'dash-width frame-properties)))
			(border-margin (cdr (assoc 'border-margin frame-properties)))
			(inner-margin (cdr (assoc 'inner-margin frame-properties)))
			
			(page-width (cdr (assoc 'total-width page-properties)))
			(top-margin (cdr (assoc 'top-margin page-properties)))
			(frames-margin (cdr (assoc 'frames-margin frame-properties)))
			
			(header-properties (cdr (assoc 'header frames-properties)))
			(menu-properties (cdr (assoc 'menu frames-properties)))
			(main-properties (cdr (assoc 'main frames-properties)))
			(footer-properties (cdr (assoc 'footer frames-properties))))
		
			(display "generate-page-css-frames 2") (newline)
		
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
					(cdr (assoc 'border-color header-properties))
					"center")
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
					(cdr (assoc 'color menu-properties)) 			;; color
					#f
					)
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
					(cdr (assoc 'color main-properties)) 			;; color
					#f
					)
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
					(cdr (assoc 'color footer-properties)) 			;; color
					#f
					)
				)))
	;;(display "generate-page-css-frames end") (newline) "tmp"
	)
				
				
				
				


;; -----------------------------------------------------------------------------------
;; -----------------------------------------------------------------------------------
;; -----------------------------------------------------------------------------------
;; -------------------------------- HTML CODE ----------------------------------------
;; -----------------------------------------------------------------------------------

(define page-name #f)


(define (set-current-page-name sym)
	(set! page-name sym)
	"")

(define (generate-html-frames-begin frame-name use-number-name)
	(let ((number-str (if use-number-name (build-string "-"
													(get-number-property 'main-height (get-property page-name main-pages-properties))
													) "")))
  	 (build-string
		"<div id=\"" frame-name number-str "\" class=\"" frame-name "-colors\">" #\newline
		"<div id=\"" frame-name number-str "-dashed\">" #\newline
		"<div id=\"" frame-name number-str "-inner\">" #\newline
         ))
)

(define (generate-html-frames-end)
	(build-string
		"</div>" #\newline
		"</div>" #\newline
		"</div>" #\newline
	)
)

(define (generate-html-menu)
	(build-string (generate-html-frames-start 'menu #t))
		
		
)

(define (generate-html-header)
	(build-string
		(generate-html-frames-start 'header #t)
		"<img src="bilder/lappsidan.gif" alt="Lappsidan" />"
	)
)

(define (generate-html-head) #f
)

(define (generate-unusable-menu-li properties)
	(build-string
		"<li class=\"unusable-link\">" #\newline
		(get-property 'link-name (cdr properties)) #\newline
		"</li>" #\newline
	))
		

(define (generate-menu-li properties)
	(let ((link-name (get-property 'link-name (cdr properties)))
		  (link-title (get-property 'link-title (cdr properties)))
		  )
	(build-string
		"<li>" #\newline
		"<a class=\"menu-link\" href=\"" (symbol->string (car properties)) ".html\" title=\"" link-title "\">" #\newline
		link-name #\newline
		"</a>" #\newline
		"</li>" #\newline
	)))


(define (generate-mini-gallery-td filename)
	(build-string
		"<td>" #\newline
		"<a href=\"galleri/" filename ".html\" "
			"title=\"f&ouml;rstora\">" #\newline
			"<img src=\"galleri-mini/" filename ".jpg\" />" #\newline
		"</a>"
		"</td>" #\newline
		))



		





					
					
					
	
	