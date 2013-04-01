;; Last updated: <2013/04/01 19:05:26 algernon@madhouse-project.org>

(packages-maybe-install '(expand-region))
(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)
