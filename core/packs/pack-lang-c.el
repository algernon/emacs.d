;; Last updated: <2013/04/02 00:03:44 algernon@madhouse-project.org>

(global-set-key "\C-cd" 'gdb)
(global-set-key "\C-wm" 'gdb-many-windows)

(add-hook 'c-mode-hook '(lambda ()
                          (c-set-style "gnu")
                          (setq c-auto-newline t)
                          (auto-fill-mode)))

(setq c-backspace-function 'backward-delete-char
      c-comment-continuation-stars "* "
      c-indent-comments-syntactically-p t)
