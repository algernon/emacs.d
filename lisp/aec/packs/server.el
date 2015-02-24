;; Last updated: <2015/02/24 09:41:24 algernon@madhouse-project.org>

(if (and (boundp 'debian-emacs-flavor)
         (or (eq debian-emacs-flavor 'emacs-snapshot)
             (eq debian-emacs-flavor 'emacs24))
         (not (is-presentingp)))
    (progn
      (server-start)))

(provide 'aec/packs/server)
