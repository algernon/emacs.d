;; Last updated: <2013/04/03 10:23:32 algernon@madhouse-project.org>

(when (>= emacs-major-version 24)
  (packages-maybe-install '(undo-tree))

  (global-undo-tree-mode)

  (eval-after-load "undo-tree"
    '(diminish 'undo-tree-mode)))
