; Doxygen font lock by Andrew Kensler
(defconst doxygen-font-lock-doc-comments
  `(("\\([\\@].*?\\)\\s-"
     1 breese-font-lock-doc-keyword-face prepend nil)
    ("\\[in\\]\\|\\[out\\]\\|\\[in,out\\]"
     0 breese-font-lock-doc-argument-face prepend nil)
    ("\\<\\(?:[a-zA-Z_][a-zA-Z0-9_]*::\\)*[a-zA-Z_][a-zA-Z0-9_]*()"
     0 font-lock-constant-face prepend nil)))
(defconst doxygen-font-lock-keywords
  `((,(lambda (limit)
        (c-font-lock-doc-comments "/\\*[*!]<?" limit
				  doxygen-font-lock-doc-comments)
        (c-font-lock-doc-comments "//[/!]<?" limit
				  doxygen-font-lock-doc-comments)))))

; Own C/C++ mode
(defconst breese-c-style
  '("gnu"
    (c-offsets-alist
     . ((substatement-open . 0)
	(innamespace . 0)
	(brace-list-open . 0)
	(arglist-intro . +)))
    (prettify-symbols-alist
     . (("!=" . ?≠)
	("<=" . ?≤)
	(">=" . ?≥)
	("->" . ?⟹)))
    (c-basic-offset . 4)
    (indent-tabs-mode . nil)
    (c-doc-comment-style . doxygen))
  "breese C/C++ style")
(c-add-style "breese" breese-c-style)

; Dynastrom C/C++ mode
(defconst dynastrom-c-style
  '("breese")
  "Dynastrom C/C++ style")
(c-add-style "dynastrom" dynastrom-c-style)

;; Maidsafe style
;(require 'google-c-style)
;(c-add-style "google" google-c-style)
;(defconst maidsafe-c-style
;  '("google")
;  "MaidSafe.org style")
;(c-add-style "maidsafe" maidsafe-c-style)

; Select different styles depending of project path
; http://www.emacswiki.org/emacs/ProjectSettings
(setq c-style-variables-are-local-p t)
(defun my-select-c-style ()
  (let ((bname (buffer-file-name)))
    (cond
     ; Most specific must be first
     ((string-match "src/aros/" bname) (c-set-style "dynastrom"))
     ((string-match "src/transenna/" bname) (c-set-style "dynastrom"))
;     ((string-match "src/maidsafe/" bname) (c-set-style "maidsafe"))
     ; Catch all
     ((string-match "" bname) (c-set-style "breese"))
     )))
(add-hook 'c-mode-common-hook 'my-select-c-style)

(provide 'breese-style)
