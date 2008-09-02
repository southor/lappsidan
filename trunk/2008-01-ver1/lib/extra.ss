(define (assert expr)
	(if expr #t
		(let
			((os (open-output-string)))
			(write "assertion-failed: " os)
			(write expr os)
			(error (get-output-string string-output-port)))))
			
(define (memf cmp-fun obj list)
	(define (mem-rec list)
		(if (null? list) #f
			(if (cmp-fun obj (car list))
				list
				(mem-rec (cdr list)))))
	(mem-rec list))
	
(define eof-obj? eof-object?)

(define (eval-list-return-last list)
	(define (eval-rec value list)
		(if (null? list) value
			(eval-rec (eval (car list)) (cdr list))))
	(if (null? list) (error "error in eval-list-return-last, list must have a length of at least one")
		(eval-rec (eval (car list)) (cdr list))))
	
			
