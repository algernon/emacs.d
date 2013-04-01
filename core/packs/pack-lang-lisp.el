;; Last updated: <2013/04/01 14:00:09 algernon@madhouse-project.org>

(packages-maybe-install '(paredit rainbow-delimiters))

(global-rainbow-delimiters-mode)

(add-hook 'emacs-lisp-mode-hook '(lambda ()
				   (turn-on-auto-fill)
				   (eldoc-mode)
				   (paredit-mode)))

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET")
  'reindent-then-newline-and-indent)
