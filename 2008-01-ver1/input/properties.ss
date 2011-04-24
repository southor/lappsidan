


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
	(index . 		((main-height . 800)	(link-name . "startsidan")			(link-title . "startsidan")))
	(historia . 	((main-height . 800)	(link-name . "historia")			(link-title . "lappt&auml;ckets historia")))	
	(tillverkning . ((main-height . 3000)	(link-name . "tillverkning")		(link-title . "tillverkningsprocessen")))	
	(galleri . 		((main-height . 7000)	(link-name . "galleri")				(link-title . "exempelt&auml;cken")))	
	(salu . 		((main-height . 2000)	(link-name . "till salu")			(link-title . "lappt&auml;cken till salu")))	
	(bestallning . 	((main-height . 800)	(link-name . "best&auml;llning")	(link-title . "best&auml;llning av lappt&auml;cken")))	
	(kontakt . 		((main-height . 800)	(link-name . "kontakt")				(link-title . "e-post")))	
	))

;; beskrivning/namn av/på egenskaperna
(define gallery-list-properties-define '(
	(number-of-photos . "antal foton")
	(name . "Namn")
	(pattern . "Mönster")
	(size . "Storlek")
	(year . "Tillverkningsår")
	(status . "Status")
		;; private, for-sale, sold
	(price . "Pris")
	(price1 . "Pris omonterat")
	(price2 . "Prisex. färdigt")
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
		 (pattern . "Tegelv&auml;gg")
		 (size . "180*140 cm")
		 (year . "2006")
		 (status . private)
		 (photo . "B. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 2
		 (name . "sexkanter")
		 (pattern . "Mall, applikation")
		 (size . "150*200 cm")
		 (year . "1999")
		 (status . private)
		 (photo . "B. S&ouml;derberg")
		)
		((number-of-photos . 2)			;; tacke 3
		 (name . "vittvitt")
		 (pattern . "Stickt&auml;cke")
		 (size . "150*200 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price . "5530 kr")
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 4
		 (name . "Niohundrasjuttiotv&aring;")
		 (pattern . "Rucklarens v&auml;g")
		 (size . "150*200 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price . "3780 kr")
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 5
		 (name . "Tradition")
		 (pattern . "Blockhus")
		 (size . "150*200 cm")
		 (year . "1996")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 6
		 (name . "Stj&auml;rnt&auml;cke")
		 (pattern . "Mallar")
		 (size . "150*200 cm")
		 (year . "1998")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 7
		 (name . "Emmas Dopt&auml;cke")
		 (pattern . "Moe's Basket")
		 (size . "70*50 cm")
		 (year . "2007")
		 (status . private)
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 8
		 (name . "Pippi")
		 (pattern . "Hexagon")
		 (size . "135*102 cm")
		 (year . "2007")
		 (status . private)
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 9
		 (name . "Gul Hypnos")
		 (pattern . "Moe's Basket")
		 (size . "135*102 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price1 . "850 kr")
		 (price2 . "1400 kr")
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 10
		 (name . "Vildkatt")
		 (pattern . "Hexagon")
		 (size . "135*102 cm")
		 (year . "2007")
		 (status . for-sale)
		 (price1 . "1100 kr")
		 (price2 . "2730 kr")
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 2)			;; tacke 11
		 (name . "R&ouml;dgr&ouml;n R&ouml;ra")
		 (pattern . "Tegelv&auml;gg")
		 (size . "180*140 cm")
		 (year . "2007")
		 (status . sold)
		 (photo . "U. Nyl&eacute;n")
		 )
		((number-of-photos . 1)			;; tacke 12
		 (name . "Linns täcke")
		 (pattern . "Travade kuber")
		 (size . "70*50 cm")
		 (year . "2007")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 13
		 (name . "Ulrica&Anders bröllopstäcke")
		 (pattern . "Jakobs stege")
		 (size . "180*140 cm")
		 (year . "2006")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 1)			;; tacke 14
		 (name . "Marimekko")
		 (pattern . "Hexagon, ")
		 (size . "60*80 cm")
		 (year . "2008")
		 (status . for-sale)
		 (price1 . "850 kr")
		 (price2 . "1150kr")
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 15
		 (name . "Äntligen")
		 (pattern . "Hexagon")
		 (size . "230*165 cm")
		 (year . "2008")
		 (status . sold)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 16
		 (name . "Vinternatt")
		 (pattern . "Moses korg")
		 (size . "195*155 cm")
		 (year . "2008")
		 (status . sold)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 17
		 (name . "Spiraler")
		 (pattern . "Blockhus, modifierat")
		 (size . "100*150 cm")
		 (year . "2008")
		 (status . sold)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 2)			;; tacke 18
		 (name . "Sabrines täcke")
		 (pattern . "Hexagon")
		 (size . "65*55 cm")
		 (year . "2009")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 2)			;; tacke 19
		 (name . "Selmas täcke")
		 (pattern . "Jakobs stege")
		 (size . "70*50 cm")
		 (year . "2006")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		)
		((number-of-photos . 1)			;; tacke 20
		 (name . "Caterina Valente")
		 (pattern . "Fritt")
		 (size . "105*139 cm")
		 (year . "1998")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 21
		 (name . "Ingela&Valentins Bröllopstäcke")
		 (pattern . "Rutor")
		 (size . "110*145 cm")
		 (year . "2009")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 22
		 (name . "Elisabeths&Gustavs bröllopstäcken")
		 (pattern . "Tegelvägg")
		 (size . "100*150 cm")
		 (year . "2009")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 23
		 (name . "Vår")
		 (pattern . "Hexagon")
		 (size . "100*150 cm")
		 (year . "2009")
		 (status . sold)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 24
		 (name . "Rester")
		 (pattern . "Remsor")
	     (year . "2009")
		 (status . for-sale)
		 (price1 . "925 kr")
		 (price2 . "1545kr")
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 25
		 (name . "Marias doptäcke")
		 (pattern . "Cirklar")
		 (size . "40*60 cm")
		 (year . "2010")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 2)			;; tacke 26
		 (name . "Ylvas täcke")
		 (pattern . "Cirklar")
		 (size . "40*60 cm")
		 (year . "2010")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 27
		 (name . "Eriks doptäcke")
		 (pattern . "Cirklar")
		 (size . "40*60 cm")
		 (year . "2010")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 2)			;; tacke 28
		 (name . "Spiraler till Ebba och Robert")
		 (pattern . "Spiral")
		 (size . "145*160 cm")
		 (year . "2010")
		 (status . sold)
		 (photo . "J. W&auml;ngberg")
		 )
		((number-of-photos . 1)			;; tacke 29
		 (name . "Julias täcke")
		 (pattern . "Hexagon")
		 (size . "100*80 cm")
		 (year . "2011")
		 (status . private)
		 (photo . "J. W&auml;ngberg")
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

