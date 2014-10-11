;; Last updated: <2014/10/11 19:54:55 algernon@madhouse-project.org>

(if (and (boundp 'debian-emacs-flavor)
         (or (eq debian-emacs-flavor 'emacs-snapshot)
             (eq debian-emacs-flavor 'emacs24))
         (not (is-presentingp)))
    (progn
      (server-start)))
