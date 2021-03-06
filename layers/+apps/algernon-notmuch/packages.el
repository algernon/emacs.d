;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2018/09/25 00:00:20 algernon@madhouse-project.org>
;;
;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015, 2016, 2017, 2018
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
    gnus-alias
    notmuch
    helm-notmuch
    ))

(defun algernon-notmuch/init-gnus-alias ()
  (use-package gnus-alias
    :config (progn
              (autoload 'gnus-alias-determine-identity "gnus-alias" "" t)

              (add-hook 'message-setup-hook 'gnus-alias-determine-identity))))

(defun algernon-notmuch/init-helm-notmuch ()
  (use-package helm-notmuch
    :init (spacemacs/set-leader-keys
            "ans" 'helm-notmuch)))

(defun algernon-notmuch/init-notmuch ()
  (use-package notmuch
    :config (progn
              (push "\\*notmuch.+\\*" spacemacs-useful-buffers-regexp)
              (setq notmuch-search-oldest-first nil
                    notmuch-message-headers-visible nil
                    notmuch-saved-searches '((:name "inbox" :query "tag:inbox" :key "i" :search-type tree)
                                             (:name "unread" :query "tag:unread and not tag:bestpractical" :key "u" :search-type tree)
                                             (:name "flagged" :query "tag:flagged" :key "f" :search-type tree)
                                             (:name "bestpractical" :query "tag:bestpractical" :key "B" :search-type tree)
                                             (:name "bestpractical (unread)" :query "tag:bestpractical and tag:unread" :key "b" :search-type tree))
                    notmuch-tree-show-out t
                    notmuch-mua-user-agent-function 'notmuch-mua-user-agent-full

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

              (defadvice notmuch-mua-reply (around notmuch-fix-sender)
                (let ((sender (concat "Gergely Nagy <" user-mail-address ">")))
                  ad-do-it))
              (ad-activate 'notmuch-mua-reply)

              (evilified-state-evilify-map notmuch-hello-mode-map :mode notmuch-hello-mode)

              (evilified-state-evilify-map notmuch-show-stash-map :mode notmuch-show-mode)
              (evilified-state-evilify-map notmuch-show-part-map :mode notmuch-show-mode)
              (evilified-state-evilify-map notmuch-show-mode-map :mode notmuch-show-mode
                :bindings
                (kbd "b") 'browse-url-at-point
                (kbd "N") 'notmuch-show-next-message
                (kbd "n") 'notmuch-show-next-open-message)
              (evilified-state-evilify-map notmuch-tree-mode-map :mode notmuch-tree-mode
                :bindings
                (kbd "n") 'notmuch-tree-next-matching-message
                (kbd "p") 'notmuch-tree-prev-matching-message
                (kbd "N") 'notmuch-tree-next-message
                (kbd "P") 'notmuch-tree-prev-message
                (kbd "d") 'notmuch/tree-mark-read
                (kbd "u") 'notmuch/tree-mark-unread)
              (evilified-state-evilify-map notmuch-search-mode-map :mode notmuch-search-mode
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
                "nv" 'notmuch-show-view-raw-message
                "nu" 'browse-url))
    :init (progn
            (spacemacs/set-leader-keys
              "ann" 'notmuch
              "anj" 'notmuch-jump-search
              "anm" 'notmuch-mua-new-mail
              "anS" 'notmuch/exec-offlineimap
              "ant" 'notmuch/tree-or-to-tree))))
