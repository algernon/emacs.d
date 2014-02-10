;; Last updated: <2014/02/10 11:50:24 algernon@madhouse-project.org>

(packages-maybe-install '(fold-this anzu))

(require 'fold-this)

(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

(global-anzu-mode t)
