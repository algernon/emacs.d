;;; eowyn.el -- eowyn (xps13) extras

;; Copyright (C) 2014, 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/07/08 11:51:16 algernon@madhouse-project.org>

(use-package material-theme
  :ensure t)
(use-package cyberpunk-theme
  :ensure t
  :defer t)

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
        (nnimap "gergo@csillger.hu"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "gergo@csillger.hu"))
        (nntp "news.gmane.org")))

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org")
         (add-hook 'gnus-message-setup-hook #'mml-secure-message-sign-pgpmime))
        ((header "delivered-to" ".*@csillger.hu")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "csillger@csillger.hu")
         (address "gergo@csillger.hu")
         (remove-hook 'gnus-message-setup-hook #'mml-secure-message-sign-pgpmime))
        ((header "delivered-to" "lists@madhouse-project.org")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" nil)
         (organization nil)
         (address "lists@madhouse-project.org")
         (remove-hook 'gnus-message-setup-hook #'mml-secure-message-sign-pgpmime))
        ((header "delivered-to" "a@5ms.in")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "a@5ms.in")
         (address "a@5ms.in")
         (remove-hook 'gnus-message-setup-hook #'mml-secure-message-sign-pgpmime))))

;; Supercite setup
(autoload 'sc-cite-original "supercite")
(autoload 'sc-submit-bug-report "supercite")
(add-hook 'mail-citation-hook #'sc-cite-original)

(setq message-cite-function #'sc-cite-original)

(setq news-reply-header-hook nil)
(setq sc-auto-fill-region-p nil)
(setq sc-fixup-whitespace-p t)
(setq sc-citation-leader "    ")
(setq sc-citation-delimiter ">")
(setq sc-citation-separator " ")
(setq sc-preferred-attribution-list
      '("sc-lastchoice" "x-attribution" "firstname" "initials" "lastname"))

;; Frame setup
(add-hook 'after-make-frame-functions #'fullscreen)
(add-hook 'after-make-frame-functions #'select-frame-set-input-focus)

(if (is-presentingp)
    (load-theme 'cyberpunk)
  (load-theme 'material))
(sml/setup)
(use-package smart-mode-line-powerline-theme
  :ensure t
  :init (progn
          (sml/apply-theme 'powerline)
          (setq mode-line-end-spaces (make-string 7 #x20)
                sml/mode-width 'right)))

;; Experiment with the Monaco font...
(set-face-attribute 'default nil :family "Monaco")

(provide 'users/algernon/hosts/eowyn)
