;; Last updated: <2014/01/28 12:44:51 algernon@madhouse-project.org>

(packages-maybe-install '(git-commit-mode magit git-gutter))

(global-set-key "\C-xg" 'magit-status)

(setq magit-commit-signoff t)

(add-hook 'git-commit-mode-hook
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
     (add-hook 'git-commit-mode-hook 'turn-on-flyspell)))

;; Git gutter setup
(when (>= emacs-major-version 24)
  (require 'git-gutter)

  (setq-default git-gutter:window-width 1
                git-gutter:hide-gutter t)

  (global-git-gutter-mode t)

  (setq git-gutter:lighter " G-+")

  (setq git-gutter:modified-sign "~ ")
  (setq git-gutter:added-sign "+ ")
  (setq git-gutter:deleted-sign "- ")
  (setq git-gutter:unchanged-sign nil)

  (diminish 'git-gutter-mode))
