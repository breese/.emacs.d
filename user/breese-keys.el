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
; F1-F9 reserved for debugger (mostly)
;(global-set-key [f9] 'compile)
; F10 reserved for shell
(global-set-key [f12] 'undo)
; Increase/decrease font with page up/down
(global-set-key [C-prior] (lambda ()(interactive)(text-scale-increase 1)))
(global-set-key [C-next] (lambda ()(interactive)(text-scale-decrease 1)))
