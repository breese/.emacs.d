; -*- mode: emacs-lisp -*-

(defconst --xemacsp (featurep 'xemacs) "Is this XEmacs?")
(defconst --emacs26p (and (not --xemacsp) (>= emacs-major-version 26)))
(defconst --emacs25p (and (not --xemacsp) (>= emacs-major-version 25)))
(defconst --emacs24p (and (not --xemacsp) (>= emacs-major-version 24)))
(defconst --emacs23p (and (not --xemacsp) (>= emacs-major-version 23)))

; Packages
(if --emacs24p
    (require 'package)
  ())
; http://emacswiki.org/emacs/ELPA
(setq package-archives '(;("gnu" . "http://elpa.gnu.org/packages/")
                         ;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(unless (package-installed-p 'diminish)
  (package-install 'diminish))

; User defined settings
(setq user-file (concat user-emacs-directory "user.el"))
(if (file-readable-p user-file)
    (load user-file nil t))

; Customized settings
(setq custom-file (concat user-emacs-directory "custom.el"))
(if (file-readable-p custom-file)
    (load custom-file t t))
