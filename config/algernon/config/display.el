;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/07/02 12:43:52 algernon@madhouse-project.org>
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

(require 'algernon/config/display/fonts)
(require 'algernon/config/display/modeline)
(require 'algernon/config/display/theme-updates)

(defun algernon/config/display ()
  (setq popwin:close-popup-window-timer-interval 0.1
        scroll-margin 3
        writeroom-width 0.75)

  (global-vi-tilde-fringe-mode 0)
  (spacemacs/toggle-nyan-cat-progress-bar-off)

  (algernon/config/display/fonts)
  (algernon/config/display/modeline)
  (algernon/config/display/theme-updates))

(provide 'algernon/config/display)
