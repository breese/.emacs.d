(provide 'breese-complete)

; Helm
(use-package helm
  :ensure t
  :diminish helm-mode
  :init
  (progn
    (require 'helm-config)
    (setq
     helm-move-to-line-cycle-in-source t
     )
    (customize-set-variable 'helm-skip-boring-buffers t)
    (customize-set-variable 'helm-boring-buffer-regexp-list '("^ \\*" "\\*Messages" "^\\*helm"))
    (customize-set-variable 'helm-ff-skip-boring-files t)
    ;; Would like to ignore current and parent directory but this is
    ;; not allowed according to
    ;;   https://github.com/emacs-helm/helm/issues/924
    ;(setq helm-boring-file-regexp-list '("\\/\\.$" "\\/\\.\\.$"))
    (helm-mode))
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("C-x b" . helm-mini)
  )

(use-package helm-swoop
  :ensure t
  :config
  (setq helm-swoop-split-direction 'split-window-horizontally)
  :bind
  ("C-M-s" . helm-swoop-from-isearch)
  ("<f11>" . helm-multi-swoop-projectile)
  ("S-<f11>" . helm-projectile-grep)
  )

(require 'cl)
(defun breese-remove-files (files)
  (if (listp files)
      (remove-if (lambda (file) (helm-dir-is-dot (car file))) files)
    files))

(with-eval-after-load 'helm-files
  (define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
  ; Disable current and parent directories
  (advice-add 'helm-find-files-get-candidates
              :filter-return #'breese-remove-files))

(use-package helm-ls-git
  :ensure t
  :bind
  ("C-x C-d" . helm-browse-project)
  )

; Auto-complete
(use-package auto-complete
  :ensure t
  :commands auto-complete-mode
  :diminish auto-complete-mode
  :init
  (progn
    (auto-complete-mode t))
  :config
  (progn
    (use-package auto-complete-config)
    (ac-config-default)
    (setq ac-ignore-case t)
    (setq ac-modes '(c-mode cc-mode c++-mode latex-mode))
    (ac-set-trigger-key "C-<tab>")
    )
  )

(use-package ac-helm
  :ensure ac-helm
  :bind
  ("C-:" . ac-complete-with-helm)
  )

(setq completion-ignore-case t)

; Projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'default)
  (setq projectile-project-compilation-cmd "(cd ../build; make)")
  (setq projectile-project-test-cmd "(cd ../build; make test)")
  (defun my-projectile-mode ()
    (setq-local my-projectile-mode-line (projectile-project-name))
    (setq-local my-projectile-has-mode-line t)
    )
  (add-hook 'prog-mode-hook 'my-projectile-mode)
  :bind
  ("C-X C-l" . projectile-find-file)
  ("<f1>" . projectile-find-other-file)
  ("<f9>" . projectile-compile-project)
  ("C-<f9>" . projectile-test-project)
  ;("<f11>" . projectile-multi-occur)
  ;("S-<f11>" . projectile-grep)
  )
(use-package helm-projectile
  :ensure t)

; RTags
;(use-package rtags
;  :ensure t
;  :config
;  (progn
;    (setq rtags-use-helm t)
;    ;(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
;    )
;  :bind
;; FIXME: Find other bindings
;  ("<f2>" . rtags-print-class-hierarchy)
;  ("<f4>" . rtags-find-symbol-at-point)
;  ("<S-f4>" . rtags-find-references-at-point)
;  ; FIXME: rtags-rename-symbol, rtags-get-include-file-for-symbol
;  )
;(use-package rtags-ac
;  :config
;  (progn
;    (if (featurep 'auto-complete)
;	(progn
;	  (add-hook 'c-mode-common-hook
;		    (lambda ()
;		      (add-to-list 'ac-sources 'ac-source-rtags)))
;	  ;(setq rtags-completions-enabled t)
;	  ;(setq rtags-autostart-diagnostics t)
;	  ))
;    ))

; Yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (progn
    (setq yas-verbosity 1)
    (add-hook 'prog-mode-hook 'yas-minor-mode)
    ;(add-to-list 'yas-snippet-dirs (concat user-emacs-directory (file-name-as-directory "snippets")))
    ; Ignore system-installed snippets
    (setq-default yas-snippet-dirs (list (concat user-emacs-directory (file-name-as-directory "snippets"))))
    ; Disable tab completion
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    ; Auto-complete integration
    (if (featurep 'auto-complete)
	(add-to-list 'ac-sources 'ac-source-yasnipppet))
    (yas-reload-all)
    )
  )
