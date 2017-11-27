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
(require 'diminish)
(require 'bind-key)

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
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


(message "Start up time %.2fs" (float-time (time-subtract (current-time) my-start-time)))
