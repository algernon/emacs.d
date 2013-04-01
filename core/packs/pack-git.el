;; Last updated: <2013/04/01 18:44:32 algernon@madhouse-project.org>

(packages-maybe-install '(magit git-commit-mode magithub))

(global-set-key "\C-xg" 'magit-status)

(setq magit-commit-signoff t)

(add-hook 'magit-log-edit-mode-hook
	  (lambda ()
	    (set-fill-column 72)
	    (auto-fill-mode)))

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'magit-log-edit-mode-hook 'turn-on-flyspell)))

