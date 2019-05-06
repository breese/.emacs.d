; -*- mode: emacs-lisp -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bjorn Reese <breese@users.sourceforge.net>

; Disable splash screen
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

; Prepare to diminish mode line
(require 'diminish)
(diminish 'abbrev-mode)

; Turn off automatic newlines at end of buffer
(setq next-line-add-newlines nil)

; Use automatic indentation after RET
(substitute-key-definition 'newline 'newline-and-indent global-map)

; Preserve scroll position when using Page Up/Down
(setq scroll-preserve-screen-position t)

; Case-insensitive find-file
(setq completion-ignore-case t)

; Case-insensitive find-file
(setq read-file-name-completion-ignore-case t)

; Use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

; Overwrite marked region
(delete-selection-mode t)

; Side-by-side comparison in ediff
;(setq ediff-split-window-function 'split-window-horizontally)

; Prevent vertical frame splitting
(setq split-height-threshold nil)

; Wrap lines in horizontal mode
(setq truncate-partial-width-windows nil)
; Cursor moves along logical lines
(setq line-move-visual nil)

; Presentation mode
(use-package presentation
  :ensure t
  :diminish presentation-mode)

; Further configuration
(add-to-list 'load-path (concat user-emacs-directory "user"))
(require 'revert-all-buffers)
(require 'breese-theme)
(require 'breese-modeline)
(require 'breese-style)
(require 'breese-develop)
(require 'breese-complete)
(require 'breese-debug)
(require 'breese-shell)
(require 'breese-keys)
