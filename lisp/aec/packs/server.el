;; Last updated: <2015/08/31 13:53:59 algernon@madhouse-project.org>

(if (and (boundp 'debian-emacs-flavor)
         (or (eq debian-emacs-flavor 'emacs-snapshot)
             (eq debian-emacs-flavor 'emacs24))
         (not (is-presentingp))
         (not (server-running-p)))
    (progn
      (server-start)))

(provide 'aec/packs/server)
