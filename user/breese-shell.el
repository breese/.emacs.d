(provide 'breese-shell)

(use-package term
  :defer t
  :config
  ; Select which shell to run
  (defalias 'my-term (lambda () (interactive) (ansi-term (getenv "SHELL"))))
  ; Exit silently when active shells exists
  (defun my-term-kill-without-query ()
    (let ((proc (get-buffer-process (current-buffer))))
      (when (processp proc)
	(set-process-query-on-exit-flag proc nil))))
  (defun my-dirtrack ()
      (setq-local frame-title-format '("%b : " default-directory)))
  ; Enable highlighting of errors
  (defun my-term-setup ()
    (compilation-shell-minor-mode t))
  (add-hook 'term-mode-hook
	    (lambda ()
	      (setq mode-name "Shell")
	      ; Overwrite modeline with current directory
	      (when (bound-and-true-p shell-dirtrack-mode)
		(shell-dirtrack-mode nil))
	      (set-variable 'dirtrack-list '("^.*[^ ]+:\\(.*\\)>" 1 nil))
	      (dirtrack-mode 1)
	      ; FIXME: How to force update? (like M-x dirs)
	      ;(add-hook 'comint-preoutput-filter-functions 'my-dirtrack)
	      ; FIXME: Move to vc-mode in modeline instead?
	      (my-dirtrack)))
  ; Do not echo passwords
  (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
  (setq comint-prompt-read-only t)
  :hook ((term-exec . my-term-kill-without-query)
	 (term-mode . my-term-setup))
  :bind
  (("<f10>" . my-term)
   ("C-<f10>" . my-term))
  )

; Line mode
;(defadvice ansi-term (after advice-term-line-mode activate)
;  (term-line-mode))

; Maximum size
;(setq comint-buffer-maximum-size 1024)
;(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

; Clear buffer
(defun my-term-clear ()
  (interactive)
  (delete-region (point-min) (point-max))
  (comint-send-input))
; Bind to ctrl-l
(defun my-term-key-clear ()
  (interactive)
  (local-set-key (kbd "C-l") 'my-term-clear))
(add-hook 'term-mode-hook 'my-term-key-clear)
