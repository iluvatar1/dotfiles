(setq user-full-name "William Oquendo"
      user-mail-address "woquendo@gmail.com")
(setq confirm-kill-emacs nil)
(setq display-line-numbers-type t)
(setq doom-theme 'doom-one)
;;(setq doom-theme 'modus-vivendi)
;;(setq doom-theme 'spacemacs-light)
(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default))
;;(setq spacemacs-theme-comment-bg nil)


(add-to-list 'exec-path "/usr/local/bin/")
;;(setq ccls-executable "/usr/local/bin/ccls")
(menu-bar-mode 1)

(setq org-directory "~/Dropbox/TODO/")
(add-hook! org-mode (electric-indent-local-mode -1))
(add-hook! 'org-mode-hook 'turn-on-auto-fill)
(add-hook! 'text-mode-hook 'turn-on-auto-fill)
(setq org-latex-image-default-width ".45\\textwidth")
(setq org-latex-images-centered nil)
(setq org-latex-listings 'minted) ;; colored latex
(setq org-src-preserve-indentation t) ;; for preserving indentation when tangling
(setq org-latex-packages-alist '())
(add-to-list 'org-latex-packages-alist '("dvipsnames,svgnames" "xcolor"))
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-minted-options
      '(("frame" "lines")
        ("fontsize" "\\scriptsize")
        ;;("linenos" "true")
        ("bgcolor" "Wheat!15")
        ("escapeinside" "||")
        ("breaklines" "true")
        ("breakanywhere" "true")
        ("bgcolor" "Wheat!15")
        ("mathescape" "")))
(setq org-list-allow-alphabetical 't)
(setenv "PDFLATEX" "pdflatex --shell-escape")
;;(setq org-latex-pdf-process ("latexmk -f -pdf %f"))
;;(setq org-latex-pdf-process ("pdflatex --shell-escape %f"))
(setq org-latex-pdf-process '("latexmk -pdflatex='pdflatex -shell-escape  -interaction nonstopmode' -pdf -bibtex -f %f"))
(setq org-latex-to-pdf-process '("latexmk -pdflatex='pdflatex -shell-escape  -interaction nonstopmode' -pdf -bibtex -f %f"))
(defun zz/adjust-org-company-backends ()
  (remove-hook 'after-change-major-mode-hook '+company-init-backends-h)
  (setq-local company-backends nil))
(add-hook! org-mode (zz/adjust-org-company-backends))
(setq org-reveal-mathjax t)
(use-package! htmlize
:ensure t)

;;(require 'eglot)
;;(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(set-eglot-client! 'cc-mode '("clangd" "-j=3" "--clang-tidy"))
(set-eglot-client! 'c-mode '("clangd" "-j=3" "--clang-tidy"))
(set-eglot-client! 'c++-mode '("clangd" "-j=3" "--clang-tidy"))
(after! cc-mode (setq c-basic-offset 2)) ; set it globally
(setq-hook! 'c++-mode-hook c-basic-offset 2) ; set it in c++-mode buffers

;; ~/.doom.d/config.el
(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))

;;(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(setq org-image-actual-width 'nil)


(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-clang-tidy-setup))

;; check gramar
;; see : https://www.reddit.com/r/DoomEmacs/comments/j61u6u/how_to_configure_writegood_mode_from_grammar/
;;(add-load-path! "~/.doom.d/lisp/writegood-mode/")
;;(use-package! writegood-mode
;;:config
;;(global-set-key (kbd "C-c g") 'writegood-mode)
;;(add-hook 'markdown-mode-hook 'writegood-mode))

;; telegram client for emacs
;; (use-package! telega
;;   :commands (telega)
;;   :defer t
;;   :bind ("C-c t" . #'telega)
;;   :init
;;   (unless (display-graphic-p) (setq telega-use-images nil))
;;   )

;; Allows to expand macro in org babel codes
;; https://emacs.stackexchange.com/questions/48733/org-macros-in-header-arguments-of-org-babel
;; (defun my-org-babel-expand-macros (params)
;;   "Replace org macros in all header argument values."
;;   (mapc
;;    (lambda (par)
;;      (let ((templates org-macro-templates)
;;            (val (cdr par)))
;;        (when (stringp val)
;;          (setcdr par
;;                  (with-temp-buffer
;;                    (insert val)
;;                    (org-macro-replace-all templates)
;;                    (buffer-string))))))
;;    params))

;;(advice-add 'org-babel-process-params :filter-return #'my-org-babel-expand-macros)

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (("C-TAB" . 'copilot-accept-completion-by-word)
         ("C-<tab>" . 'copilot-accept-completion-by-word)
         :map copilot-completion-map
         ("<tab>" . 'copilot-accept-completion)
         ("TAB" . 'copilot-accept-completion)))


;; transparency
;;(set-frame-parameter (selected-frame) 'alpha-background 50)
;;(add-to-list 'default-frame-alist '(alpha-background . 50))
(set-frame-parameter (selected-frame) 'alpha '(97 . 95))
(add-to-list 'default-frame-alist '(alpha . (97 . 95)))
