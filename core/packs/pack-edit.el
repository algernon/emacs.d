;; Last updated: <2014/01/29 13:26:40 algernon@madhouse-project.org>

(packages-maybe-install '(fold-this))

(require 'fold-this)

(global-set-key (kbd "C-c C-f") 'fold-this-all)
(global-set-key (kbd "C-c C-F") 'fold-this)
(global-set-key (kbd "C-c M-f") 'fold-this-unfold-all)

