(load "lib\\str_lib.ss")

(define (for-each-file-entity fun path test-fun)
  (for-each
    (lambda (x) (if (test-fun (path-append path x)) (fun x)))
    (directory-list path)))

(define (for-each-file fun path)
  (for-each-file-entity fun path file-regular?))

(define (for-each-directory fun path)
  (for-each-file-entity fun path file-directory?))

(define (create-file filename)
	(let ((f (open-output-file filename)))
		(close-output-port f)))

(define (find-file path)
	(if (file-exists? path) (file-regular? path) #f))

(define (find-directory path)
	(if (file-exists? path) (file-directory? path) #f))
	
(define (create-directory dir)
	(if (not (find-directory dir)) (mkdir dir))
	'ok)

(define get-filename-extension path-extension)

(define (path-append . paths)	
	
	(define (get-first-char str) (string-ref str 0))
	(define (get-last-char str) (string-ref str (- (string-length str) 1)))
	
	(define (char-slash? char-fun str)
		(if (= (string-length str) 0)
				#t
				(let ((char (char-fun str)))
					(or (char=? char #\\) (char=? char #\/)))))
	
	(define (last-slash? str)
		(char-slash? get-last-char str))
	(define (first-slash? str)
		(char-slash? get-first-char str))		
	
	(define (remove-slashes str)
		(let ((start (if (first-slash? str) 1 0))
				(end (if (last-slash? str)
							(- (string-length str) 1)
							(string-length str))))
			(substring-none-fastidious str start end)))
		
	
	(define (path-append-rec paths)
		;;(display " ")
		;;(write paths)
		;;(display " ")
		(if (null? paths) '()
			(cons #\\ (cons (remove-slashes (car paths))
						(path-append-rec (cdr paths))))))
						
	;;(write " hecko ")
						
	(if (null? paths) '()
			(apply build-string (cdr (path-append-rec paths)))))
	



;;(define (delete-directory directory-path) #f)