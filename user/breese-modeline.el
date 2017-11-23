(provide 'breese-modeline)

; Show lines and columns
(line-number-mode t)
(column-number-mode t)

; Place scroll bar on the right
(set-scroll-bar-mode 'right)

; Put "user@host:file" in frame title
(setq frame-title-format
      '("" user-login-name
	"@" system-name
	":" (buffer-file-name "%f" ("%b"))))

; Version control
(defadvice vc-mode-line (after strip-backend () activate)
  (when (stringp vc-mode)
    (let ((noback (replace-regexp-in-string 
                   (format "^ %s[-:]" (vc-backend buffer-file-name))
                   "" vc-mode)))
      (setq vc-mode noback))))

; Make projectile mode line buffer-local to prevent it from being evaluated all the time
(setq-default my-projectile-mode-line "")
(make-variable-buffer-local 'my-projectile-mode-line)

(setq my-mode-line-position "%l,%c")

;(setq-default mode-line-format
;      (list
;       mode-line-front-space
;       "%e"
;       mode-line-modified
;       " [" `my-projectile-mode-line ":" '(vc-mode vc-mode) "] "
;       ;mode-line-buffer-identification
;       "%b:%l,%c   "
;       mode-line-modes
;       ;mode-line-remote
;       mode-line-misc-info
;       mode-line-end-spaces
;       ))

; https://github.com/milkypostman/powerline/
(defun my-powerline-theme ()
  "Setup the default mode-line."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
		   (let* ((active (powerline-selected-window-active))
			  (mode-line (if active 'mode-line 'mode-line-inactive))
			  (sideface (if active 'powerline-active1 'powerline-inactive1))
			  (centerface (if active 'powerline-active2 'powerline-inactive2))
			  (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
							  (car powerline-default-separator-dir))))
			  (separator-right (intern (format "powerline-%s-%s"
							   (powerline-current-separator)
							   (cdr powerline-default-separator-dir))))
                          (lhs (list
				(powerline-raw mode-line-modified sideface 'l)
				(powerline-raw " " sideface 'l)
				(powerline-raw mode-line-buffer-identification sideface 'l)
				(powerline-raw " " sideface 'l)
				(powerline-raw my-mode-line-position sideface 'l)
				(funcall separator-left sideface sideface)))
			  (center (list
				   (powerline-raw " " sideface 'l)
				   (funcall separator-left sideface centerface)
				   (powerline-raw " " centerface)
				   (powerline-raw mode-line-modes centerface)
				   (powerline-raw " " centerface)
				   (powerline-raw mode-line-misc-info centerface)
				   (funcall separator-right centerface sideface)))
			  (rhs (list
				(funcall separator-right sideface sideface)
				(when my-projectile-mode-line ; FIXME: Does not work (neither does my-projectile-has-mode-line)
				  (concat
				   (powerline-raw " [" sideface)
				   (powerline-raw my-projectile-mode-line sideface)
				   (powerline-raw ":" sideface)
				   (powerline-raw '(vc-mode vc-mode) sideface)
				   (powerline-raw "] " sideface 'r)))
				)))
		     (concat (powerline-render lhs)
			     (powerline-fill-center sideface (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill sideface (powerline-width rhs))
			     (powerline-render rhs))
		   )))))
(use-package powerline
  :ensure t
  :init
  (progn
    (setq powerline-default-separator 'wave)
    )
  :config
  (progn
    (my-powerline-theme)
    )
  )
