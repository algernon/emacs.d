;;; bombadil.el -- bombadil extras

;; Copyright (C) 2011, 2012, 2013, 2014
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2014/10/23 07:57:25 algernon@madhouse-project.org>

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
        ;;(nntp "news.gmane.org")
        ;;(nntp "madhouse-project.org"
        ;;     (nntp-port-number 8119))
        ))

(add-hook 'gnus-message-setup-hook 'mml-secure-message-sign-pgpmime)

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        ))


(if (is-presentingp)
    (load-theme 'cyberpunk)
  (load-theme 'molokai))
(sml/setup)
