;; Last updated: <2015/06/26 12:16:58 algernon@madhouse-project.org>

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :config (global-company-mode))

(use-package fuzzy
  :ensure t
  :defer t)

(provide 'aec/packs/auto-complete)
