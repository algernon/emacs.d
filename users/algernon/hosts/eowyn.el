;;; eowyn.el -- eowyn (xps13) extras

;; Copyright (C) 2014
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2014/10/02 07:38:58 algernon@madhouse-project.org>

(require 'gnus)

(packages-maybe-install '(molokai-theme cyberpunk-theme))

(setq gnus-select-method '(nnimap "algernon@madhouse-project.org"
                                  (nnimap-address "imap.madhouse-project.org")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnimap-user
                                   "algernon@madhouse-project.org")))

(setq gnus-secondary-select-methods
      '((nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.lists.madhouse-project.org")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))
        (nnimap "a@5ms.in"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "a@5ms.in"))
        (nntp "news.gmane.org")))

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
      (load-theme 'cyberpunk)
    (load-theme 'molokai))
  (sml/setup))
