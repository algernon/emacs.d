;; Last updated: <2015/01/06 13:19:02 algernon@madhouse-project.org>

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
            (font-lock-add-keywords
             'js2-mode `(("\\(function *\\)("
                         (0 (progn (compose-region (match-beginning 1)
                                                   (match-end 1) "\u0192")
                                   nil)))))))
