;; Last updated: <2013/11/28 20:23:24 algernon@madhouse-project.org>

(if (and (eq debian-emacs-flavor 'emacs-snapshot)
         (not (is-presentingp)))
    (progn
      (server-start)))
