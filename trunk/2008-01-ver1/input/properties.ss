


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

;; beskrivning/namn av/på egenskaperna
(define gallery-list-properties-define '(
	(number-of-photos . "antal foton")
	(name . "namn")
	(type . "mönstertyp")
	(size . "storlek")
	(year . "tillverkningsår")
	(status . "status")
		;; private, for-sale, sold
	(price . "pris")
	(price1 . "pris omonterat")
	(price2 . "prisex. färdigt")
	(photo . "Foto")
	))
	
(define patchwork-status-text '(
	(private . "Privat &auml;go")
	(for-sale . "Till salu")
	(sold . "Sålt")
	))


;; Galleri
(define gallery-list
	'(
	  ("tacke" "Lapptäcke" (
		((number-of-photos . 2) 		;; tacke 1
		 (name . "Regnb&aring;ge")
		 (type . "Tegelv&auml;gg")
		 (size . "180*140 cm")
		 (year . "2006")
		 (status . private)
		 (photo . "B. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 2
		 (name . "sexkanter")
		 (type . "Mall, applikation")
		 (size . "150*200 cm")
		 (year . "1999")
		 (status . private)
		 (photo . "B. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 3
		 (name . "vittvitt")
		 (type . "Stickt&auml;cke")
		 (size . "150*200 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price . "6000:-")
		 (photo . "J. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 4
		 (name . "Niohundrasjuttiotv&aring;")
		 (type . "Rucklarens v&auml;g")
		 (size . "150*200 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price . "3780:-")
		 (photo . "J. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 5
		 (name . "Tradition")
		 (type . "Blockhus")
		 (size . "150*200 cm")
		 (year . "1998")
		 (status . private)
		 (photo . "J. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 6
		 (name . "Stj&auml;rnt&auml;cke")
		 (type . "Mallar")
		 (size . "150*200 cm")
		 (year . "1998")
		 (status . private)
		 (photo . "J. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 7
		 (name . "Emmas Dopt&auml;cke")
		 (type . "Moe's Basket")
		 (size . "70*50 cm")
		 (year . "2007")
		 (status . private)
		 (photo . "U. Nyl&eacute;n, Linn Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 8
		 (name . "Pippi")
		 (type . "Hexagon")
		 (size . "135*102 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price1 . "850 kr")
		 (price2 . "1400 kr")
		 (photo . "U. Nyl&eacute;n, Linn Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 9
		 (name . "Gul Hypnos")
		 (type . "Moe's Basket")
		 (size . "135*102 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price1 . "850 kr")
		 (price2 . "1400 kr")
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 10
		 (name . "Vildkatt")
		 (type . "Hexagon")
		 (size . "135*102 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price1 . "1100 kr")
		 (price2 . "2730 kr")
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 11
		 (name . "R&ouml;dgr&ouml;n R&ouml;ra")
		 (type . "Tegelv&auml;gg")
		 (size . "180*140 cm")
		 (year . "2007")
		 (status . private)
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 1)			;; tacke 12
		 (name . "Linns t&auml;cke")
		 (type . "Travade kuber")
		 (size . "70*50 cm")
		 (year . "2007")
		 (status . private)
		 (photo . "J. S&ouml;derberg")
		)
		))
	  ("exempel" "Exempel" (		
		((number-of-photos . 1)		 
		 (text . "Alla uppskattar ett <br />
					varmt lappt&auml;cke. <br />
					Speciellt om man inte har <br />
					s&aring; mycket p&auml;ls."))
		))
	))

