;; Last updated: <2015/06/17 09:31:33 algernon@madhouse-project.org>

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init (global-company-mode))

(use-package fuzzy
  :ensure t
  :defer t)

(provide 'aec/packs/auto-complete)
