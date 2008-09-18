(define (build-string . args)
	(define (convert-char c)
		(case c
			(#\å "&aring;")
			(#\ä "&auml;")
			(#\ö "&ouml;")
			(else (string c))))		
	(define (handle-arg arg)
      (cond
        ((string? arg) (apply string-append (map convert-char (string->list arg))))
        ((char? arg) (convert-char arg))
        ((number? arg) (number->string arg))
		((list? arg) (apply build-string arg))
		((not arg) "")
        (else (begin
				;;(display " ") (display arg)
				(error 'build-string "invalid arg passed to build-string")))))
  (define (build-rec args)
	;;(display "*")
	(cond
		((null? args) "")
		;;((void? arg) (build-rec (cdr args)))
		(else (string-append
					(handle-arg (car args))
					(build-rec (cdr args))))))
  (build-rec args))

(define (substring-none-fastidious str start end)
	(let ((str-length (string-length str)))		
		(if (< start 0) (set! start 0))
		(if (> end str-length) (set! end str-length))
		(if (or (>= start str-length) (<= end 0)) "" (substring str start end))))
			
		