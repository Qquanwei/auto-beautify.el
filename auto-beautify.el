;;; auto-beautify --- auto format you js/jsx file

;; Author: quanwei9958@126.com
;; Version: 0.0.2
;; Package-Requires: ((web-beautify "0.3.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Usage:
;; (add-hook 'js2-mode-hook 'auto-beautify-mode)
;;; Code:

(require 'web-beautify)

(defun auto-beautify-when-enter ()
  " eval web-beautify when type enter "
  (interactive)
  (newline-and-indent)
  (save-excursion
    (line-move -1)
    (web-beautify-format-region web-beautify-js-program (line-beginning-position) (line-end-position))))

(defun auto-beautify-when-branck ()
  "eval web-beautify when branck"
  (interactive)
  (insert-char 125)
  (save-excursion
    (web-beautify-format-region
     web-beautify-js-program
     (scan-lists (point) -1 0)
     (point)))
  (forward-list)
  (save-excursion
    (indent-region
     (scan-lists (point) -1 0)
     (point))))


(defvar auto-beautify-keymap (make-sparse-keymap))
(define-key auto-beautify-keymap (kbd "RET") 'auto-beautify-when-enter)
(define-key auto-beautify-keymap (kbd "}") 'auto-beautify-when-branck)

(define-minor-mode auto-beautify-mode
  "auto-beautify you js/jsx"
  nil
  " AB "
  auto-beautify-keymap)

(provide 'auto-beautify)


;;; auto-beautify.el ends here
