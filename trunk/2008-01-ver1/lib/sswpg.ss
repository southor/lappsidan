
(load "lib\\dir_lib.ss")
(load "lib\\extra.ss")








(define (process-all input-folder output-folder preprocess-file-types move-file-types input-ss-file)
	(define preprocess-file-generate  
        (let ()
            (load input-ss-file) ;; to be availible at evaluation
            (lambda (input-path output-path input-file)
                (set-top-level-value! 'import-file
                   (lambda (filename) (let ((full-input-path (path-append input-path filename))
											(full-output-path (path-append input-path filename)))
                                         (preprocess-file-generate (path-parent full-input-path) (path-parent full-output-path) full-input-path)))) ;; to be availible at evaluation
				(set-top-level-value! 'get-current-output-directory (lambda () output-path))
				;; (set-top-level-value! 'get-current-filename (lambda () input-file))
				(let ((input (open-input-file input-file))
                      (str '())
						)
					(do ((char (read-char input) (read-char input)))
   						((eof-obj? char) 'ok)
						(if (char=? char #\#)
							(begin
								(set! char (read-char input))
								(if (char=? char #\#)
										(begin
											;;(display "special-eval-start") (newline)
											(set! str (cons (eval-list-return-last (read input)) str)) ;; evaluation
											;;(display "special-eval-end") (newline)
										)
										(begin
                                            (set! str (cons "#" str))
                                            (set! str (cons char str))
											)))
                            (set! str (cons char str))
							))
					(close-input-port input)   
                    (apply build-string (reverse str))
				))))
		

;;	(define preprocess-file
;;		(let ()		
;;			(load input-ss-file) ;; to be availible at evaluation
;;			(lambda (input-path input-file output-file)
;;				(assert (string=? (get-filename-extension input-file) (get-filename-extension output-file)))
;;				
;;				;;(display "	(preprocessing) writing to file: ") (display output-file) (newline)
;;				
;;				(let ((input (open-input-file input-file))
;;						(output (open-output-file output-file))
;;						(get-current-path (lambda () input-path)) ;; to be availible at evaluation
;;						(get-current-filename (lambda () input-file)) ;; to be availible at evaluation
;;						)
;;					(do ((char (read-char input) (read-char input)))
;;							((eof-obj? char) 'ok)
;;							(if (char=? char #\#)
;;								(begin
;;									(set! char (read-char input))
;;									(if (char=? char #\#)
;;											(begin
;;												;;(display "special-eval-start") (newline)
;;												(display (eval-list-return-last (read input)) output) ;; evaluation
;;												;;(display "special-eval-end") (newline)
;;											)
;;											(begin
;;												(write-char #\# output)
;;												(write-char char output)
;;												)))
;;								(write-char char output)
;;								))
;;					(close-input-port input)
;;					(close-output-port output)
;;					))))

	(define (move-file input-path output-path input-file output-file)
		(assert (string=? (get-filename-extension input-file) (get-filename-extension output-file)))
	
		;;(display "	(moving) writing to file: ") (display output-file) (newline)
	
		(let ((input (open-input-file input-file))
				(output (open-output-file output-file))
				)
			(do ((char (read-char input) (read-char input)))
					((eof-object? char) 'ok)
					(write-char char output)
					)
			(close-input-port input)
			(close-output-port output)
			))
	
	(define (preprocess-move-action input-path output-path input-filename output-filename)
		(define (handle-file action-fun)
			(if (find-file output-filename) (delete-file output-filename)
			)
			(action-fun input-path output-path input-filename output-filename))
		(let ((filename-extension (get-filename-extension input-filename)))
			;;(display filename-extension) (newline)
			
			(cond ((memf string-ci=? filename-extension preprocess-file-types)
						(display "processing file: ") (display input-filename) (newline)
						(handle-file preprocess-file))
					((memf string-ci=? filename-extension move-file-types)
						(display "moving file: ") (display input-filename) (newline)
						(handle-file move-file))
					(else 'ok))))
	
	(define (process-folder action-func)
		(define (clear-folder path)
			(for-each-file (lambda (x) (delete-file x)) path))
			
		(define (process-folder-rec folder-path)
   
  ;;  (write folder-path)
			(let ((currect-input-folder-path (path-append input-folder folder-path))
					(currect-output-folder-path (path-append output-folder folder-path)))
				;;(clear-folder currect-output-folder-path)
    
                           ;;(write " hejboka1 ")
				(for-each-file
					(lambda (filename)
						(action-func currect-input-folder-path currect-output-folder-path
									(path-append currect-input-folder-path filename)
									(path-append currect-output-folder-path filename)))
					currect-input-folder-path)
				(for-each-directory			
					(lambda (folder)
						;;(write folder) (newline)
						;;(write input-folder-path) (newline)
						;;(write (path-append input-folder-path folder)) (newline)
						(if (not (string-ci=? (path-extension folder) "svn"))
							(begin
								(create-directory (path-append currect-output-folder-path folder))
								(process-folder-rec (path-append folder-path folder)))))
					currect-input-folder-path)))
		(process-folder-rec ""))
 
  
         (define (preprocess-file input-path output-path input-file output-file)
				(assert (string=? (get-filename-extension input-file) (get-filename-extension output-file)))
				
				(display "	(preprocessing) writing to file: ") (display output-file) (newline)
				
				(let ((output (open-output-file output-file)))
                                    ;;(display "okej0")
  			            (display (preprocess-file-generate input-path output-path input-file) output)
                                    ;; (display "okej2")
               			    (close-output-port output)
     
                              ;; (display "okej3")
                			))
	
	(display "----- SSWPG Processer ----") (newline)
	(display "input folder: ") (display input-folder) (newline)
	(display "output folder: ") (display output-folder) (newline)
	(display "input scheme file: ") (display input-ss-file) (newline)
	(display "preprocess-file-types: ") (display preprocess-file-types) (newline)
	(display "move-file-types: ") (display move-file-types) (newline)
	(display "-- processing start --") (newline)
	
	;;(display " test1") (newline)
	;;(eval-list-return-last '((generate-page-width)))
	;;(display " test2") (newline)
	;;(display (memv "css" preprocess-file-types))
	(process-folder preprocess-move-action)
  )

