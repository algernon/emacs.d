;;; galadriel.el -- galadriel extras

;; Copyright (C) 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/04/02 02:43:42 algernon@madhouse-project.org>

(setq gnus-select-method '(nntp "localhost"
                                (nntp-address "localhost")
                                (nntp-port-number 8119)))

(setq gnus-secondary-select-methods
      '((nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.lists.madhouse-project.org")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))
        (nnimap "algernon@madhouse-project.org"
                (nnimap-address "imap.madhouse-project.org")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "algernon@madhouse-project.org"))
        ))

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        ))
