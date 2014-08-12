;; Last updated: <2014/08/12 14:15:32 algernon@madhouse-project.org>

(packages-maybe-install '(company-c-headers))

(global-set-key "\C-cd" 'gdb)
(global-set-key "\C-wm" 'gdb-many-windows)

(add-hook 'c-mode-hook '(lambda ()
                          (c-set-style "gnu")
                          (setq c-auto-newline t)
                          (auto-fill-mode)))

(setq c-backspace-function 'backward-delete-char
      c-comment-continuation-stars "* "
      c-indent-comments-syntactically-p t)
