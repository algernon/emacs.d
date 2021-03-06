;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/08/20 08:56:32 algernon@madhouse-project.org>
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

(defun notmuch/exec-offlineimap ()
  "execute offlineimap"
  (interactive)
  (message "Syncing mail...")
  (set-process-sentinel
   (start-process-shell-command "offlineimap"
                                "*offlineimap*"
                                "offlineimap -o")
   '(lambda (process event)
      (notmuch-refresh-all-buffers)
      (message "Mail synced."))))

(defun notmuch/tree-or-to-tree ()
  (interactive)
  (if (equal major-mode 'notmuch-search-mode)
      (notmuch-tree-from-search-current-query)
    (notmuch-tree)))

(defun notmuch/tree-mark-read ()
  (interactive)
  (notmuch-tree-tag '("-unread"))
  (notmuch-tree-next-matching-message))

(defun notmuch/tree-mark-unread ()
  (interactive)
  (notmuch-tree-tag '("+unread"))
  (notmuch-tree-next-matching-message))
