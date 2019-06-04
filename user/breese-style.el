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
  '("bsd"
    (c-offsets-alist
     . (
	(innamespace . 0)
	))
    (prettify-symbols-alist
     . (("!=" . ?≠)
	("<=" . ?≤)
	(">=" . ?≥)
	;("->" . ?⟹)
	))
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

;; Roku style
(use-package google-c-style
  :ensure t
  :init
  (progn
    (c-add-style "google" google-c-style)
    (defconst roku-c-style
      '("google"
	(c-offsets-alist
	 . ((access-label . -)
	    (case-label . 0)
	    (inher-intro . 4)
	    ))
	(c-basic-offset . 4)
	)
      "Roku Inc style")
    (c-add-style "roku" roku-c-style)
    ))

; Select different styles depending of project path
; http://www.emacswiki.org/emacs/ProjectSettings
(setq c-style-variables-are-local-p t)
(defun my-select-c-style ()
  (let ((bname (buffer-file-name)))
    (cond
     ; Most specific must be first
     ((string-match "src/aros/" bname) (c-set-style "dynastrom"))
     ((string-match "src/transenna/" bname) (c-set-style "dynastrom"))
     ((string-match "src/roku/" bname) (c-set-style "roku"))
     ; Catch all
     ((string-match "" bname) (c-set-style "breese"))
     )))
(add-hook 'c-mode-common-hook 'my-select-c-style)

(provide 'breese-style)
