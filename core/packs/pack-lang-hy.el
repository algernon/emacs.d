;; Last updated: <2015/01/07 11:09:14 algernon@madhouse-project.org>

(use-package hy-mode
  :config (progn
            (add-hook 'hy-mode-hook
                      '(lambda ()
                         (turn-on-auto-fill)
                         (paredit-mode)
                         (push '("fn" . ?ƒ) prettify-symbols-alist)
                         (push '("lambda" . ?λ) prettify-symbols-alist)
                         (prettify-symbols-mode)))))
