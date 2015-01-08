;; Last updated: <2015/01/08 12:51:45 algernon@madhouse-project.org>

(defun esk-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."

  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  (paredit-mode 1))

(defun aec-js2-mode-setup ()
  "Setup JS2 mode"

  (push '("function" . ?λ) prettify-symbols-alist))

(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.\\(js\\)"
  :init (progn
          (use-package skewer-mode
            :ensure t
            :defer t)

          (add-hook 'js2-mode-hook #'esk-paredit-nonlisp)
          (add-hook 'js2-mode-hook #'prettify-symbols-mode)
          (add-hook 'js2-mode-hook #'aec-js2-mode-setup))
  :config (progn
            (define-key js2-mode-map "{" #'paredit-open-curly)
            (define-key js2-mode-map "}"
              #'paredit-close-curly-and-newline)
            ;; fixes problem with pretty function font-lock
            (define-key js2-mode-map (kbd ",") #'self-insert-command)
            (setq js-indent-level 2)))

(provide 'aec/packs/lang/js)
