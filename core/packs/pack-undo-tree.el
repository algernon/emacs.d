;; Last updated: <2013/04/02 01:02:52 algernon@madhouse-project.org>

(when (>= emacs-major-version 24)
  (packages-maybe-install '(undo-tree))

  (global-undo-tree-mode))
