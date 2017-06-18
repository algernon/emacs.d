;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/06/18 12:10:25 algernon@madhouse-project.org>
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

(defun work/notes ()
  "Open the notes project"
  (interactive)
  (find-file "~/Documents/UStream/notes"))

(defun work/wip ()
  "Open the WIP"
  (interactive)
  (find-file "~/Documents/UStream/notes/wip.org"))

(defun work/sources ()
  "Open work-related sources"
  (interactive)
  (eshell-z "~/src/ustream"))

(defun algernon/config/work ()
  (spacemacs/declare-prefix "$" "work")
  (spacemacs/set-leader-keys
    "$n" #'work/notes
    "$w" #'work/wip
    "$s" #'work/sources))

(provide 'algernon/config/work)
