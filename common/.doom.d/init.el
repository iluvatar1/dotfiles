(doom! :completion
        company
        ivy
	irony
        :ui
        doom
        doom-dashboard
        ;doom-quit
        hl-todo
        hydra
        minimap
        modeline
        ;ophints
        ;(popup +defaults)
        neotree
        treemacs
        :editor
        file-templates
        fold
        snippets
        :emacs
        dired
        electric
        undo
        ;:term
        ;vterm
        :checkers
        ;syntax
        :tools
        (eval +overlay)
        ;;lsp
        magit
        make
        ;;pdf
        :lang 
        (cc +irony)
        emacs-lisp
        (latex
	 +latexmk
	 +cdlatex
	 +fold)
        markdown
        (org
	 +pretty
	 +dragndrop
	 +jupyter
	 +pandoc
	 +gnuplot
	 +pomodoro
	 +present)
        ;(python +lsp +conda)
        (python +conda +pyright)
        sh
	yaml
        :email
	(:if (executable-find "mu") (mu4e +org +gmail))
        :app
        calendar
	(rss +org)
        :config
        (default +smartparens)
)
