;;; hadhodrond.el -- hadhodrond (formerly moria) extras

;; Copyright (C) 2011, 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/04/03 01:02:04 algernon@madhouse-project.org>

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

(when (and window-system
           (>= emacs-major-version 24))
  (load-theme 'solarized-dark))

;; Replace the modeline with powerline
(when window-system
  (add-to-list 'load-path (concat user-emacs-directory
                                  "packages/emacs-powerline"))
  (require 'powerline)
  (set-face-attribute 'mode-line nil
                      :background "#586e75"
                      :foreground "black"
                      :box nil)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#93a1a1"
                      :box nil)

  (setq powerline-color1 "#073642")
  (setq powerline-color2 "#002b36"))
