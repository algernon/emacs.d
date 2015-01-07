;; Last updated: <2015/01/07 11:06:13 algernon@madhouse-project.org>

(use-package paredit
  :diminish (paredit-mode . " π")
  :init (progn (define-key paredit-mode-map (kbd "M-)")
                 'paredit-wrap-round-from-behind)))

(use-package rainbow-delimiters)

;; Paredit additions
(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET")
  'reindent-then-newline-and-indent)

(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (turn-on-auto-fill)
                                   (eldoc-mode)
                                   (paredit-mode)
                                   (rainbow-delimiters-mode)
                                   (aggressive-indent-mode)
                                   (push '("function" . ?ƒ) prettify-symbols-alist)
                                   (prettify-symbols-mode)))
