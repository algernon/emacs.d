;;; hadhodrond.el -- hadhodrond (formerly moria) extras

;; Copyright (C) 2011, 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/04/02 10:18:00 algernon@madhouse-project.org>

(setq gnus-select-method '(nnimap "mail.balabit"
                                  (nnimap-stream network)
                                  (nnimap-server-port 143)))

(setq gnus-secondary-select-methods
      '((nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))
        (nntp "nntpgit@balabit"
              (nntp-address "localhost")
              (nntp-port-number 8119))
        ))

(setq gnus-posting-styles
      '((".*"
         (address "algernon@balabit.hu")
         (organization "BalaBit IT Security Ltd")
         (eval (setq message-sendmail-extra-arguments '("-a" "balabit")))
         ("Bcc" "algernon@balabit.hu"))
        ))
