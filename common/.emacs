;; GENERAL settings

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(load "~/.emacs.d/init.el")
;;(set-cursor-color "white")
(modify-frame-parameters nil '((wait-for-wm . nil)))
(add-to-list 'load-path "~/.emacs.d/lisp")
;;(require 'cl)
;;(require 'ido)
;;(require 'ffap)
;;(require 'uniquify)
;;(require 'ansi-color)
;;(require 'recentf)
;;(require 'smooth-scrolling)
;;(require 'whitespace)
;;(require 'dired-x)
;;(require 'compile)
;;(ido-mode t)
;;(menu-bar-mode -1)
;;(normal-erase-is-backspace-mode 1) ;; VERY BAD
(bind-key "M-/" 'hippie-expand)
(display-time-mode 1)
(display-battery-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq longlines-show-hard-newlines t) ; displays "\" at the end of lines that wrap past the window's edge"
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(autoload 'comint-dynamic-complete-filename "comint" nil t)
(global-set-key "\M-]" 'comint-dynamic-complete-filename)
;(global-set-key (kbd "<M-up>") 'windmove-up)
;(global-set-key (kbd "<M-down>") 'windmove-down)
;(global-set-key (kbd "<M-left>") 'windmove-left)
;(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(setq inhibit-splash-screen t); Disable splash screen
(setq visible-bell t); Flashes on error
(setq calendar-week-start-day 1); Calendar should start on Monday

;; camel case word navigation
(when (boundp 'subword-mode)
  (add-hook 'after-change-major-mode-hook '(lambda () (subword-mode 1))))

(setq enable-local-variables :safe)



;;(global-visual-line-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-label-function (quote reftex-label))
 '(TeX-electric-math (quote ("$" . "$")) t)
 '(TeX-electric-sub-and-superscript 1 t)
 '(TeX-insert-braces 1 t)
 '(TeX-source-correlate-method (quote auto) t)
 '(TeX-source-correlate-start-server t t)
 '(ad-redefinition-action (quote accept))
 '(autopair-blink (quote nil))
 '(byte-compile-verbose nil)
 '(calendar-week-start-day 1 t)
 '(column-number-mode t)
 '(comint-input-autoexpand (quote history))
 '(comment-column 80)
 '(compilation-scroll-output (quote first-error))
 '(compile-command "g++ ")
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(delete-selection-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(enable-local-variables :safe)
 '(flycheck-indication-mode (quote left-fringe))
 '(global-company-mode t)
 '(inhibit-startup-screen t)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(keyboard-coding-system (quote utf-8-unix))
 '(ns-function-modifier (quote hyper))
 '(org-latex-image-default-width ".45\\textwidth")
 '(org-latex-images-centered nil)
 '(osx-clipboard-mode t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (hungry-delete beacon zenburn-theme yasnippet yaml-mode writegood-mode w3m use-package symon solarized-theme smex smartparens rainbow-delimiters pov-mode pdf-tools page-break-lines outshine osx-clipboard names multi-term magit magic-latex-buffer latex-extra htmlize helm-pages helm-bibtex gnuplot git-gutter-fringe flycheck fill-column-indicator fic-mode exec-path-from-shell esup ecb default-text-scale cuda-mode company-irony color-identifiers-mode clang-format cdlatex autopair auto-complete auctex-latexmk aggressive-indent)))
 '(reftex-enable-partial-scans t t)
 '(reftex-plug-into-AUCTeX t t)
 '(reftex-use-multiple-selection-buffers t t)
 '(safe-local-variable-values (quote ((reftex-default-bibliography "./biblio.bib"))))
 '(scalable-fonts-allowed t)
 '(scroll-step 1)
 '(send-mail-function (quote smtpmail-send-it))
 '(setenv "PDFLATEX" t)
 '(show-paren-mode t)
 '(smtpmail-smtp-server "")
 '(smtpmail-smtp-service 25)
 '(use-package-verbose t)
 '(vc-follow-symlinks t)
 '(version-control t)
 '(woman-locale "en_US.UTF-8")
 '(word-wrap t))
(delete-selection-mode 1)



;; syntax highlight everywhere
(global-font-lock-mode t)

(transient-mark-mode t)
(when window-system
  (global-linum-mode t)
  )

;; Show matching parens (mixed style)
(show-paren-mode t)
(setq show-paren-delay 0.0)
(setq show-paren-mismatch t)
(setq show-paren-style 'parenthesis)	; highlight just parens
;;(setq show-paren-style 'expression) ; highlight entire expression

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

;; auto insert bracket
;;(electric-pair-mode 1)
;;(add-hook 'LaTeX-mode-hook
;;'(lambda ()
;;(define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))

;; save command history
(setq savehist-additional-variables    ;; also save...
      '(kill-ring search-ring regexp-search-ring))    ;; ... my search entries
(setq savehist-file "~/.emacs.d/savehist") ;; keep my home clean
(savehist-mode 1) ;; customize and THEN activate mode

;; ibuffer mode
					;(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; misc
(setq mac-command-key-is-meta nil)
(setq mac-option-key-is-meta t)
(setq mac-option-modifier 'meta)
;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier nil)
(setq ns-function-modifier 'hyper)
;;(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq x-select-enable-clipboard t)

;; utf 8 support
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(prefer-coding-system 'utf-8)

;; arg >= 1 enable the menu bar. Menu bar is the File, Edit, Options,
;; Buffers, Tools, Emacs-Lisp, Help
;; (menu-bar-mode 0)
;; With numeric ARG, display the tool bar if and only if ARG is
;; positive.  Tool bar has icons document (read file), folder (read
;; directory), X (discard buffer), disk (save), disk+pen (save-as),
;; back arrow (undo), scissors (cut), etc.
;;(when window-system
;;(tool-bar-mode 0)
;;)

;; BETTER WRITING

;; comment column
(setq-default comment-column 80)

;; Transparency and color
;;(setq initial-frame-alist '((background-color . "honeydew2") (left . 50)  ))
;(set-background-color        "wheat1") ; Set emacs bg color
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;(set-frame-parameter (selected-frame) 'alpha '(95 85))
;; (add-to-list 'default-frame-alist '(alpha 90 50))
;; Set region background colour
;;(set-face-background 'region "blue")
;; Set emacs background colour
;;(set-background-color "black")


;; writeroom like
(defun writeroom ()
  "Switches to a WriteRoom-like fullscreen style"
  (interactive)
  (when (featurep 'aquamacs)
    ;; switch to white on black
    (color-theme-initialize)
    (color-theme-clarity)
    ;; switch to Garamond 36pt
    (aquamacs-autoface-mode 0)
    (set-frame-font "-apple-garamond-medium-r-normal--36-360-72-72-m-360-iso10646-1")
    ;; switch to fullscreen mode
    (aquamacs-toggle-full-frame)))


;; Bypass the annoying startup screen
(setq inhibit-startup-screen t)


;; occur mode
(global-set-key (kbd "C-c o") 'occur)


;; javascript
                                        ; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
;; jscommint
;;(require 'js-comint)
;;(setq inferior-js-program-command "/usr/bin/java org.mozilla.javascript.tools.shell.Main")
;;(setq inferior-js-program-command "/usr/local/bin/node")
;;(add-hook 'js2-mode-hook '(lambda ()
;;			    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
;;			    (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
;;			    (local-set-key "\C-cb" 'js-send-buffer)
;;			    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
;;			    (local-set-key "\C-cl" 'js-load-file-and-go)
;;			    ))
;;(load "js-config.el")
;;(setq inferior-js-program-command "/usr/local/bin/node")
;;(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
;;(require 'sws-mode)
;;(require 'jade-mode)
;;(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;;(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
;; jshint
;;(;add-to-list 'load-path "~/.emacs.d/jshint-mode")
;;(require 'flymake-jshint)
;;(add-hook 'javascript-mode-hook
;;	  (lambda () (flymake-mode t)))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . jshint-mode))
;; js2-mode
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;;(setq inferior-js-program-command "node")



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


;; ;; iPython
;; (setq ipython-command "~/.emacs.d/ipython")
;; (require 'ipython)
;; (setq py-python-command-args '("-pylab" "-colors" "LightBG"))
;; (require 'python-mode)
;; (setq ipython-completion-command-string "print(';'.join(__IP.Completer.all_completions('%s')))\n")

;; ;; ipython-anything
;; (require 'anything-ipython)
;; (add-hook 'python-mode-hook #'(lambda ()
;;                                 (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))
;; (add-hook 'ipython-shell-hook #'(lambda ()
;;                                   (define-key py-mode-map (kbd "M-<tab>") 'anything-ipython-complete)))




;; ;; CEDET
;; ;; Enable EDE (Project Management) features
;;(add-to-list 'load-path "/Applications/Aquamacs.app/Contents/Resources/lisp/cedet")
;; (load-file "~/Library/Application Support/Aquamacs Emacs/cedet-1.0/common/cedet.el")
;;(load "cedet")
;;(global-ede-mode 1)                      ; Enable the Project management system
;; ;; These two options below are only for the stand-alone CEDET. Not the one
;; ;; now included with newer Aquamacs/Emacs.
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu

;; ;; to enable code folding
;;(load "semantic")
;;(semantic-load-enable-minimum-features)
;;(global-semantic-folding-mode 1)
;;(global-semantic-tag-folding-mode 1)

;; ;; ;; Enable EDE for a pre-existing C++ project
;; ;; ;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;; ;; ;; Enabling Semantic (code-parsing, smart completion) features
;; ;; ;; Select one of the following:
;; ;; ;; * This enables the database and idle reparse engines
;; ;; ;;(semantic-load-enable-minimum-features)
;; ;; ;; * This enables some tools useful for coding, such as summary mode
;; ;; ;;   imenu support, and the semantic navigator
;; ;; ;;(semantic-load-enable-code-helpers)
;; ;; ;; * This enables even more coding tools such as intellisense mode
;; ;; ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; ;; (semantic-load-enable-gaudy-code-helpers)
;; ;; ;; * This enables the use of Exuberent ctags if you have it installed.
;; ;; ;;   If you use C++ templates or boost, you should NOT enable it.
;; ;; ;; (semantic-load-enable-all-exuberent-ctags-support)

;; ;; ;;integrate semantic with Imenu
;; ;; (defun my-semantic-hook ()
;; ;;   (imenu-add-to-menubar "TAGS"))
;; ;; (add-hook 'semantic-init-hooks 'my-semantic-hook)

;; ;; ;;load Semanticdb
;; ;; (require 'semanticdb)
;; ;; ;;(global-semanticdb-minor-mode 1)

;; ;; ;; Enable SRecode (Template management) minor-mode.
;; ;; ;; (global-srecode-minor-mode 1)

;; ;; ;; Author CEDET conf
;; ;; (semantic-load-enable-excessive-code-helpers)
;; ;; (semantic-load-enable-semantic-debugging-helpers)

;; ;; (setq senator-minor-mode-name "SN")
;; ;; (setq semantic-imenu-auto-rebuild-directory-indexes nil)
;; ;; (global-srecode-minor-mode 1)
;; ;; (global-semantic-mru-bookmark-mode 1)

;; ;; (require 'semantic-decorate-include)

;; ;; ;; GCC setup
;; (require 'semantic-gcc)

;; ;; Smart completions
;; ;;(require 'semantic-ia)

;; ;; (setq-mode-local c-mode semanticdb-find-default-throttle
;; ;;                  '(project unloaded system recursive))

;; ;; (setq-mode-local c++-mode semanticdb-find-default-throttle
;; ;;                  '(project unloaded system recursive))

;; ;; (setq-mode-local erlang-mode semanticdb-find-default-throttle
;; ;;                  '(project unloaded system recursive))

;; ;; (require 'eassist)


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




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
