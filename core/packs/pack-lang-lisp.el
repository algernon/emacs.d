;; Last updated: <2013/11/15 11:13:10 algernon@madhouse-project.org>

(packages-maybe-install '(smartparens rainbow-delimiters))

(global-rainbow-delimiters-mode)

(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (turn-on-auto-fill)
                                   (eldoc-mode)
                                   (smartparens-strict-mode)))

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET")
  'reindent-then-newline-and-indent)

(font-lock-add-keywords 'emacs-lisp-mode
                        `(("(\\(function\\)[\[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "ƒ")
                                     nil)))))

(font-lock-add-keywords 'emacs-lisp-mode
                        `(("\\(lambda\\)[\[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "λ")
                                     nil)))))

(font-lock-add-keywords 'lisp-interaction-mode
                        `(("(\\(function\\)[\[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "ƒ")
                                     nil)))))

(font-lock-add-keywords 'lisp-interaction-mode
                        `(("\\(lambda\\)[\[[:space:]]"
                           (0 (progn (compose-region (match-beginning 1)
                                                     (match-end 1) "λ")
                                     nil)))))
