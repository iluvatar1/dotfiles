;; Add horizontal rulers with Ctrl-q Ctrl-l

(defvar my-start-time (current-time)
  "Time when Emacs was started")

;; (setq use-package-verbose t) ;; make startup slower
;; (setq load-prefer-newer t)

;; From: https://writequit.org/org/settings.html
;; keep customize settings in their own file
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; from http://cachestocaches.com/2015/8/getting-started-use-package/
;; http://cestlaz.github.io/posts/using-emacs-10-org-init/
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa-stb" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
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

;;; from http://cestlaz.github.io/posts/using-emacs-1-setup/
;;(use-package try
;;  :ensure t)

;; Organizing packages automatically
;;https://www.reddit.com/r/emacs/comments/4fqu0a/automatically_install_packages_on_startup/
(setq use-package-always-ensure t)


;; load my init org file
;; ;; From : http://orgmode.org/worg/org-contrib/babel/intro.html
;; (setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
;; (let* ((org-dir (expand-file-name
;;                  "lisp" (expand-file-name
;;                          "org" (expand-file-name
;;                                 "src" dotfiles-dir))))
;;        (org-contrib-dir (expand-file-name
;;                          "lisp" (expand-file-name
;;                                  "contrib" (expand-file-name
;;                                             ".." org-dir))))
;;        (load-path (append (list org-dir org-contrib-dir)
;;                           (or load-path nil))))
;;   ;; load up Org-mode and Org-babel
;;   (require 'org-install)
;;   (require 'ob-tangle))
;; ;; load the org file
;; (org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

;; From https://writequit.org/org/settings.html
(require 'org)
(require 'ob-tangle)
(org-babel-load-file
 (expand-file-name "~/.emacs.d/myinit.org"
                   user-emacs-directory))


(message "Start up time %.2fs" (float-time (time-subtract (current-time) my-start-time)))

