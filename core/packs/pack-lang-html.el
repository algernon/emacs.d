;; Last updated: <2015/01/08 11:10:07 algernon@madhouse-project.org>

(use-package web-mode
  :ensure t
  :defer t
  :mode "\\.html?\\'"
  :init (add-hook 'web-mode-hook #'turn-off-auto-fill))
