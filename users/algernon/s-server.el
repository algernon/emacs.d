;; Last updated: <2013/04/01 15:16:17 algernon@madhouse-project.org>

(if (and (>= emacs-major-version 24)
         (not (is-presentingp)))
    (progn
      (server-start)))
