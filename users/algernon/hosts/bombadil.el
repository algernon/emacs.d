;;; bombadil.el -- bombadil extras

;; Copyright (C) 2011, 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/04/02 00:02:12 algernon@madhouse-project.org>

(require 'gnus)

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
;        (nntp "madhouse-project.org"
;             (nntp-port-number 8119))
))

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        ))

;; (setq gnus-select-method '(nnimap "lists@madhouse-project.org"
;;                                   (nnimap-stream shell)
;;                                   (imap-shell-program "/usr/lib/dovecot/imap")))

;(setq gnus-select-method '(nntp "madhouse-project.org"
;                                (nntp-port-number 8119)))
