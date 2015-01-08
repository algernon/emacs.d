;; Last updated: <2015/01/08 09:22:53 algernon@madhouse-project.org>

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :idle (global-company-mode))

(use-package fuzzy
  :ensure t
  :defer t)
