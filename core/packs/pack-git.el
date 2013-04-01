;; Last updated: <2013/04/01 16:09:38 algernon@madhouse-project.org>

(packages-maybe-install '(magit git-commit-mode magithub))

(global-set-key "\C-xg" 'magit-status)

(setq magit-commit-signoff t)
