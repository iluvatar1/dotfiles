;; see https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/
(doom! :completion
       (company)
       (ivy)
       ;;(ivy +prescient -childframe -fuzzy +icons)
       ;;irony

       :ui
       doom
       ;;doom-dashboard
       ;;doom-quit
       hl-todo
       ;;hydra
       minimap
       modeline
       ;;ophints
       ;;(popup +defaults)
       neotree
       ;;treemacs
       ;;(ligature +extras)
       ;;nav-flash
       ;;ophints ; highlight the region an operation acts on
       ;;zen                   ; distraction-free coding or writing
       ;;window-select         ; visually switch windows
       
       :editor
       file-templates
       ;; fold
       snippets
       ;;clang-format
       ;;(format +onsave)    ; automated prettiness
       multiple-cursors    ; editing in many places at once
       format              ; automated prettiness

       :emacs
       dired
       ;;electric
       undo

       :term
       vterm

       :checkers
       ;;(syntax +childframe)  ; tasing you for every semicolon you forget
       ;;spell                 ; tasing you for misspelling mispelling

       :tools
       (eval +overlay)
       (lsp +eglot)
       magit
       ;;pdf
       (debugger +lsp)              ; FIXME stepping through code, to help you add bugs
       ;;lookup                ; navigate your code and its documentation
       ;;(magit +forge)        ; a git porcelain for Emacs
       make                ; run make tasks from Emacs

       :lang 
       (cc +lsp)
       ;;emacs-lisp
       ;;(latex
       ;; +latexmk
       ;; +cdlatex
       ;; +fold)
       markdown
       (org +present +gnuplot +pandoc)
       ;;(org
       ;; +pretty
       ;; +dragndrop
       ;; +jupyter
       ;; +pandoc
       ;; +gnuplot
       ;; +pomodoro
       ;; +present)
       (python +lsp)
       ;;(python +conda +pyright)
       (sh +lsp)
       yaml

       :email
       (:if (executable-find "mu") (mu4e +org +gmail))

       :app
       ;;calendar
       ;;(rss +org)

       :config
       (default +smartparens)
       )
