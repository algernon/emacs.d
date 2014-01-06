;; Last updated: <2014/01/06 19:49:18 algernon@madhouse-project.org>

(if (and (boundp 'debian-emacs-flavor)
         (eq debian-emacs-flavor 'emacs-snapshot)
         (not (is-presentingp)))
    (progn
      (server-start)))
