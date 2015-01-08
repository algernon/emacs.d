;; Last updated: <2015/01/08 12:51:55 algernon@madhouse-project.org>

(use-package paredit
  :ensure t
  :defer t
  :commands (paredit-wrap-round)
  :diminish (paredit-mode . " π")
  :config (progn
            (defun paredit-wrap-round-from-behind ()
              (interactive)

              (forward-sexp -1)
              (paredit-wrap-round)
              (insert " ")
              (forward-char -1))

            (define-key paredit-mode-map (kbd "M-)")
              #'paredit-wrap-round-from-behind))
  :init (dolist (hook '(clojure-mode-hook emacs-lisp-mode-hook hy-mode-hook))
              (add-hook hook #'paredit-mode)))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init (dolist (hook '(clojure-mode-hook emacs-lisp-mode-hook hy-mode-hook))
            (add-hook hook #'rainbow-delimiters-mode)))

(define-key read-expression-map (kbd "TAB") #'completion-at-point)
(define-key lisp-mode-shared-map (kbd "RET")
  #'reindent-then-newline-and-indent)

(add-hook 'emacs-lisp-mode-hook #'turn-on-auto-fill)
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook #'prettify-symbols-mode)

(defun aec-emacs-lisp-mode-prettify ()
  "Prettify (function) to (ƒ)"

  (push '("function" . ?ƒ) prettify-symbols-alist))

(add-hook 'emacs-lisp-mode-hook #'aec-emacs-lisp-mode-prettify)

(provide 'aec/packs/lang/lisp)
