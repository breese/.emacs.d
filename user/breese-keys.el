(provide 'breese-keys)

; Disable default key bindings
(global-unset-key (kbd "C-x m")) ; mail

; Switch two buffers
(require 'transpose-buffers)

; Key bindings
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-iso-lefttab] 'transpose-buffers)

; Function keys
; F1-F4 reserved for modes
(global-set-key [f1] 'goto-line)
; F5-F8 reserved for debugger
; F9 reserved for compilation
;(global-set-key [f9] 'compile)
; F10 reserved for shell
(global-set-key [f12] 'undo)
(global-set-key [Scroll_Lock] 'toggle-frame-fullscreen)

; Increase/decrease font with page up/down
(use-package default-text-scale
  :ensure t
  :bind
  ("<C-prior>" . default-text-scale-increase)
  ("<C-next>" . default-text-scale-decrease))
