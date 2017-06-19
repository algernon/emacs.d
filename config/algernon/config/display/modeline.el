;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/06/19 23:39:42 algernon@madhouse-project.org>
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

(defun algernon/config/display/modeline ()
  "Minimalistic spaceline-all-the-icons configuration."

  (use-package spaceline-all-the-icons
    :after spaceline
    :config (progn
              ;; Initialization
              (spaceline-all-the-icons--setup-neotree)
              (spaceline-all-the-icons-theme)

              ;; Configuration
              (setq spaceline-highlight-face-func 'spaceline-highlight-face-default
                    powerline-text-scale-factor 1.0
                    spaceline-all-the-icons-highlight-file-name t
                    spaceline-all-the-icons-file-name-highlight "#f3ea98"
                    spaceline-all-the-icons-hide-long-buffer-path t
                    spaceline-all-the-icons-icon-set-modified 'chain
                    spaceline-all-the-icons-icon-set-window-numbering 'circle
                    spaceline-all-the-icons-separator-type 'none
                    spaceline-all-the-icons-primary-separator "")

              ;; Toggles
              (spaceline-toggle-all-the-icons-buffer-size-off)
              (spaceline-toggle-all-the-icons-buffer-position-on)
              (spaceline-toggle-all-the-icons-vc-icon-off)
              (spaceline-toggle-all-the-icons-vc-status-on)
              (spaceline-toggle-all-the-icons-git-status-on)
              (spaceline-toggle-all-the-icons-flycheck-status-off)
              (spaceline-toggle-all-the-icons-time-on)
              (spaceline-toggle-all-the-icons-battery-status-off)
              (spaceline-toggle-all-the-icons-projectile-off)
              (spaceline-toggle-all-the-icons-neotree-index-on)
              (spaceline-toggle-all-the-icons-neotree-context-on)
              (spaceline-toggle-all-the-icons-hud-off))))

(provide 'algernon/config/display/modeline)
