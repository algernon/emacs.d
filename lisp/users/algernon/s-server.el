;; Last updated: <2015/01/08 12:42:15 algernon@madhouse-project.org>

(if (and (boundp 'debian-emacs-flavor)
         (or (eq debian-emacs-flavor 'emacs-snapshot)
             (eq debian-emacs-flavor 'emacs24))
         (not (is-presentingp)))
    (progn
      (server-start)))

(provide 'users/algernon/s-server)
