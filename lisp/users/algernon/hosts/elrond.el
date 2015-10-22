;;; elrond.el -- Cloudera Laptop

;; Copyright (C) 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/10/22 09:48:38 algernon@madhouse-project.org>

(use-package material-theme
  :ensure t)

(load-theme 'material)

(use-package spaceline
  :ensure t
  :init (progn
          (require 'spaceline-config)
          (spaceline-spacemacs-theme)))

;; Frame setup
(add-hook 'after-make-frame-functions #'fullscreen)
(add-hook 'after-make-frame-functions #'select-frame-set-input-focus)

;; Mail setup
(setq gnus-select-method '(nnimap "algernon@cloudera.com"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnimap-user
                                   "algernon@cloudera.com")))

(setq gnus-posting-styles
      '((".*"
         (organization "Cloudera")
         (eval (setq message-sendmail-extra-arguments '("-a" "cloudera")))
         ("Bcc" "algernon@cloudera.com")
         (address "algernon@cloudera.com"))))

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

(provide 'users/algernon/hosts/elrond)
