;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/08/12 12:08:25 algernon@madhouse-project.org>
;;
;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015, 2016, 2017
;; Gergely Nagy <algernon@bonehunter.rulez.org>

;; Author: Gergely Nagy <algernon@bonehunter.rulez.org>
;; Maintainer: Gergely Nagy <algernon@madhouse-project.org>
;; Created: 2000-08-03
;; Keywords: local

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defconst algernon-notmuch-packages
  '(
    notmuch
    helm-notmuch
    ))

(defun algernon-notmuch/init-helm-notmuch ()
  (use-package helm-notmuch
    :init (spacemacs/set-leader-keys
            "ans" 'helm-notmuch))
  )

(defun algernon-notmuch/init-notmuch ()
  (use-package notmuch
    :config (progn
              (push "\\*notmuch.+\\*" spacemacs-useful-buffers-regexp)
              (setq notmuch-search-oldest-first nil
                    notmuch-message-headers-visible nil

                    user-mail-address "gergo@csillger.hu"
                    user-full-name "Gergely Nagy"

                    mail-user-agent 'message-user-agent
                    message-sendmail-f-is-evil 't
                    message-sendmail-extra-arguments '("--read-envelope-from")
                    message-send-mail-function 'message-send-mail-with-sendmail
                    sendmail-program "/usr/bin/msmtp"

                    message-default-mail-headers "Cc: \nBcc: \n"
                    message-auto-save-directory "~/mail/sync/draft"
                    message-kill-buffer-on-exit t
                    message-directory "~/mail/sync")

              (evilified-state-evilify-map 'notmuch-hello-mode-map :mode notmuch-hello-mode)

              (evilified-state-evilify-map 'notmuch-show-stash-map :mode notmuch-show-mode)
              (evilified-state-evilify-map 'notmuch-show-part-map :mode notmuch-show-mode)
              (evilified-state-evilify-map 'notmuch-show-mode-map :mode notmuch-show-mode
                :bindings
                (kbd "N") 'notmuch-show-next-message
                (kbd "n") 'notmuch-show-next-open-message)
              (evilified-state-evilify-map 'notmuch-tree-mode-map :mode notmuch-tree-mode)
              (evilified-state-evilify-map 'notmuch-search-mode-map :mode notmuch-search-mode
                :bindings
                (kbd "f") 'notmuch-search-filter)

              (evil-define-key 'visual notmuch-search-mode-map
                "*" 'notmuch-search-tag-all
                "a" 'notmuch-search-archive-thread
                "-" 'notmuch-search-remove-tag
                "+" 'notmuch-search-add-tag)

              (spacemacs/set-leader-keys-for-major-mode 'notmuch-show-mode
                "n|" 'notmuch-show-pipe-message
                "nw" 'notmuch-show-save-attachments
                "nv" 'notmuch-show-view-raw-message)

              )
    :init (progn
            (spacemacs/set-leader-keys
              "ann" 'notmuch
              "anj" 'notmuch-jump-search
              "anm" 'notmuch-mua-new-mail
              "ans" 'notmuch/exec-offlineimap))))
