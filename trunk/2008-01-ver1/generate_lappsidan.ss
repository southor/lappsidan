

(load "lib\\SSWPG.ss")
 
(display "char: ") (display (char? #\newline)) (newline)
(process-all "input" "output" '("css" "html") '("jpg" "gif" "pdf") "input\\page.ss")