;;; bombadil.el -- bombadil extras

;; Copyright (C) 2011, 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/11/01 15:06:38 algernon@madhouse-project.org>

(require 'gnus)

(packages-maybe-install '(molokai-theme))

(setq gnus-select-method '(nnimap "algernon@madhouse-project.org"
                                  (nnimap-address "imap.madhouse-project.org")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnimap-user
                                   "algernon@madhouse-project.org")))

(setq gnus-secondary-select-methods
      '((nntp "news.gmane.org")
        (nntp "madhouse-project.org"
              (nntp-port-number 8119))))

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        ))

(when (and window-system
           (>= emacs-major-version 24))
  (if (is-presentingp)
      (load-theme 'wombat)
    (load-theme 'molokai))
  (sml/setup))
