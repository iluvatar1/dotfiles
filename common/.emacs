;; GENERAL settings

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)


(load "~/.emacs.d/init.el") ;; full of packages and their configs


;; General config
;;(set-cursor-color "white")
;;(modify-frame-parameters nil '((wait-for-wm . nil)))
(add-to-list 'load-path "~/.emacs.d/lisp")
(bind-key "M-/" 'hippie-expand)
(display-time-mode 1)
(display-battery-mode 1)
;;(put 'downcase-region 'disabled nil)
;;(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq show-trailing-whitespace t)
(setq longlines-show-hard-newlines t) ; displays "\" at the end of lines that wrap past the window's edge"
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)
(autoload 'comint-dynamic-complete-filename "comint" nil t)
(global-set-key "\M-]" 'comint-dynamic-complete-filename)
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
 '(ad-redefinition-action (quote accept))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(byte-compile-verbose nil)
 '(comint-input-autoexpand (quote history))
 '(comment-column 80)
 '(compile-command "g++-5")
 '(custom-safe-themes
   (quote
    ("9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "c72a772c104710300103307264c00a04210c00f6cc419a79b8af7890478f380e" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "ba7917b02812fee8da4827fdf7867d3f6f282694f679b5d73f9965f45590843a" "ad9747dc51ca23d1c1382fa9bd5d76e958a5bfe179784989a6a666fe801aadf2" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(delete-selection-mode t)
 '(flycheck-indication-mode (quote left-fringe))
 '(hl-sexp-background-color "#efebe9")
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(keyboard-coding-system (quote utf-8-unix))
 '(ns-function-modifier (quote hyper) t)
 '(org-agenda-files (quote ("~/Dropbox/TODO/TODO.org")))
 '(org-latex-image-default-width ".45\\textwidth")
 '(org-latex-images-centered nil)
 '(osx-clipboard-mode t)
 '(package-selected-packages
   (quote
    (irony helm-spotify helm-themes org-beautify-theme org-brain org-clock-today dracula-theme org auto-package-update zenburn-theme yasnippet yaml-mode writegood-mode which-key w3m use-package symon solarized-theme smex smartparens smart-mode-line selected rainbow-delimiters powerline pov-mode pdf-tools page-break-lines outshine osx-clipboard org-pomodoro org-gcal names multi-term moe-theme magit magic-latex-buffer leuven-theme latex-extra hungry-delete htmlize helm-pages helm-descbinds helm-bibtex gnuplot git-gutter-fringe ggtags flycheck fill-column-indicator fic-mode exec-path-from-shell esup ein ecb default-text-scale cuda-mode company-irony color-theme color-identifiers-mode clang-format cdlatex beacon autopair auto-complete auctex-latexmk aggressive-indent)))
 '(scalable-fonts-allowed t)
 '(scroll-step 1)
 '(send-mail-function (quote smtpmail-send-it))
 '(setenv "PDFLATEX" t)
 '(use-package-verbose t)
 '(version-control t)
 '(woman-locale "en_US.UTF-8"))
(delete-selection-mode 1)

;; syntax highlight everywhere
(global-font-lock-mode t)
(transient-mark-mode t)
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
