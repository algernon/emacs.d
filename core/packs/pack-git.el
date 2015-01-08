;; Last updated: <2015/01/08 11:08:49 algernon@madhouse-project.org>

(use-package git-commit-mode
  :ensure t
  :defer t
  :init (progn
          (add-hook 'git-commit-mode-hook #'auto-fill-mode)
          (add-hook 'git-commit-mode-hook #'turn-on-flyspell)))

(use-package magit
  :ensure t
  :defer t
  :diminish magit-auto-revert-mode
  :bind (("C-x g" . magit-status))
  :config (progn
            (setq magit-commit-signoff t)
            (define-key magit-status-mode-map (kbd "q")
              #'magit-quit-session)
            (advice-add #'magit-key-mode-popup-committing :after
                        (lambda ()
                          (magit-key-mode-toggle-option 'committing "-s")
                          (magit-key-mode-toggle-option 'committing "-v")))))

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
  :ensure t
  :defer t
  :idle (global-git-gutter-mode t)
  :diminish git-gutter-mode
  :config (setq
           git-gutter:window-width 1
           git-gutter:hide-gutter t
           git-gutter:lighter " G-+"
           git-gutter:modified-sign "~ "
           git-gutter:added-sign "+ "
           git-gutter:deleted-sign "- "
           git-gutter:unchanged-sign nil))

(use-package gitconfig-mode
  :ensure t
  :defer t)

(use-package gitignore-mode
  :ensure t
  :defer t)
