;; Last updated: <2013/04/01 20:42:16 algernon@madhouse-project.org>

(packages-maybe-install '(magit git-commit-mode magithub git-gutter))

(global-set-key "\C-xg" 'magit-status)

(setq magit-commit-signoff t)

(add-hook 'magit-log-edit-mode-hook
	  (lambda ()
	    (set-fill-column 72)
	    (auto-fill-mode)))

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'magit-log-edit-mode-hook 'turn-on-flyspell)))

;; Git gutter setup
(require 'git-gutter)

(setq git-gutter:window-width 2)

(global-git-gutter-mode t)

(setq git-gutter:lighter " G-+")

(setq git-gutter:modified-sign "~ ")
(setq git-gutter:added-sign "+ ")
(setq git-gutter:deleted-sign "- ")
(setq git-gutter:unchanged-sign nil)
