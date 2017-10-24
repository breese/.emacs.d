(provide 'breese-theme)

; High-light selected text
(transient-mark-mode t)

; High-light matching parentheses
(show-paren-mode t)
(setq show-paren-style 'expression)

; Use path as part of display name if necessary
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Resize font
(set-face-attribute 'default (selected-frame) :height 97)

; Define custom faces for theme
(defface breese-font-lock-doc-keyword
  '((t (:inherit font-lock-doc-face)))
  "Documentation keyword face.")
(defvar breese-font-lock-doc-keyword-face 'breese-font-lock-doc-keyword)
(defface breese-font-lock-doc-argument
  '((t (:inherit font-lock-doc-face)))
  "Documentation keyword face.")
(defvar breese-font-lock-doc-argument-face 'breese-font-lock-doc-argument)

; Manually installed themes
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(load-theme 'visual-breese t)
