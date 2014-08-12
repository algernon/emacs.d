;;; angthalion.el -- angthalion extras

;; Copyright (C) 2014
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2014/08/12 14:21:51 algernon@madhouse-project.org>

(packages-maybe-install '(molokai-theme cyberpunk-theme badger-theme
                                        underwater-theme))

(setq gnus-select-method '(nnimap "gergely.nagy@balabit.com"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnimap-user
                                   "gergely.nagy@balabit.com")))

;(setq gnus-select-method '(nntp "news.gmane.org"))

(setq gnus-secondary-select-methods
      '((nnimap "algernon@madhouse-project.org"
                (nnimap-address "imap.madhouse-project.org")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user
                 "algernon@madhouse-project.org"))
        (nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.lists.madhouse-project.org")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))))

(setq gnus-posting-styles
      '(("@madhouse-project"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        (".*"
         (organization "BalaBit IT Security Ltd.")
         (eval (setq message-sendmail-extra-arguments '("-a"
                                                        "balabit")))
         ("Bcc" "algernon@balabit.hu")
         (address "algernon@balabit.hu"))))

(when (and window-system
           (>= emacs-major-version 24))
  (if (is-presentingp)
      (load-theme 'cyberpunk)
    (load-theme 'underwater))
  (diminish-undo 'diminished-modes)
  (sml/setup))
