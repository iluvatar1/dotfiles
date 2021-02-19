(setq user-full-name "William Oquendo"
      user-mail-address "woquendo@gmail.com")
;;(setq doom-theme 'doom-one)
(setq org-directory "~/Dropbox/TODO/")
(setq display-line-numbers-type t)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq doom-theme 'modus-vivendi)
(add-to-list 'exec-path "/usr/local/bin/")
;;(setq ccls-executable "/usr/local/bin/ccls")
(menu-bar-mode 1)

(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq org-latex-image-default-width ".45\\textwidth")
(setq org-latex-images-centered nil)
(setq org-latex-listings 'minted) ;; colored latex
(setq org-src-preserve-indentation t) ;; for preserving indentation when tangling
(setq org-latex-packages-alist '())
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


(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  )
;; ~/.doom.d/config.el
(setq +python-ipython-repl-args '("-i" "--simple-prompt" "--no-color-info"))
(setq +python-jupyter-repl-args '("--simple-prompt"))
