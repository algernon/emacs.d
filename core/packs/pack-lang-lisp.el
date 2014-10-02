;; Last updated: <2014/10/02 14:22:39 algernon@madhouse-project.org>

(packages-maybe-install '(paredit rainbow-delimiters))

;; Paredit additions
(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "M-)")
       'paredit-wrap-round-from-behind)
     (diminish 'paredit-mode " π")))

(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (turn-on-auto-fill)
                                   (eldoc-mode)
                                   (paredit-mode)
                                   (rainbow-delimiters-mode)))

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
