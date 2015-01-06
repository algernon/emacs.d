;; Last updated: <2015/01/06 13:08:38 algernon@madhouse-project.org>

(use-package company-c-headers)

(use-package c-mode
  :bind (("C-c d" . gdb)
         ("C-w m" . gdb-many-windows))
  :config (progn
            (add-hook 'c-mode-hook '(lambda ()
                                      (c-set-style "gnu")
                                      (setq c-auto-newline t)
                                      (auto-fill-mode)))

            (setq c-backspace-function 'backward-delete-char
                  c-comment-continuation-stars "* "
                  c-indent-comments-syntactically-p t)))
