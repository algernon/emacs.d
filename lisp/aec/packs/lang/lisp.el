;; Last updated: <2015/01/26 08:29:52 algernon@madhouse-project.org>

(use-package paredit
  :ensure t
  :defer t
  :commands (paredit-wrap-round)
  :diminish (paredit-mode . " ")
  :config (progn
            (defun paredit-wrap-round-from-behind ()
              (interactive)

              (forward-sexp -1)
              (paredit-wrap-round)
              (insert " ")
              (forward-char -1))

            (define-key paredit-mode-map (kbd "M-)")
              #'paredit-wrap-round-from-behind)
            (define-key paredit-mode-map (kbd "C-<up>")
              #'paredit-splice-sexp-killing-backward)
            (define-key paredit-mode-map (kbd "C-<down>")
              #'paredit-splice-sexp-killing-forward)
            (define-key paredit-mode-map (kbd "M-<up>") nil)
            (define-key paredit-mode-map (kbd "M-<down>") nil))
  :init (dolist (hook '(clojure-mode-hook emacs-lisp-mode-hook hy-mode-hook))
          (add-hook hook #'paredit-mode)))

(use-package lispy
  :ensure t
  :defer t
  :diminish (lispy-mode . " λ")
  :init (dolist (hook '(clojure-mode-hook emacs-lisp-mode-hook hy-mode-hook))
          (add-hook hook #'lispy-mode)))

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

(use-package elisp-slime-nav
  :ensure t
  :diminish elisp-slime-nav-mode
  :init (add-hook 'emacs-lisp-mode-hook #'elisp-slime-nav-mode))

(provide 'aec/packs/lang/lisp)
