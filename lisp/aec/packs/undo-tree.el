;; Last updated: <2015/01/08 12:49:31 algernon@madhouse-project.org>

(use-package undo-tree
  :ensure t
  :demand t
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

(provide 'aec/packs/undo-tree)
