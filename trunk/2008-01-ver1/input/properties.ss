


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
	(start . 		((main-height . 1200)	(link-name . "startsidan")			(link-title . "startsidan")))
	(historia . 	((main-height . 800)	(link-name . "historia")			(link-title . "lappt&auml;ckets historia")))	
	(tillverkning . ((main-height . 3000)	(link-name . "tillverkning")		(link-title . "tillverkningsprocessen")))	
	(galleri . 		((main-height . 3000)	(link-name . "galleri")				(link-title . "exempelt&auml;cken")))	
	(salu . 		((main-height . 800)	(link-name . "till salu")			(link-title . "lappt&auml;cken till salu")))	
	(bestallning . 	((main-height . 800)	(link-name . "best&auml;llning")	(link-title . "best&auml;llning av lappt&auml;cken")))	
	(kontakt . 		((main-height . 800)	(link-name . "kontakt")				(link-title . "e-post")))	
	))

;; täcken
(define gallery-list
	'(
	  ("tacke" . (
		((number-of-photos . 2)
		 (text . "T&auml;cke 1 <br />
							Regnb&aring;ge <br />
							Tegelv&auml;gg <br />
							180*140 cm <br />
							2006 <br />
							Privat &auml;go <br />
							Foto: B. S&ouml;derberg"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 2 <br />
							Sexkanter <br />
							Mall, applikation <br />
							150*200 cm<br />
							1999 <br />
							Privat &auml;go <br />
							Foto: B. S&ouml;derberg"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 3 <br />
							Vittvitt <br />
							Stickt&auml;cke <br />
							150*200 cm <br />
							2007 <br />
							Till Salu 6000:- <br />
							Foto: J. S&ouml;derberg <br />"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 4 <br />
							Niohundrasjuttiotv&aring; <br />
							Rucklarens v&auml;g <br />
							150*200 cm <br />
							2007 <br />
							Till Salu 3780:- <br />
							Foto: J. S&ouml;derberg <br />"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 5 <br />
							Tradition <br />
							Blockhus <br />
							150*200 cm <br />
							1998 <br />
							Privat &auml;go <br />
							Foto: J. S&ouml;derberg <br />"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 6 <br />
							Stj&auml;rnt&auml;cke <br />
							Mallar <br />
							150*200 cm <br />
							1998 <br />
							Privat &auml;go <br />
							Foto: J. S&ouml;derberg"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 7 <br />
							Emmas Dopt&auml;cke <br />
							Moe's Basket <br />
							70*50 cm <br />
							2007 <br />
							Privat &auml;go <br />
							Foto: U. Nyl&eacute;n <br />							
							Linn Nyl&eacute;n"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 8 <br /> 
							Pippi, 2007<br />
							Hexagon 135*102 cm<br />
							Till salu Omonterat: 850 kr <br />
							prisex. f&auml;rdigt 1400 kr <br />
							Foto: U. Nyl&eacute;n <br />							
							Linn Nyl&eacute;n"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 9 <br />
							Gul Hypnos <br />
							Moe's Basket <br />
							135*102 cm <br />
							2007 <br />
							Till salu Omonterat: 850 kr <br />
							prisex. f&auml;rdigt 1400 kr <br />
							Foto: U. Nyl&eacute;n <br />"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 10 <br />
							Vildkatt <br />
							Hexagon 2007 <br />
							135*102 cm <br />
							Till salu Omonterat: 1100 kr <br />
							prisex. f&auml;rdigt 2730 kr <br />
							Foto: U. Nyl&eacute;n <br />"))
		((number-of-photos . 2)
		 (text . "T&auml;cke 11 <br />
							R&ouml;dgr&ouml;n R&ouml;ra <br />
							Tegelv&auml;gg <br />
							180*140 cm <br />
							2007 <br />
							Privat &auml;go <br />
							Foto: U. Nyl&eacute;n"))
		((number-of-photos . 1)
		 (text . "T&auml;cke 12 <br />
							Linns t&auml;cke <br />
							Travade kuber <br />
							70*50 cm <br />
							2007 <br />
							Privat &auml;go <br />
							Foto: J. S&ouml;derberg"))
		))
	  ("exempel" . (		
		((number-of-photos . 1)
		 (text . "Alla uppskattar ett <br />
					varmt lappt&auml;cke. <br />
					Speciellt om man inte har <br />
					s&aring; mycket p&auml;ls."))
		))
	))

