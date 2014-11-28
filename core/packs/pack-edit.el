;; Last updated: <2014/11/28 23:46:43 algernon@madhouse-project.org>

(packages-maybe-install '(fold-this anzu aggressive-indent
                          hungry-delete))

(require 'fold-this)

(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

(global-anzu-mode t)
(global-hungry-delete-mode t)
