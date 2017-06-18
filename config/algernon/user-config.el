;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/06/18 12:12:47 algernon@madhouse-project.org>
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

(require 'algernon/config/apps)
(require 'algernon/config/behaviour)
(require 'algernon/config/display)
(require 'algernon/config/lang)
(require 'algernon/config/work)

(defun algernon/config ()
  (algernon/config/apps)
  (algernon/config/behaviour)
  (algernon/config/display)
  (algernon/config/lang)
  (algernon/config/work)

  (evil-leader/set-key "q#" #'server-edit)
  (define-key evil-normal-state-map (kbd "M-/") #'swiper-helm)

  (setq paradox-github-token t))

(provide 'algernon/user-config)
