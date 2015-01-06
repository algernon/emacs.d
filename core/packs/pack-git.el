;; Last updated: <2015/01/06 14:00:20 algernon@madhouse-project.org>

(use-package git-commit-mode)

(use-package magit
  :diminish magit-auto-revert-mode
  :init (add-hook 'git-commit-mode-hook
                  (lambda ()
                    (set-fill-column 72)
                    (auto-fill-mode)))
  :bind (("C-x g" . magit-status))
  :config (progn
            (setq magit-commit-signoff t)
            (define-key magit-status-mode-map (kbd "q")
              'magit-quit-session)
            (eval-after-load "ispell"
              '(when (executable-find ispell-program-name)
                 (add-hook 'git-commit-mode-hook 'turn-on-flyspell)))))

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(use-package git-gutter
  :init (global-git-gutter-mode t)
  :diminish git-gutter-mode
  :config (setq
           git-gutter:window-width 1
           git-gutter:hide-gutter t
           git-gutter:lighter " G-+"
           git-gutter:modified-sign "~ "
           git-gutter:added-sign "+ "
           git-gutter:deleted-sign "- "
           git-gutter:unchanged-sign nil))

(use-package gitconfig-mode)

(use-package gitignore-mode)
