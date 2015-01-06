;;; eowyn.el -- eowyn (xps13) extras

;; Copyright (C) 2014, 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/01/06 13:33:33 algernon@madhouse-project.org>

(use-package molokai-theme)
(use-package cyberpunk-theme)

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

;; Supercite setup
(autoload 'sc-cite-original "supercite")
(autoload 'sc-submit-bug-report "supercite")
(add-hook 'mail-citation-hook 'sc-cite-original)

(setq message-cite-function 'sc-cite-original)

(setq news-reply-header-hook nil)
(setq sc-auto-fill-region-p nil)
(setq sc-fixup-whitespace-p t)
(setq sc-citation-leader "    ")
(setq sc-citation-delimiter ">")
(setq sc-citation-separator " ")
(setq sc-preferred-attribution-list
      '("sc-lastchoice" "x-attribution" "firstname" "initials" "lastname"))

;; Frame setup
(add-hook 'after-make-frame-functions 'fullscreen)
(add-hook 'after-make-frame-functions (lambda (f)
                                        (select-frame-set-input-focus f)))

(if (is-presentingp)
    (load-theme 'cyberpunk)
  (load-theme 'molokai))
(sml/setup)
