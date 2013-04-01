;; Last updated: <2013/04/01 18:03:39 algernon@madhouse-project.org>

(packages-maybe-install '(fuzzy auto-complete))

(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)

(global-set-key (kbd "<backtab>") 'auto-complete)
