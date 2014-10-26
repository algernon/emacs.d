;; Last updated: <2014/10/26 11:44:49 algernon@madhouse-project.org>

(packages-maybe-install '(fold-this anzu aggressive-indent))

(require 'fold-this)

(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

(global-anzu-mode t)
