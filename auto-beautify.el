;;; auto-beautify --- auto format you js/jsx file

;; Author: quanwei9958@126.com
;; Version: 0.0.1
;; Package-Requires: ((web-beautify))


;;; Code:

(require 'web-beautify)

(defun auto-beautify-when-enter (&optional)
  " eval web-beautify when type enter "
  (interactive)
  (newline-and-indent)
  (save-excursion
    (line-move -1)
    (web-beautify-format-region web-beautify-js-program (line-beginning-position) (line-end-position))))

(defun auto-beautify-when-branck (&optional)
  "eval web-beautify when region"
  (interactive)
  (insert-char 125)
  (save-excursion
    (web-beautify-format-region
     web-beautify-js-program
     (scan-lists (point) -1 0)
     (point)))
  (forward-list))


(defvar auto-beautify-keymap (make-sparse-keymap))
(define-key auto-beautify-keymap (kbd "RET") 'auto-beautify-when-enter)
(define-key auto-beautify-keymap (kbd "}") 'auto-beautify-when-branck)

(define-minor-mode auto-beautify-mode
  "auto-beautify you js/jsx"
  nil
  " AB "
  auto-beautify-keymap)

(provide 'auto-beautify)


;;; end of auto-beautify
