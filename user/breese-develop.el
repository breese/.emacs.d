(provide 'breese-develop)

; Handle .ipp (implementation header) as C++
(add-to-list 'auto-mode-alist '("\\.ipp$" . c++-mode))
; Handle .h as C++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
; Octave
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

; High-light current line
(add-hook 'c-mode-common-hook
          (lambda () (hl-line-mode t)))
(add-hook 'TeX-mode-hook
	  (lambda () (hl-line-mode t)))

; Always enable line numbers in the margin
(add-hook 'c-mode-common-hook 'linum-mode)

(use-package compile
  :ensure t
  :init
  (progn
    ; Compile without prompt
    (setq compilation-read-command nil))
  :config
  (progn
    ; Mode-specific bindings
    (bind-key "<escape>" #'kill-compilation compilation-mode-map))
  )

; Code formatting
; Prerequisite: clang-format OS package installed
(use-package clang-format
  :ensure t
  :bind
  ("<f4>" . clang-format-region)
  ("S-<f4>" . clang-format-buffer)
  )

; Modern C++ font-lock mode
(use-package modern-cpp-font-lock
  :ensure t
  :diminish modern-c++-font-lock-mode)

; Enable prettified symbols
;(add-hook 'c-mode-common-hook 'prettify-symbols-mode)
(global-prettify-symbols-mode t)

; Asciidoc
(use-package adoc-mode
  :ensure t
  :mode "\\.adoc$")
