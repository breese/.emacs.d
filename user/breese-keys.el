(provide 'breese-keys)

; Disable default key bindings
(global-unset-key (kbd "C-x m")) ; mail

; Key bindings
(global-set-key [C-tab] 'other-window)
(global-set-key [insert] 'yank)
(global-set-key [S-insert] 'kill-ring-save)
(global-set-key [C-insert] 'yank-pop)
(global-set-key [S-delete] 'kill-region)

; Function keys
; F1-F4 reserved for modes
(global-set-key [f1] 'goto-line)
; F5-F8 reserved for debugger
; F9 reserved for compilation
;(global-set-key [f9] 'compile)
; F10 reserved for shell
(global-set-key [f12] 'undo)
(global-set-key [C-S-Scroll_Lock] 'toggle-frame-fullscreen)

; Increase/decrease font with page up/down
(use-package default-text-scale
  :ensure t
  :bind
  ("<C-prior>" . default-text-scale-increase)
  ("<C-next>" . default-text-scale-decrease))

; Switch two windows horizontally
(use-package transpose-frame
  :ensure t
  :bind
  (("<C-S-iso-lefttab>" . 'flop-frame)
   ("<Scroll_Lock>" . 'flop-frame)
   ("<C-Scroll_Lock>" . 'transpose-frame)))
