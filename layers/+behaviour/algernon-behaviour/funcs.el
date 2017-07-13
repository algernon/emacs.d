;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/07/13 14:43:28 algernon@madhouse-project.org>
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

(defun algernon/behaviour/timestamp-on-save ()
  (setq time-stamp-active t
        time-stamp-start "[lL]ast [uU]pdated:[    ]+\\\\?[\"<]+"
        time-stamp-line-limit 20
        time-stamp-format (concat "%:y/%02m/%02d %02H:%02M:%02S "
                                  user-mail-address))
  (add-hook 'write-file-hooks #'time-stamp))

(defun focus/toggle-highlight ()
  "Toggle focus-mode at-thing between list and defun"
  (interactive)

  (when (alist-get major-mode focus-mode-to-thing)
    (if (eq (alist-get major-mode focus-mode-to-thing) 'list)
       (setf (alist-get major-mode focus-mode-to-thing) 'defun)
     (when (eq (alist-get major-mode focus-mode-to-thing) 'defun)
       (setf (alist-get major-mode focus-mode-to-thing) 'list)))))
