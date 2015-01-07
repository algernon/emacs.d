;; Last updated: <2015/01/07 11:16:57 algernon@madhouse-project.org>

(use-package js2-mode
  :init (add-to-list 'auto-mode-alist
                     '("\\.\\(js\\)" . js2-mode))
  :config (progn
            (use-package skewer-mode)

            (defun esk-paredit-nonlisp ()
              "Turn on paredit mode for non-lisps."
              (interactive)
              (set (make-local-variable 'paredit-space-for-delimiter-predicates)
                   '((lambda (endp delimiter) nil)))
              (paredit-mode 1))

            (define-key js2-mode-map "{" 'paredit-open-curly)
            (define-key js2-mode-map "}" 'paredit-close-curly-and-newline)
            (add-hook 'js2-mode-hook 'esk-paredit-nonlisp)
            (setq js-indent-level 2)
            ;; fixes problem with pretty function font-lock
            (define-key js2-mode-map (kbd ",") 'self-insert-command)
            (push '("function" . ?λ) prettify-symbols-alist)
            (prettify-symbols-mode)))
