;;; eowyn.el -- fangorn (desktop) extras

;; Copyright (C) 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/10/25 10:49:43 algernon@madhouse-project.org>

;; Theme setup

(use-package material-theme
  :ensure t)

(load-theme 'material)

(sml/setup)
(sml/apply-theme 'respectful)
(setq mode-line-end-spaces (make-string 7 #x20)
      sml/mode-width 'right)

;; Experiment with the Monaco font...
(set-face-attribute 'default nil :family "Monaco")
(set-face-attribute 'default nil :height 120)

;; Frame setup
(add-hook 'after-make-frame-functions #'fullscreen)
(add-hook 'after-make-frame-functions #'select-frame-set-input-focus)

;; Mail setup
(setq gnus-select-method '(nnimap "algernon@madhouse-project.org"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnimap-user
                                   "algernon@madhouse-project.org")))

(setq gnus-secondary-select-methods
      '((nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))
        (nnimap "gergo@csillger.hu"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "gergo@csillger.hu"))
        (nnimap "csillger@csillger.hu"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "gergo@csillger.hu"))))

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        ((header "delivered-to" ".*@csillger.hu")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "csillger@csillger.hu")
         (address "gergo@csillger.hu"))
        ((header "delivered-to" "lists@madhouse-project.org")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" nil)
         (organization nil)
         (address "lists@madhouse-project.org"))))

(add-hook 'gnus-message-setup-hook #'mml-secure-message-sign-pgpmime)

;; Supercite setup
(autoload 'sc-cite-original "supercite")
(autoload 'sc-submit-bug-report "supercite")
(add-hook 'mail-citation-hook #'sc-cite-original)

(setq message-cite-function #'sc-cite-original
      news-reply-header-hook nil

      sc-auto-fill-region-p nil
      sc-fixup-whitespace-p t
      sc-citation-leader "    "
      sc-citation-delimiter ">"
      sc-citation-separator " "
      sc-preferred-attribution-list '("sc-lastchoice" "x-attribution"
                                      "firstname" "initials" "lastname"))

(provide 'users/algernon/hosts/fangorn)
