;;; angthalion.el -- angthalion extras

;; Copyright (C) 2014
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2014/02/27 09:40:43 algernon@madhouse-project.org>

(packages-maybe-install '(molokai-theme cyberpunk-theme))

(when (and window-system
           (>= emacs-major-version 24))
  (if (is-presentingp)
      (load-theme 'cyberpunk)
    (load-theme 'molokai))
  (diminish-undo 'diminished-modes)
  (sml/setup))
