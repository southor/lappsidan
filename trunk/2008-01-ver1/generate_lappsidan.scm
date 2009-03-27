(include "NDup\Scripting\Scheme\Extension\WinDirLib")

(load "input\page.scm")

(let ((env (scheme-report-environment)))
	(include "Reg\Free\SweTorbjornSoderberg1\SSWPG\Processer")
	(process-input-directory "input" "output" '("css" "html") '("jpg" "gif") env))