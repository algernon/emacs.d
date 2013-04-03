;; Last updated: <2013/04/03 10:24:02 algernon@madhouse-project.org>

(packages-maybe-install '(fuzzy auto-complete))

(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)
(diminish 'auto-complete-mode)

(global-set-key (kbd "<backtab>") 'auto-complete)
