(provide 'breese-debug)

(use-package gud
  :commands gud-gdb
  :config
  (progn
    ; Set current directory regardless of where the executable is located
    (setq gud-gud-gdb-command-name (concat gud-gud-gdb-command-name " -cd .")
    ;(setq projectile-project-run-cmd #'gud-gdb)
    )

    ; Mode keys
    (bind-key "<f5>" #'gud-break)
    (bind-key "S-<f5>" #'gud-remove)
    (bind-key "<f6>" #'gud-down)
    (bind-key "S-<f6>" #'gud-up)
    (bind-key "<f7>" #'gud-cont)
    (bind-key "S-<f7>" #'gud-finish)
    (bind-key "<f8>" #'gud-next)
    (bind-key "S-<f8>" #'gud-step)
    )
  :bind
  ("S-<f10>" . gud-gdb)
  )

; High-light marker line
; http://www.emacswiki.org/emacs/DebuggingWithEmacs
(defvar gud-overlay
  (let* ((ov (make-overlay (point-min) (point-min))))
    (overlay-put ov 'face 'secondary-selection)
    ov)
  "Overlay variable for GUD highlighting.")

(defadvice gud-display-line (after my-gud-highlight act)
  "Highlight current line."
  (let* ((ov gud-overlay)
	 (bf (gud-find-file true-file)))
    (with-current-buffer bf)
      (move-overlay ov (line-beginning-position) (line-beginning-position 2)
		    (current-buffer))))

(defun gud-kill-buffer ()
  (if (eq major-mode 'gud-mode)
      (delete-overlay gud-overlay)))

(add-hook 'kill-buffer-hook 'gud-kill-buffer)

(use-package demangle-mode
  :ensure t)
