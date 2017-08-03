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

;;; License
;;
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
