;; Last updated: <2015/01/08 11:34:43 algernon@madhouse-project.org>

(use-package company-c-headers
  :ensure t
  :defer t)

(defun aec-c-mode-setup ()
  "Setup C mode"

  (setq c-auto-newline t)
  (c-set-style "gnu"))

(use-package c-mode
  :defer t
  :bind (("C-c d" . gdb)
         ("C-w m" . gdb-many-windows))
  :init (progn
          (add-hook 'c-mode-hook #'turn-on-auto-fill)
          (add-hook 'c-mode-hook #'aec-c-mode-setup))
  :config (setq c-backspace-function #'backward-delete-char
                c-block-comment-prefix "* "
                c-indent-comments-syntactically-p t))
