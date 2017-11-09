;; Add horizontal rulers with Ctrl-q Ctrl-l

;; Check https://github.com/jinnovation/dotemacs


;; DEPRECATED: load proxy config at work
;;
;; DEPRECATED: now it is better to set the proxy credentials from the
;; command line (https_proxy etc) and then open emacs

;; (if  (file-exists-p "~/.emacs_proxy_config")
;;     (load "~/.emacs_proxy_config")
;;   )



;; Accept ad-redefinition warnings
;; from:http://andrewjamesjohnson.com/suppressing-ad-handle-definition-warnings-in-emacs/
(setq ad-redefinition-action 'accept)


;; add path to find executables
(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'exec-path "/Library/TeX/texbin/")
;;(add-to-list 'exec-path "/Users/oquendo/anaconda2/bin/")

(load "server")
(unless (server-running-p) (server-start))

;; ;; packages
;; (require 'package)
;; (setq package-enable-at-startup nil)
;; (when (>= emacs-major-version 24)
;;   (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;;   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;   (setq package-enable-at-startup nil)
;;   )
;; (when (< emacs-major-version 24)
;;   ;; For important compatibility libraries like cl-lib
;;   (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;; (unless (package-installed-p 'use-package)
;;   (package-install 'use-package))
;; (package-initialize)
;; (setq use-package-verbose t)
;; (use-package auto-compile
;;   :config (auto-compile-on-load-mode))
;; (setq load-prefer-newer t)

;; from http://cachestocaches.com/2015/8/getting-started-use-package/
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;;https://github.com/rranelli/auto-package-update.el
;; run: M-x auto-package-update-now
;;(use-package auto-package-update
;;  :ensure t)


;; Organizing packages automatically
;;https://www.reddit.com/r/emacs/comments/4fqu0a/automatically_install_packages_on_startup/
(setq use-package-always-ensure t)

;; ;;(package-initialize)
;; (use-package ein
;;   :ensure t
;;   :config
;;   (require 'ein-loaddefs)
;;   (require 'ein-notebook)
;;   (require 'ein-subpackages)
;;   )


;; GENERAL CONFIG TO AVOID USING .emacs
(add-to-list 'load-path "~/.emacs.d/lisp")
(display-time-mode 1)
(display-battery-mode 1)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t); Disable splash screen
(setq show-trailing-whitespace t)
(setq longlines-show-hard-newlines t) ; displays "\" at the end of lines that wrap past the window's edge"
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t) ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/General-VC-Options.html
;; complete file name : Better try to use helm complete file name?
(autoload 'comint-dynamic-complete-filename "comint" nil t)
(global-set-key "\M-]" 'comint-dynamic-complete-filename)
(setq visible-bell t); Flashes on error
(setq calendar-week-start-day 1); Calendar should start on Monday
;; camel case word navigation
(when (boundp 'subword-mode)
  (add-hook 'after-change-major-mode-hook '(lambda () (subword-mode 1))))
(setq enable-local-variables :safe)
(setq byte-compile-verbose nil)
(setq comment-column 80)
(setq compile-command "g++-5")
(setq delete-selection-mode t)
(setq keyboard-coding-system (quote utf-8-unix))
(setq osx-clipboard-mode t)
(delete-selection-mode 1)
;; syntax highlight everywhere
(global-font-lock-mode t)
(transient-mark-mode t)
(setq woman-locale "en_US.UTF-8")
;; confirm exit
(when window-system
  (add-hook 'kill-emacs-query-functions
	    (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
	    'append) )
;; allow to write y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)
;; reload file
;;(global-set-key [(control c) r] 'revert-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
;; all indent in spaces
(setq indent-tabs-mode nil)
;; compilation mode
(setq compilation-scroll-output 'first-error)

;; integrate copy/paste with X
(setq x-select-enable-clipboard t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; from http://zeekat.nl/articles/making-emacs-work-for-me.html
(when (not (window-system))
  (xterm-mouse-mode +1))

;; Oppening compressed files
(auto-compression-mode 1)

;; save command history
(setq savehist-additional-variables    ;; also save...
      '(kill-ring search-ring regexp-search-ring))    ;; ... my search entries
(setq savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode 1) ;; customize and THEN activate mode

;; ibuffer mode
;;(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; misc
;;(setq mac-command-key-is-meta nil)
(setq mac-option-key-is-meta nil)
;;(setq mac-option-modifier 'meta)
;;(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq ns-function-modifier 'hyper)
;;(add-to-list 'ido-ignore-files "\\.DS_Store")

;; utf 8 support
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)


;; occur mode
(global-set-key (kbd "C-c o") 'occur)



;; ===== Automatically load abbreviations table =====
;; Note that emacs chooses, by default, the filename
;; "~/.abbrev_defs", so don't try to be too clever
;; by changing its name
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)


;; ========== Line by line scrolling ==========
;; This makes the buffer scroll by only a single line when the up or
;; down cursor keys push the cursor (tool-bar-mode) outside the
;; buffer. The standard emacs behaviour is to reposition the cursor in
;; the center of the screen, but this can make the scrolling confusing
(setq scroll-step 1)


;; emacs backup
;; ========== Prevent Emacs from making backup files ==========
;;(setq make-backup-files nil)
;; ========== Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))
;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)


;; Fix tmux and emacs arrow problem
;; http://stackoverflow.com/questions/4548106/screen-somehow-unmaps-my-arrow-keys-in-emacs-after-a-z
(define-key function-key-map "\eOA" [up])
(define-key function-key-map "\e[A" [up])
(define-key function-key-map "\eOB" [down])
(define-key function-key-map "\e[B" [down])
(define-key function-key-map "\eOC" [right])
(define-key function-key-map "\e[C" [right])
(define-key function-key-map "\eOD" [left])
(define-key function-key-map "\e[D" [left])



;; Linum mode : Line number
;;(when window-system
(use-package linum
  :ensure t
  :config
  (line-number-mode 1)
  (column-number-mode 1)
  (global-linum-mode 1)
  (setq linum-format "%3d \u2502 ")
  )
 ;;)
;;(global-hl-line-mode 1)
;; config fringe
;;(fringe-mode 4) ;; both left and right 4 pixels
;;(fringe-mode '(4 . 0)) ;; left 4 pixels, right dissapears
;;(set-window-margins nil 1) ;; add a margin


;; winner-mode lets you use C-c <left> and C-c <right> to switch between window configurations
(use-package winner
  :defer t)


;; recent file mode
(use-package recentf
  :config
  (setq recentf-max-saved-items 500)
  (setq recentf-max-menu-items 15)
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  ;; disable recentf-cleanup on Emacs start, because it can cause
  ;; problems with remote files
  (setq recentf-auto-cleanup 'never)
  (recentf-mode +1))


;; from : http://cestlaz.github.io/posts/using-emacs-17-misc/#.WBUKRpMrKHp
;; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  ;; this color looks good for the zenburn theme but not for the one
  ;; I'm using for the videos
  ;; (setq beacon-color "#666600")
  )


;; deletes all the whitespace when you hit backspace or delete
;(use-package hungry-delete
;  :ensure t
;  :config
;  (global-hungry-delete-mode))


;; BIBTEX
;; helm-bibtex
(use-package helm-bibtex
  :ensure t
  :mode ("\\.bib" . bibtex-mode)
  :config 
  (setq bibtex-completion-bibliography '("~/Dropbox/teaching/2016-I-USabana/08-ConvocatoriaUSabana/01-Proyecto/biblio-granulometry.bib" "~/Dropbox/teaching/2016-I-USabana/08-ConvocatoriaUSabana/01-Proyecto/bibliogeneral.bib"))
  (helm-delete-action-from-source "Insert BibTeX key" helm-source-bibtex)
  (helm-add-action-to-source "Insert BibTeX key" 'bibtex-completion-insert-key helm-source-bibtex 0)
  )
;; ;; bibtex package
;; (use-package bibtex
;;   :mode ("\\.bib" . bibtex-mode)
;;   :init
;;   (progn
;;     (setq bibtex-align-at-equal-sign t)
;;     (add-hook 'bibtex-mode-hook (lambda () (set-fill-column 120)))))


(use-package gnuplot
  :config
  (autoload 'guplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
  :mode (("\\.gp$" . gnuplot-mode)
	 ("\\.gnu$" . gnuplot-mode))
  )


;; To move between windows
(use-package windmove
  :bind
  (("<f2> <right>" . windmove-right)
   ("<f2> <left>" . windmove-left)
   ("<f2> <up>" . windmove-up)
   ("<f2> <down>" . windmove-down)
   )
  :config
  ;; use shift + arrow keys to switch between visible buffers
  (windmove-default-keybindings)
  ;;(global-set-key (kbd "<M-up>") 'windmove-up)
  ;;(global-set-key (kbd "<M-down>") 'windmove-down)
  ;;(global-set-key (kbd "<M-left>") 'windmove-left)
  ;;(global-set-key (kbd "<M-right>") 'windmove-right)
  (global-set-key ((kbd "") "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)
  )



(use-package pov-mode
  :mode (("\\.pov$" . pov-mode)
	 ("\\.inc$" . pov-mode))
  )


;; power line
(use-package powerline
  :ensure t
  :config
  (powerline-center-theme)
  ;;(powerline-default-theme)
  )

;; (use-package fill-column-indicator
;;   :config
;;   (setq fci-rule-width 10)
;;   (setq fci-rule-color "darkblue")
;;   (add-hook 'prog-mode-hook #'fci-mode)
;;   (add-hook 'rst-mode-hook #'fci-mode)
;;   )


(use-package python
  :mode (("\\.py$" . python-mode))
  :interpreter ("python" . python-mode)
  :config
  (setq python-indent-offset 4)
  )


(use-package cuda-mode
  :mode (("\\.cu$" . cuda-mode))
  )


;; org mode
(use-package org
  :mode (("\\.org$" . org-mode)
	 ("\\.txt$" . org-mode))
  :commands (org-mode org-capture-mode)
  :config
  ;; org agenda refile : see https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html
  (setq org-refile-targets '((org-agenda-files :maxlevel . 6)))
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-completion-use-ido nil)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path t)                  ; Show full paths for refiling
  ;; org babel
  (org-babel-do-load-languages
   'org-babel-load-languages '((C . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((makefile . t)))
  ;; (org-babel-do-load-languages
  ;;  'org-babel-load-languages '((sh . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages '((shell . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages '((ditaa . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages '((latex . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages '((gnuplot . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages '((python . t)))
  (org-babel-do-load-languages
   'org-babel-load-languages '((calc . t)))
  (setq org-src-fontify-natively t)
  (defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("cpp" "shell"))))
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)
  (defvar org-babel-C-compiler "gcc-5"
    "Command used to compile a C source code file into an
executable.")
  (defvar org-babel-C++-compiler "g++-5"
    "Command used to compile a C++ source code file into an
executable.")
  (add-hook 'org-mode-hook 
	    \t  (lambda ()
		  \t    'turn-on-font-lock
		  \t    (setq word-wrap 1)
		  \t    (setq truncate-lines nil)
		  \t    (flyspell-mode 1)))
  ;;(add-hook 'org-mode-hook 'wc-mode)
  ;; indent mode: https://github.com/syl20bnr/spacemacs/issues/7290
  ;; (setq org-startup-indented t)
  ;; (setq org-indent-mode t)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (setq org-latex-image-default-width ".45\\textwidth")
  (setq org-latex-images-centered nil)
  (setq org-latex-listings 'minted) ;; colored latex 
  (setq org-src-preserve-indentation t) ;; for preserving indentation when tangling
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-minted-options
	'(("frame" "lines")
	  ("fontsize" "\\small")
	  ;;("linenos" "true")
	  ("bgcolor" "Wheat!15")
	  ("mathescape" "")))
  (setq org-list-allow-alphabetical 't)
  ;;(setenv "PDFLATEX" "pdflatex --shell-escape")
  ;;(setq org-latex-pdf-process ("latexmk -f -pdf %f"))
  ;;(setq org-latex-pdf-process ("pdflatex --shell-escape %f"))
  (setq org-latex-pdf-process '("latexmk -pdflatex='pdflatex -shell-escape  -interaction nonstopmode' -pdf -bibtex -f %f"))
  (setq org-latex-to-pdf-process '("latexmk -pdflatex='pdflatex -shell-escape  -interaction nonstopmode' -pdf -bibtex -f %f"))
  (setq org-todo-keywords '((sequence "TODO" "ONGOING" "WAIT"  "|" "DONE" )))
  (defun my-org-mode-hook ()
  (auto-fill-mode)
  (electric-indent-mode)
  (flyspell-mode))
  (add-hook 'org-mode-hook 'my-org-mode-hook)
  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (setq org-deadline-warning-days 21) ;; default value is 14
  (org-clock-persistence-insinuate)
  ;;(autopair-global-mode 1)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-cc" 'org-capture)
  (define-key global-map "\C-ca" 'org-agenda)
  ;;(setq org-pretty-entities t)
  (setq org-directory "~/Dropbox/TODO/")
  (setq org-default-notes-file (concat org-directory "~/Dropbox/TODO/TODO.org"))
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Dropbox/TODO/TODO.org" "Tasks")
	   "* TODO %?\nEntered on %U\n %i\n  %a")
	  ("n" "Note" entry (file+headline "~/Dropbox/TODO/NOTES.org" "Notes")
	   "* %?\nEntered on %U\n %i\n  %a")
	  ("j" "Journal" entry (file+datetree "~/Dropbox/TODO/journal.org")
	   "* %?\nEntered on %U\n  %i\n  %a")))
  (setq org-agenda-files (list "~/Dropbox/TODO/TODO.org"
			       ))
  ;; (add-to-list 'org-export-latex-classes
  ;;         '("koma-article"
  ;;            "\\documentclass{scrartcl}"
  ;;            ("\\section{%s}" . "\\section*{%s}")
  ;;            ("\\subsection{%s}" . "\\subsection*{%s}")
  ;;            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ;;            ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ;;            ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  ;; (setq org-agenda-custom-commands
  ;; 	'(("h" "Daily habits"
  ;; 	   ((agenda ""))
  ;; 	   ((org-agenda-show-log t)
  ;; 	    (org-agenda-ndays 7)
  ;; 	    (org-agenda-log-mode-items '(state))
  ;; 	    (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))
  ;; 	  ;; other commands here
  ;; 	  ))
  (setf (nth 4 org-emphasis-regexp-components) 4)
  )
;;(set 'org-file-apps '((auto-mode . emacs) ... ("\\.pdf\\'" . default)))
;; org habits
;;(require 'org-habit)
; fix export to latex and scaping { ; from http://tex.stackexchange.com/questions/186605/with-orgtbl-how-to-ensure-that-braces-and-dollars-are-not-escaped
(defun orgtbl-to-latex-verbatim (table params)
  "Convert the Orgtbl mode TABLE to LaTeX."
  (let* ((alignment (mapconcat (lambda (x) (if x "r" "l"))
			       org-table-last-alignment ""))
	 (params2
	  (list
	   :tstart (concat "\\begin{tabular}{" alignment "}")
	   :tend "\\end{tabular}"
	   :lstart "" :lend " \\\\" :sep " & "
	   :efmt "%s\\,(%s)" :hline "\\hline")))
        (orgtbl-to-generic table (org-combine-plists params2 params))))

;; ;; org pomodoro
;; (use-package org-pomodoro
;;   :ensure t
;;   :commands (org-pomodoro)
;;   :config
;;   (setq alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))))

 
;; ;; org-gcal : http://cestlaz.github.io/posts/using-emacs-26-gcal/#.WIyKvLYrKHq
;; (setq package-check-signature nil)
;; (use-package org-gcal
;;   :ensure t
;;   :config
;;   (setq org-gcal-client-id "oauth 2.0 client ID"
;; 	org-gcal-client-secret "PASSWORD"
;; 	org-gcal-file-alist '(("woquendo@gmail.com" .  "~/Dropbox/TODO/TODO.org"))))
;; (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
;; (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))


;; ;; EasyPG
;; (use-package epg
;;   :config 
;;   ;;(require 'epa-file)
;;   ;;(epa-file-enable)
;;   )



;; yasnippet
;; from: http://howardism.org/Technical/Emacs/templates-tutorial.html
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config 
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets"))
  (setq yas-prompt-functions '(yas-x-prompt yas-dropdown-prompt))
  ;; from: https://emacs.stackexchange.com/questions/9670/yasnippet-not-working-with-auto-complete-mode?rq=1
  ;;(define-key yas-minor-mode-map (kbd "<tab>") nil)
  ;;(define-key yas-minor-mode-map (kbd "TAB") nil)
  ;;(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
  ;;
  ;; ;; From https://github.com/joaotavora/yasnippet/blob/master/doc/snippet-expansion.org
  ;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
  ;; (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; ;; Bind `SPC' to `yas-expand' when snippet expansion available (it
  ;; ;; will still call `self-insert-command' otherwise).
  ;; (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
  ;; ;;;; Bind `C-c y' to `yas-expand' ONLY.
  ;; ;;(define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
  )

;; auto insert templates
;; (use-package auto-insert
;;   :ensure t
;;   :defer t
;;   :config 
(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '("Short description: "
       "/*" \n
       (file-name-nondirectory (buffer-file-name))
       " -- " str \n
       " */" > \n \n
       "#include <iostream>" \n \n
       "int main(int argc, char **argv)" \n
       "{" \n
       > _ \n\n
       "}" > \n)))
;;  )



;; magic latex buffer
(use-package magic-latex-buffer ;; partial wysiwyg inside emacs 
  :defer t
  :config
  (add-hook 'latex-mode-hook 'magic-latex-buffer)
  )


;; latex extra: some conveniences, like section folding
(use-package latex-extra
  :defer t
  :config
  (add-hook 'LaTeX-mode-hook #'latex-extra-mode)
  )


;; ;; outshine mode, org mode outside org
;; (use-package outshine
;;   :config
;;   (add-hook 'outline-minor-mode-hook 'outshine-hook-function)
;;   (add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
;;   (add-hook 'LaTeX-mode-hook 'outline-minor-mode)
;;   (defvar outline-minor-mode-prefix "\C-c")
;;   )

;; ;; pdf-tools for pre-visuaizing pdf
;; (use-package pdf-tools
;;   :config
;;   (pdf-tools-install)
;;   (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
;;   ;;(setenv "PKG_CONFIG_PATH" (concat "/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig" ":" "/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig"))
;;   (add-hook 'latex-mode-hook 'magic-latex-buffer)
;;   )

;; from : http://emacs.stackexchange.com/questions/21112/making-pdf-tools-work-after-successful-compiling-on-mac-os-x/29846#29846
;; ;; Initialize the package (this should autoload it too)
;; (pdf-tools-install)
;; ;; Select PDF Tools as your viewer for PDF files
;; (setcdr (assq 'output-pdf TeX-view-program-selection) '("PDF Tools"))
;; ;; If you want synctex support, this should be sufficient assuming 
;; ;; you are using LaTeX-mode
;; (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)


(use-package selected
  :diminish selected-minor-mode
  :config
  (selected-global-mode t)
  :bind (:map selected-keymap
              ("q" . selected-off)
              ("u" . upcase-region)
              ("d" . downcase-region)
              ("c" . count-words-region)
              ("i" . indent-region)
              ("w" . copy-region-as-kill)
              ("m" . apply-macro-to-region-lines)))

;;autopair
(use-package autopair
  :defer t
  :config
  (progn (custom-set-variables '(autopair-blink 'nil)))
  (add-hook 'prog-mode-hook 'autopair-global-mode 1)
  (add-hook 'org-mode-hook 'autopair-global-mode 1)
  ;;(autopair-global-mode 1)
  )
;;https://github.com/jdreaver/emacs.d/blob/master/org-init.org
;; Turn off in LaTeX
;;(add-hook 'LaTeX-mode-hook
;;#'(lambda ()
;;(autopair-mode -1)))


;;smartparens
(use-package smartparens
  :ensure t
  ;;:defer t
  :config
  ;;(add-hook 'prog-mode-hook 'smartparens-mode) ; ; ;
  ;;(add-hook 'latex-mode-hook 'smartparens-mode 1)
  ;;(add-hook 'LaTeX-mode-hook 'smartparens-mode 1)
  )
;; ;; Show matching parens (mixed style)
;; (show-paren-mode t)
;; (setq show-paren-delay 0.0)
;; (setq show-paren-mismatch t)
;; (setq show-paren-style 'parenthesis)	; highlight just parens
;; ;;(setq show-paren-style 'expression) ; highlight entire expression



;; align toalign regions, useful with latex tables, but sometimes annoying
;;(use-package align
;;  :ensure t)


;; tikz
;; latex mode for .tikz files
(add-to-list 'auto-mode-alist '("\\.tikz$" . LaTeX-mode))
;; preview tikz with auctex : Command->TeXing Options->PDF Mode from the menu, or press C-c C-t C-p
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
  )


;; cdlatex mode. NOTE: Generates problems with yasnippet completion
(use-package cdlatex
  :config
  ;;(add-hook 'LaTeX-mode-hook 'cdlatex-mode)
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  ;; from : https://joaotavora.github.io/yasnippet/faq.html#sec-2 // better this one
  ;; (add-hook 'cdlatex-mode-hook
  ;; 	    (let ((original-command (lookup-key cdlatex-mode-map [tab])))
  ;; 	      `(lambda ()
  ;; 		 (setq yas-fallback-behavior
  ;; 		       '(apply ,original-command))
  ;; 		 (local-(setq )et-key [tab] 'yas-expand))))
  ;; ;; From: ....
  ;; (defun yas/advise-indent-function (function-symbol)
  ;;   (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
  ;; 	     ,(format
  ;; 	       "Try to expand a snippet before point, then call `%s' as usual"
  ;; 	       function-symbol)
  ;; 	     (let ((yas-fallback-behavior nil))
  ;; 	       (unless (and (called-interactively-p 'interactive)
  ;; 			    (yas-expand))
  ;; 		 ad-do-it)))))
  ;;(yas/advise-indent-function 'cdlatex-tab)
  ;; From : https://emacs.stackexchange.com/questions/29758/yasnippets-and-org-mode-yas-next-field-or-maybe-expand-does-not-expand
  ;;(defun yas-org-very-safe-expand ()
  ;;(let ((yas-fallback-behavior 'return-nil)) (yas-expand)))
  ;;(add-hook 'org-mode-hook
  ;;    (lambda ()
  ;;      (add-to-list 'org-tab-first-hook 'yas-org-very-safe-expand)
  ;;      (define-key yas-keymap [tab] 'yas-next-field)))
  ;;
  ;; from https://tex.stackexchange.com/questions/340591/failed-to-preview-latex-in-emacs
  ;;(defun yas/advise-indent-function (function-symbol)
  ;;  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
  ;;           ,(format
  ;;             "Try to expand a snippet before point, then call `%s' as usual"
  ;;             function-symbol)
  ;;           (let ((yas-fallback-behavior nil))
  ;;            (unless (and (called-interactively-p 'interactive)
  ;;                          (yas-expand))
  ;;              ad-do-it))
  ;;)))
  ;;(yas/advise-indent-function 'cdlatex-tab)
  ;;(yas/advise-indent-function 'org-cycle)
  ;;(yas/advise-indent-function 'org-try-cdlatex-tab)
  (add-hook 'org-mode-hook 'yas/minor-mode-on)
  )



;; Auctex for latex
;; Based on https://github.com/Schnouki/dotfiles/blob/master/emacs/init-20-tex.el
(use-package tex  
  :ensure auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :init 
  (progn
    (add-hook 'LaTeX-mode-hook 'LaTeX-preview-setup)
    (add-hook 'LaTeX-mode-hook 'yas-global-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
    (add-hook 'latex-mode-hook 'turn-on-reftex)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-orgtbl)
    (add-hook 'Latex-mode-hook 'turn-on-orgtbl)
    (add-hook 'latex-mode-hook 'turn-on-orgtbl)
    (add-hook 'TeX-mode-hook 'turn-on-orgtbl)
    (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
    ;;(add-hook 'LaTeX-mode-hook 'latex-extra-mode)
    (add-hook 'LaTeX-mode-hook #'TeX-fold-mode) ;; Automatically activate TeX-fold-mode. C-c C-o C-b
    (add-hook 'latex-mode-hook #'TeX-fold-mode) ;; Automatically activate TeX-fold-mode.
    (add-hook 'TeX-mode-hook #'TeX-fold-mode) ;; Automatically activate TeX-fold-mode.
    (add-hook 'LaTeX-mode-hook   (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
    (setq TeX-auto-save t
	  TeX-parse-self t
	  TeX-save-query nil
	  TeX-electric-math '("$" . "$")
	  TeX-electric-sub-and-superscript 1
	  TeX-source-correlate-method 'auto
	  TeX-source-correlate-start-server t
	  LaTeX-electric-left-right-brace t
	  ;;TeX-electric-escape 1
	  TeX-insert-braces 1
	  ;;TeX-insert-braces 1
	  TeX-PDF-mode t)))
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook
	  (lambda()
	    (local-set-key [C-tab] 'TeX-complete-symbol)))
;;(require 'predictive) ;; need to be installed
;;(add-hook 'LaTeX-mode-hook 'predictive-mode)


;; PDF tools
;; Update PDF buffers after successful LaTeX runs
;;(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
;;#'TeX-revert-document-buffer)
;; Use pdf-tools to open PDF files
;;(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;;TeX-source-correlate-start-server t)
;;(unless (assoc "PDF Tools" TeX-view-program-list-builtin)
;;(push '("PDF Tools" TeX-pdf-tools-sync-view) TeX-view-program-list))
;; view generated PDF with `pdf-tools'.
;;(add-to-list 'TeX-view-program-list-builtin
;;'("PDF Tools" TeX-pdf-tools-sync-view))
;;(add-to-list 'TeX-view-program-selection
;;'(output-pdf "PDF Tools"))
;;(load "pdf-tools") ;;for spooling to pdf.
;;(setq output-pdf "PDF Tools") ;; <-- THIS one
;;(pdf-tools-install)
;;(setq TeX-view-program-selection '((output-dvi "Okular")
;;(output-pdf "PDF Tools") ;;
;;))

;; Use pdf-tools to open PDF files
;;(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;;      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
;;(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
;;	  #'TeX-revert-document-buffer)


;;(setq TeX-view-program-list '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;;; see : http://www.clarkdonley.com/blog/2014-10-26-org-mode-and-writing-papers-some-tips.html
(use-package reftex
  :commands turn-on-reftex
  :init
  (progn
    (setq reftex-plug-into-AUCTeX t)
    (setq LaTeX-label-function (quote reftex-label))
    ;;(reftex-use-external-file-finders t)
    (setq reftex-enable-partial-scans t)
    (setq reftex-save-parse-info t)
    (setq reftex-use-multiple-selection-buffers t)
    ;;(setq reftex-default-bibliography '("./biblio.bib"))
    (setq reftex-default-bibliography
	  (quote
	   ("biblio.bib" "user.bib" "local.bib" "main.bib" "bibliogranular.bib" "books.bib" "bibliogeneral.bib")))
    (setq reftex-bibpath-environment-variables
	    '("./:~/Dropbox/research/granularBiblio/:~/Dropbox/research/"))
    )
  (defun org-mode-reftex-setup ()
    (load-library "reftex")
    (and (buffer-file-name)
	 (file-exists-p (buffer-file-name))
	 (reftex-parse-all))
      (define-key org-mode-map (kbd "C-c (") 'reftex-citation))
  :config
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (add-hook 'latex-mode-hook 'turn-on-reftex)
  )
;; Auto-fill for LaTeX
(defun schnouki/latex-auto-fill ()
  "Turn on auto-fill for LaTeX mode."
  (turn-on-auto-fill)
  (set-fill-column 72)
  (setq default-justification 'left))
(add-hook 'LaTeX-mode-hook #'schnouki/latex-auto-fill)
(use-package auctex-latexmk
  :defer t
  :config
  ;; Compilation command
  (add-hook 'LaTeX-mode-hook (lambda () (setq compile-command "latexmk -pdf -pvc")))
  )
                                                                      


;; OLD WAY
;;(load "auctex.el" nil t t)
;;(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
;;(setq TeX-PDF-mode t) ;; compile with pdflatex by default
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)
;;(setq-default TeX-master "Main") ; All master files called "Main".
;;(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;(setq TeX-PDF-mode t)
;;(setq reftex-plug-into-AUCTeX t)
;; From http://tex.stackexchange.com/questions/52179/what-is-your-favorite-emacs-and-or-auctex-command-trick
;;(add-hook 'TeX-mode-hook
;;(lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.


;; improve latex
;; from : https://thenybble.de/projects/inhibit-auto-fill.html
(defcustom LaTeX-inhibited-auto-fill-environments
  '("tabular" "tikzpicture") "For which LaTeX environments not to run auto-fill.")
(defun LaTeX-limited-auto-fill ()
  (let ((environment (LaTeX-current-environment)))
    (when (not (member environment LaTeX-inhibited-auto-fill-environments))
      (do-auto-fill))))
(add-hook 'LaTeX-mode-hook
          (lambda () (setq auto-fill-function #'LaTeX-limited-auto-fill)) t)




;; pages bvreak lines mode with ctrl+q ctrl+l
(use-package page-break-lines
  :ensure t
  :config (global-page-break-lines-mode))


;; dash
;;(add-to-list 'load-path "~/.emacs.d/elpa/dash-20141220.1452/") ; ; ;
;(use-package dash
;  :defer dash
;  )
;(require 'dash)


;; helm
(use-package helm 
  :init
  (progn
    ;;(require 'helm-config)
    (setq helm-candidate-number-limit 100)
    (setq enable-recursive-minibuffers t) ;; allows to use Complete at point
    ;;(helm-mode)
    )
  :bind (("C-c h" . helm-mini)
	 ("C-h a" . helm-apropos)
	 ("C-x C-b" . helm-buffers-list)
	 ("C-x b" . helm-buffers-list)
	 ("M-y" . helm-show-kill-ring)
	 ("M-x" . helm-M-x)
	 ("C-x c o" . helm-occur)
	 ("C-x c s" . helm-swoop)
	 ("C-x c y" . helm-yas-complete)
	 ("C-x c Y" . helm-yas-create-snippet-on-region)
	 ("C-x c b" . my/helm-do-grep-book-notes)
	 ("C-x c SPC" . helm-all-mark-rings))
  :config
  ;; from http://tuhdo.github.io/helm-intro.html
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  ;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
	helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
	helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
	helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
	helm-ff-file-name-history-use-recentf t)
  )
(ido-mode -1)
(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)
	 ("C-h w" . helm-descbinds)))
;;(require 'helm-config)


;; bring up help for key bindings
(use-package which-key
  :ensure t 
  :config
  (which-key-mode))


;; smex mode
(use-package smex
  :bind (("M-x" . smex))
  :config
  (smex-initialize)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  )


;; Restructed text mode
(use-package rst
  :mode (("\\.rst$" . rst-mode)
	 ("\\.rest$" . rst-mode))
  )


;; Yaml-mode
(use-package yaml-mode
  :mode (("\\.yml$" . rst-mode)
	 ("\\.yaml$" . rst-mode))
  :config
  (add-hook 'yaml-mode-hook
	    '(lambda ()
	       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
  )


;; ;; COLOR THEMES
;; ;; solarized theme
;; (use-package solarized-theme
;; :ensure t :init (load-theme 'solarized-light t)) ;; light | dark
;; ;; zenburn theme
;; ;;(use-package zenburn-theme
;; ;;  :init (load-theme 'zenburn t)
;; ;;)

;; Theme
(use-package color-theme
  :ensure t
  :defer t
  )
(use-package moe-theme
  :ensure t
  )
;; ;;(moe-light)
(moe-dark)
;; (use-package zenburn-theme
;;   :ensure t
;;   )
;; ;(load-theme 'zenburn t)

;; (use-package leuven-theme
;;   :ensure t
;;   )
;; (load-theme 'leuven t)
;; ;; (use-package leuven-theme-dark
;; ;;   :ensure t
;; ;;   )
;; ;; (load-theme 'leuven-dark t)

;;(use-package color-theme-sanityinc-tomorrow
;;   :ensure t
;;   )
;;(load-theme 'color-theme-sanityinc-tomorrow-day t)
;;(load-theme 'color-theme-sanityinc-tomorrow-niht t)
;;(load-theme 'color-theme-sanityinc-tomorrow-bright t)

;; (use-package dracula-theme
;;   :ensure t
;;   )



;; from http://www.lunaryorn.com/2015/01/06/my-emacs-configuration-with-use-package.html
;(use-package whitespace
;  :bind (("C-c T w" . whitespace-mode))
;  :init
;  (dolist (hook '(prog-mode-hook text-mode-hooki
;				 conf-mode-hook))
;    (add-hook hook #'whitespace-mode))
;  :config (setq whitespace-line-column nil)
;  :diminish whitespace-mode)


;; ECB
(use-package ecb
  :defer t
  :config
  (global-set-key (kbd "<M-left>") 'ecb-goto-window-methods)
  (global-set-key (kbd "<M-right>") 'ecb-goto-window-edit1)
  )
;;(require 'ecb-autoloads)


;; ;; symon : tiny system monitor
;; (use-package symon
;;   :defer 10
;;   :config
;;   (symon-mode)
;;   )


;;;; magit : Magic with git inside emacs
(use-package magit
  :bind ("C-c g" . magit-status)
  )
;;(magit-mode)


;; rainbow-delimiters
(use-package rainbow-delimiters
  :defer t
  :config 
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'latex-mode-hook #'rainbow-delimiters-mode)
  )

;; tags for code navigation
(use-package ggtags
  :ensure t
  :config 
  (add-hook 'c-mode-common-hook
	    (lambda ()
	      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
		(ggtags-mode 1))))
  )


;; aggressive-indent
(use-package aggressive-indent
  :defer t
  :config
  ;;(add-hook 'prog-mode-hook #'global-aggressive-indent-mode)
  (add-hook 'latex-mode-hook #'global-aggressive-indent-mode)
  )


;; ispell mode and hooks
(setq ispell-program-name "/usr/local/bin/aspell")
;; from: https://github.com/kaushalmodi/.emacs.d/blob/master/setup-files/setup-spell.el
(use-package ispell
  :defer 5
  :config
  (setq ispell-highlight-face (quote flyspell-incorrect))
  (progn
    (cond
     ((executable-find "aspell")
      (setq ispell-program-name "aspell")
      ;;(setq ispell-extra-args   '("--sug-mode=ultra"
      ;;"--lang=en_US"))
      )
     
     ;;((executable-find "hunspell")
     ;;(setq ispell-program-name "hunspell")
     ;;(setq ispell-extra-args   '("-d en_US")))
     )

    ;; Save a new word to personal dictionary without asking
    (setq ispell-silently-savep t)
    
    (use-package flyspell
      :init
      (progn
	(setq flyspell-use-meta-tab nil)
	;; Binding for `flyspell-auto-correct-previous-word'
	(setq flyspell-auto-correct-binding (kbd "<f12>")))
      :config
      (progn
	(add-hook 'prog-mode-hook #'flyspell-prog-mode)
	(with-eval-after-load 'auto-complete
	  (ac-flyspell-workaround))
	;; https://github.com/larstvei/dot-emacs#flyspell
	(add-hook 'text-mode-hook #'turn-on-flyspell)
	(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)
	(add-hook 'latex-mode-hook #'turn-on-flyspell)
	(add-hook 'tex-mode-hook #'turn-on-flyspell)
	(add-hook 'org-mode-hook  #'turn-on-flyspell)

	;; Flyspell signals an error if there is no spell-checking tool is
	;; installed. We can advice `turn-on-flyspell' and `flyspell-prog-mode'
	;; to try to enable flyspell only if a spell-checking tool is available.
	(defun modi/ispell-not-avail-p (&rest args)
	  "Return `nil' if `ispell-program-name' is available; `t' otherwise."
	  (not (executable-find ispell-program-name)))
	(advice-add 'turn-on-flyspell   :before-until #'modi/ispell-not-avail-p)
	(advice-add 'flyspell-prog-mode :before-until #'modi/ispell-not-avail-p)
	
	(bind-keys
	 :map flyspell-mode-map
	 ;; Stop flyspell overriding other key bindings
	 ("C-," . nil)
	 ("C-." . nil)
	 ("<C-f12>" . flyspell-goto-next-error)))))
  )
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-prog-mode)
;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;;(add-hook 'latex-mode-hook 'flyspell-mode)
;;(add-hook 'latex-mode-hook 'turn-on-flyspell)
;;(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)


;;htmlize for org html source code export
(use-package htmlize
  ;;  :defer t
  :ensure t
  )


;; w3m browser mode
;; inspired from http://beatofthegeek.com/2014/02/my-setup-for-using-emacs-as-web-browser.html
					;(add-to-list 'load-path "~/.emacs.d/elpa/w3m-20150902.240//")
(use-package w3m
  :defer t
  :config
  ;;change default browser for 'browse-url'  to w3m
  (setq browse-url-browser-function 'w3m-goto-url-new-session)
  ;;change w3m user-agent to android
  (setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/5\
33.")
  )
;;(require 'w3m)


;;quick access hacker news
(defun hn ()
  (interactive)
  (browse-url "http://news.ycombinator.com"))


;;quick access reddit
(defun reddit (reddit)
  "Opens the REDDIT in w3m-new-session"
  (interactive (list
		(read-string "Enter the reddit (default: AskScience): " nil nil "AskScience" nil)))
  (browse-url (format "http://m.reddit.com/r/%s" reddit))
  )

;;i need this often
(defun wikipedia-search (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
		   (buffer-substring (region-beginning) (region-end))
		 (word-at-point))))
     (list
      (read-string
       (format "Wikipedia (%s):" term) nil nil term)))
   )
  (browse-url
   (concat
    "http://en.m.wikipedia.org/w/index.php?search="
    search-term
    ))
  )

;;when I want to enter the web address all by hand
(defun w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
  (w3m-goto-url-new-session
   (concat "http://" site)))


;; esup for profiling emacs startup
;;(use-package esup
;;  :ensure t)
;;(require 'esup-child)
;;(require 'cl-lib)
;; 
;; BETTER TO USE    https://www.emacswiki.org/emacs/ProfileDotEmacs

(use-package tramp
  :defer t
  :config
  (setq tramp-default-method "ssh")
  (setq tramp-save-ad-hoc-proxies t)
  )


;; Camel case words browsed right
(use-package subword
  :diminish subword-mode
  :init
  (global-subword-mode)
  )


;;from: https://github.com/mitchty/dotfiles/blob/master/emacs/.emacs.d/emacs.org#python-mode
;;os detection
(defvar on-mswindows (string-match "windows" (symbol-name system-type))
  "Am I running under windows?")
(defvar on-osx (string-match "darwin" (symbol-name system-type))
  "Am I running under osx?")
(defvar on-linux (string-match "gnu/linux" (symbol-name system-type))
  "Am I running under linux?")
;;;;exec-path-from-shell
;;(use-package exec-path-from-shell
;;:ensure t
;;:init (if on-osx (exec-path-from-shell-initialize))
;;)
;;osx-clipboard-mode
 (when on-osx
   (use-package osx-clipboard
     :config
     (progn
       (osx-clipboard-mode +1)
       )
     )
   )

;; (use-package git-gutter
;;   :config
;;   (progn (global-git-gutter-mode t))
;;   (setq-default indicate-buffer-boundaries 'left)
;;   (setq-default indicate-empty-lines +1)
;;   )


;; ;;semantic
;; (use-package semantic
;;   :ensure t
;;   :config
;;   (progn
;;     (custom-set-variables
;;      '(global-semantic-decoration-mode t)
;;      '(global-semantic-highlight-func-mode t)
;;      '(global-semantic-idle-scheduler-mode t)
;;      '(global-semantic-idle-local-symbol-highlight-mode t)
;;      '(global-semantic-stickyfunc-mode f)
;;      )
;;     )
;;   :init(semantic-mode t)
;;   )


;; flycheck
(use-package flycheck
  :defer t
  :init
  ;;(custom-set-variables '(flycheck-indication-mode 'left-fringe))
  (global-flycheck-mode t)
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'flycheck-mode)
  )


;; C++ irony mode and completion
;; from http://cachestocaches.com/2015/8/c-completion-emacs/

(defun setup-c-clang-options ()
  (setq irony-additional-clang-options (quote ("-std=c11"))))

(defun setup-cpp-clang-options ()
(setq irony-additional-clang-options (quote ("-std=c++14" "-stdlib=libc++"))))

;; == irony-mode ==
(use-package irony
  :defer t
  :init
  (add-hook 'c++-mode-hook 'electric-pair-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (progn
    (add-hook 'c++-mode-hook 'setup-cpp-clang-options)
    (add-hook 'c-mode-hook 'setup-c-clang-options))
  )


;; == company-mode ==
;; (use-package company
;;   :ensure t
;;   :defer t
;;   :init (add-hook 'after-init-hook 'global-company-mode)
;;   (global-company-mode 1)
;;   ;:bind ("C-;" . company-complete-common)
;;   :bind ([(tab)] . company-complete-common)
;;   :config
;;   (add-hook 'prog-mode-hook 'company-mode)
;;   (setq company-idle-delay              nil
;; 	company-minimum-prefix-length   2
;; 	company-show-numbers            t
;; 	company-tooltip-limit           20
;; 	company-dabbrev-downcase        nil
;; 	company-backends                '((company-irony company-gtags company-abbrev company-clang company-files company-capf company-semantic company-cmake company-my-backend))
;; 	;;(define-key c-mode-map  [(tab)] 'company-complete)
;; 	;;(define-key c++-mode-map  [(tab)] 'company-complete)
;; 	;;(add-to-list 'company-backends 'company-c-headers)
;; 	;;(add-to-list 'company-c-headers-path-system "/usr/local/include/c++/5.3.0/")
;; 	)
;;   ;; from https://github.com/company-mode/company-mode/wiki/Writing-backends 
;;   ;; http://sixty-north.com/blog/writing-the-simplest-emacs-company-mode-backend
;;   (require 'cl-lib)
;;   (require 'company)
;;   ;; (defun company-my-backend (command &optional arg &rest ignored)
;;   ;;   (pcase command
;;   ;;     (`prefix (company-grab-symbol))
;;   ;;     (`candidates (list "woquendo@gmail.com" "william.oquendo@unisabana.edu.co" "wfoquendo@unal.edu.co"))
;;   ;;     (`meta (format "This value is named %s" arg)))
;;   ;;   )
;;   (defun company-simple-backend (command &optional arg &rest ignored)
;;     (interactive (list 'interactive))
;;     (cl-case command
;;       (interactive (company-begin-backend 'company-simple-backend))
;;       (prefix (when (looking-back "\N\\>")
;;   		(match-string 0)))
;;       (candidates (when (equal arg "\N")
;;   		    (list "\NumSI{\}{}" "\NumSI" "\NumPre{\}{}")))
;;       (meta (format "This value is named %s" arg)))
;;     )
;;   (defun company-sample-backend (command &optional arg &rest ignored)
;;     (interactive (list 'interactive))
;;     (cl-case command
;;       (interactive (company-begin-backend 'company-sample-backend))
;;       (prefix (when (looking-back "pgf\\>")
;;   		(match-string 0)))
;;       (candidates (when (equal arg "pgf")
;;   		    (list "pgfmathsetmacro{\}{}" "\pgfmathrandoninteger{\}{}{}" "\pgfmathsetseed{}")))
;;       (meta (format "This value is named %s" arg)))
;;     )
;;   )
;; (add-to-list 'company-backends 'company-my-backend)
;; (add-to-list 'company-backends 'company-simple-backend)
;; (add-to-list 'company-backends 'company-sample-backend)


;;auto-complete
;; (use-package auto-complete
;;;;   :ensure t
;;   :init (progn (require 'auto-complete-config)
;; 	       (ac-config-default)
;; 	       (global-auto-complete-mode t)
;; 	       ))


;;fix-mode
;;Highlight TODO/FIXME type messages in comments.
(use-package fic-mode
  :commands fic-mode
  :diminish fic-mode
  :config
  (add-hook 'prog-mode-hook 'fic-mode)
  (add-hook 'LaTeX-mode-hook 'fic-mode)
  )


;; clang-format
(use-package clang-format
  :ensure t
  :bind (([C-M-tab] . clang-format-region))
  :commands clang-format clang-format-buffer clang-format-region
  )


;;writegood-mode
(use-package writegood-mode
  :ensure t
  )

;;color-identifiers-mode
;;Color variables for easy identification, its like a rainbow puked over everything opened in prog-mode-hook.
(use-package color-identifiers-mode
  :defer t
  :config
  (add-hook 'prog-mode-hook 'color-identifiers-mode)
  (add-hook 'latex-mode-hook 'color-identifiers-mode)
  )


(use-package conf-mode
  :mode
  (;; systemd
   ("\\.service\\'"     . conf-unix-mode)
   ("\\.timer\\'"      . conf-unix-mode)
   ("\\.target\\'"     . conf-unix-mode)
   ("\\.mount\\'"      . conf-unix-mode)
   ("\\.automount\\'"  . conf-unix-mode)
   ("\\.slice\\'"      . conf-unix-mode)
   ("\\.socket\\'"     . conf-unix-mode)
   ("\\.path\\'"       . conf-unix-mode)
   ;; general
   ("conf\\(ig\\)?$"   . conf-mode)
   ("rc$"              . conf-mode))
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-themes zenburn-theme yasnippet yaml-mode writegood-mode which-key w3m use-package underwater-theme symon solarized-theme smex smartparens smart-mode-line selected rainbow-delimiters powerline pov-mode pdf-tools page-break-lines outshine osx-clipboard org-pomodoro org-gcal names multi-term moe-theme magit magic-latex-buffer leuven-theme latex-extra hungry-delete htmlize helm-pages helm-descbinds helm-bibtex gnuplot git-gutter-fringe ggtags flycheck fill-column-indicator fic-mode exec-path-from-shell esup ein ecb dracula-theme default-text-scale cuda-mode company-irony color-theme color-identifiers-mode clang-format cdlatex beacon autopair auto-package-update auctex-latexmk aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
