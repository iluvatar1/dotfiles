;; Add horizontal rulers with Ctrl-q Ctrl-l

(defvar my-start-time (current-time)
  "Time when Emacs was started")


;; (setq use-package-verbose t) ;; make startup slower
;; (setq load-prefer-newer t)

;; from http://cachestocaches.com/2015/8/getting-started-use-package/
;; http://cestlaz.github.io/posts/using-emacs-10-org-init/
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(use-package diminish
  :ensure t)
(use-package bind-key
  :ensure t)

;;https://github.com/rranelli/auto-package-update.el
;; run: M-x auto-package-update-now
(use-package auto-package-update
  :defer 5)

;; from http://cestlaz.github.io/posts/using-emacs-1-setup/
(use-package try
  :ensure t)

;; Organizing packages automatically
;;https://www.reddit.com/r/emacs/comments/4fqu0a/automatically_install_packages_on_startup/
(setq use-package-always-ensure t)


;; load my init org file
;; From : http://orgmode.org/worg/org-contrib/babel/intro.html
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org-mode and Org-babel
  (require 'org-install)
  (require 'ob-tangle))

;; load the org file
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


(message "Start up time %.2fs" (float-time (time-subtract (current-time) my-start-time)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nlinum spaceline smartparens-html expand-region zenburn-theme yasnippet yaml-mode writegood-mode which-key web-mode w3m use-package underwater-theme try symon solarized-theme smex smartparens smart-mode-line selected rainbow-delimiters powerline pov-mode pdf-tools pcre2el page-break-lines outshine osx-clipboard org-pomodoro org-gcal org-bullets names multi-term moe-theme magit magic-latex-buffer leuven-theme latex-extra hydra hungry-delete htmlize highlight-symbol highlight-parentheses helm-themes helm-pages helm-descbinds helm-bibtex gnuplot git-gutter-fringe ggtags flycheck fill-column-indicator fic-mode exec-path-from-shell esup ein ecb dracula-theme dired+ default-text-scale cuda-mode company-irony color-theme color-identifiers-mode clang-format cdlatex beacon autopair auto-package-update auto-compile auctex-latexmk aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
