;; Last updated: <2013/04/02 22:48:34 algernon@madhouse-project.org>

(packages-maybe-install '(magit git-commit-mode git-gutter))
(when (>= emacs-major-version 24)
  (packages-maybe-install '(magithub)))

(global-set-key "\C-xg" 'magit-status)

(setq magit-commit-signoff t)

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (set-fill-column 72)
            (auto-fill-mode)))

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(eval-after-load "magit"
  '(define-key magit-status-mode-map (kbd "q") 'magit-quit-session))

(eval-after-load "ispell"
  '(when (executable-find ispell-program-name)
     (add-hook 'magit-log-edit-mode-hook 'turn-on-flyspell)))

;; Git gutter setup
(when (>= emacs-major-version 24)
  (require 'git-gutter)

  (setq-default git-gutter:window-width 1)

  (global-git-gutter-mode t)

  (setq git-gutter:lighter " G-+")

  (setq git-gutter:modified-sign "~ ")
  (setq git-gutter:added-sign "+ ")
  (setq git-gutter:deleted-sign "- ")
  (setq git-gutter:unchanged-sign nil))
