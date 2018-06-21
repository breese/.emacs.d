(deftheme visual-breese "")

(defvar breese-palette
  '(("breese-black" . "dim gray")
    ("breese-base" . "white smoke")
    ("breese-base-dark" . "SkyBlue4")
    ; Red palette
    ("breese-red-dark" . "firebrick")
    ("breese-red-pale" . "#cdc1c1") ; Redish azure3
    ("breese-red-medium" . "IndianRed3")
    ("breese-brown" . "brown")
    ("breese-brown-dark" . "saddle brown")
    ("breese-brown-light" . "sienna")
    ; Green palette
    ("breese-green" . "forest green")
    ("breese-green-dark" . "dark olive green")
    ("breese-green-pale" . "#c1cdc1") ; Greenish azure3
    ; Blue palette
    ("breese-blue" . "blue")
    ("breese-blue-dark" . "midnight blue")
    ("breese-blue-light" . "cornflower blue")
    ("breese-steel" . "steel blue")
    ("breese-steel-light" . "light steel blue")
    ("breese-steel-dark" . "DarkSlateGray4")
    ("breese-blue-pale" . "#c1c1cd") ; Blueish azure3
    ("breese-violet" . "blue violet")
    ; Yellow
    ("breese-yellow" . "khaki2")
    )
  "Colors")

(defvar breese-colors-alist breese-palette "Colors")

(defmacro breese-with-color-variables (&rest body)
  "Helper"
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   breese-colors-alist))
     ,@body))

(breese-with-color-variables
 (custom-theme-set-faces
  'visual-breese
  `(default ((t (:foreground ,breese-black :background ,breese-base))))
  `(fringe ((t (:background ,breese-base :foreground ,breese-base-dark))))
  `(cursor ((t (:background ,breese-steel-dark))))
  `(mode-line ((t (:background ,breese-steel-light :box (:line-width 1 :style released-button)))))
  `(mode-line-inactive ((t (:background ,breese-base :box (:line-width 1 :style released-button)))))
  `(mode-line-highlight ((t (:foreground ,breese-brown-dark))))
  `(header-line ((t (:italic t :background ,breese-base :box (:line-width 1 :style released-button)))))
  `(powerline-active1 ((t (:background ,breese-steel-light :foreground ,breese-black))))
  `(powerline-active2 ((t (:background ,breese-base :foreground ,breese-black))))
  `(powerline-readonly-active1 ((t (:background ,breese-red-medium :foreground ,breese-base))))
  `(powerline-inactive1 ((t (:background ,breese-base :foreground ,breese-base-dark))))
  `(powerline-inactive2 ((t (:background ,breese-base :foreground ,breese-base-dark))))
  `(linum ((t (:foreground ,breese-base-dark))))

  ; Region
  `(region ((t (:foreground nil :background ,breese-yellow))))
  `(secondary-selection ((t (:background ,breese-blue-pale))))
  `(hl-line ((t (:background ,breese-blue-pale))))
  `(show-paren-match ((t (:background ,breese-green-pale))))
  `(show-paren-mismatch ((t (:italic t :background ,breese-red-pale))))
 
  ; Syntax highlighting
  `(font-lock-builtin-face ((t (:foreground ,breese-brown-dark))))
  `(font-lock-comment-face ((t (:italic t :foreground ,breese-green-dark))))
  `(font-lock-comment-delimiter-face ((t (:foreground ,breese-green-dark))))
  `(font-lock-constant-face ((t (:foreground ,breese-blue-light))))
  `(font-lock-doc-face ((t (:italic t :foreground ,breese-green-dark))))
  `(breese-font-lock-doc-keyword ((t (:italic t :foreground ,breese-green-dark :weight bold))))
  `(breese-font-lock-doc-argument ((t (:italic t :foreground ,breese-steel-light))))
  `(font-lock-function-name-face ((t (:foreground ,breese-blue-dark))))
  `(font-lock-keyword-face ((t (:foreground ,breese-blue))))
  `(font-lock-negation-char-face ((t (:foreground ,breese-brown-light :weight bold))))
  `(font-lock-preprocessor-face ((t (:foreground ,breese-steel-dark))))
  ;`(font-lock-regexp-grouping-construct ((t (:foreground ,breese-red-dark :weight bold))))
  ;`(font-lock-regexp-grouping-backslash ((t (:foreground ,breese-red-dark :weight bold))))
  `(font-lock-string-face ((t (:foreground ,breese-brown))))
  `(font-lock-type-face ((t (:foreground ,breese-violet))))
  `(font-lock-variable-name-face ((t (:foreground ,breese-steel))))
  `(font-lock-warning-face ((t (:foreground ,breese-red-dark :weight bold))))

  ; Incremental search
  `(isearch ((t (:background nil))))
  `(isearch-lazy-highlight-face ((t (:italic t :underline t :foreground ,breese-green :background nil))))

  ; Diff
  `(diff-header ((t (:foreground ,breese-black :weight bold :italic t))))
  `(diff-file-header ((t (:foreground ,breese-black :weight bold))))
  `(diff-hunk-header ((t (:foreground ,breese-black :weight bold))))
  `(diff-added ((t (:foreground ,breese-green))))
  `(diff-removed ((t (:foreground ,breese-red-dark))))
  `(diff-changed ((t (:background ,breese-blue-light))))

  ; Helm
  `(helm-header
    ((t (:foreground ,breese-base-dark
		     :background nil
		     :underline nil
		     :box nil))))
  `(helm-source-header
    ((t (:foreground ,breese-base-dark
		     :background ,breese-base
		     :underline nil
		     :weight bold
		     :box (:line-width -1 :style released-button)))))
  `(helm-selection ((t (:foreground ,breese-base :background ,breese-base-dark :underline nil))))
  `(helm-separator ((t (:foreground ,breese-base-dark :background ,breese-base))))
  `(helm-candidate-number ((t (:foreground ,breese-black))))
  `(helm-buffer-file ((t (:foreground ,breese-base-dark :weight bold))))
  `(helm-buffer-not-saved ((t (:foreground ,breese-red-dark :weight bold))))
  `(helm-ff-file ((t (:foreground ,breese-base-dark :weight bold))))
  `(helm-ff-directory ((t (:foreground ,breese-base-dark :italic t))))
  `(helm-ff-dotted-directory ((t (:foreground ,breese-base-dark :italic t))))
  `(helm-ff-executable ((t (:foreground ,breese-steel))))
  `(helm-ls-git-added-copied-face ((t (:foreground ,breese-green))))
  `(helm-ls-git-added-modified-face ((t (:foreground ,breese-green))))
  `(helm-ls-git-modified-not-staged-face ((t (:foreground ,breese-steel))))
  `(helm-ls-git-modified-and-staged-face ((t (:foreground ,breese-steel))))
  `(helm-ls-git-renamed-modified-face ((t (:foreground ,breese-steel))))
  `(helm-ls-git-deleted-not-staged-face ((t (:foreground ,breese-red-dark))))
  `(helm-ls-git-deleted-and-staged-face ((t (:foreground ,breese-red-dark))))
  `(helm-ls-git-untracked-face ((t (:foreground ,breese-brown-light))))
  `(helm-ls-git-conflict-face ((t (:weight bold :foreground ,breese-brown-light))))
  ; helm-buffer-process helm-buffer-saved-out helm-buffer-size
  ; helm-ff-invalid-symlink helm-ff-symlink helm-ff-prefix
  `(helm-swoop-target-line-face ((t (:background ,breese-blue-pale))))
  `(helm-swoop-target-word-face ((t (:italic t :underline t :foreground ,breese-green :background nil))))

  ; Auto-complete
  `(ac-completion-face ((t (:background ,breese-blue-pale :foreground ,breese-base)))) ; hl-line
  `(ac-candidate-face ((t (:background ,breese-blue-pale :foreground ,breese-steel))))
  `(ac-selection-face ((t (:background ,breese-green-pale :foreground ,breese-steel :weight bold))))
  `(ac-yasnippet-candidate-face ((t (:inherit ac-candidate-face))))
  `(ac-yasnippet-selection-face ((t (:inherit ac-selection-face))))

  ; Asciidoc
  `(markup-gen-face ((t (:foreground ,breese-red-dark))))
  `(markup-title-0-face ((t (:foreground ,breese-black :height 2.1))))
  `(markup-title-1-face ((t (:inherit markup-gen-face :height 1.8))))
  `(markup-title-2-face ((t (:inherit markup-gen-face :height 1.5))))
  `(markup-title-3-face ((t (:inherit markup-gen-face :height 1.2 :weight bold))))
  `(markup-title-4-face ((t (:inherit markup-gen-face :height 1.1 :slant italic))))
  `(markup-title-5-face ((t (:inherit markup-gen-face :height 1.1 :slant italic))))
  `(markup-emphasis-face ((t (:slant italic))))
  `(markup-code-face ((t (:background ,breese-blue-pale :foreground ,breese-blue-dark))))
  `(markup-reference-face ((t (:foreground ,breese-blue :underline t))))
  `(markup-typewriter-face ((t (:background ,breese-blue-pale))))
  `(markup-list-face ((t (:weight bold))))
  `(markup-table-face ((t (:background ,breese-green-pale :foreground ,breese-green-dark))))
  `(markup-secondary-text-face ((t (:foreground ,breese-green-dark :height 0.8))))
  )
 )

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'visual-breese)
