;; Last updated: <2013/04/01 15:29:19 algernon@madhouse-project.org>

(packages-maybe-install '(magit git-commit-mode))

(global-set-key "\C-xg" 'magit-status)

(setq magit-commit-signoff t)
