;;; cdecl.el --- run cdecl
;;
;; ~/share/emacs/pkg/cdecl/cdecl.el ---
;;
;; $Id: cdecl.el,v 1.2 2011/10/20 07:00:15 harley Exp $
;;
;;; Commentary:
;;  URL: http://www.panix.com/~harley/elisp/cdecel.el
;;  simple interface to cdecel.
;;  http://cdecl.org/

;;; Code:

(defvar cdecl-program "cdecl"
  "The program to run.")

(defun cdecl-explain (expr)
  "Run cdecel 'explain' on EXPR."
  (interactive "sExpr: \n")
  (let ((buf (get-buffer-create " *cdecl*"))
        (cmd (concat
              "echo 'explain " expr "' |"
              cdecl-program)))
    (save-excursion
      (set-buffer buf)
      (erase-buffer)
      (call-process-shell-command cmd nil buf t nil))
    (switch-to-buffer-other-window buf)
    (shrink-window-if-larger-than-buffer)))

(defun cdecl-explain-region (r-s r-e)
  (interactive "r")
  (cdecl-explain (buffer-substring-no-properties r-s r-e)))

;; (cdecl-explain "int * foo")
;; int (*(*foo)(void))[3]

(provide 'cdecl)

;;; cdecl.el ends here
