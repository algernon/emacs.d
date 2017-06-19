;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/06/19 23:41:15 algernon@madhouse-project.org>
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

(defun algernon/config/display/theme-updates ()
  "Face configuration for themes."

  (setq my-black "#1b1b1e")

  (defun update-solarize-dark ()
    (custom-theme-set-faces
     'solarized-dark

     ;; Makes matching parens obvious
     `(sp-show-pair-match-face ((t (:inherit sp-show-pair-match-face
                                             :background "#586e75"))))

     ;; active modeline has no colors
     ;;`(mode-line ((t (:inherit mode-line :background "#002b36"))))
     ;;`(mode-line-inactive ((t (:inherit mode-line :background "#002b36"))))
     ;;`(spaceline-highlight-face ((t (:inherit mode-line :background "#002b36"))))
     ;;`(powerline-active1 ((t (:inherit mode-line :background "#002b36"))))
     ;;`(powerline-active2 ((t (:inherit mode-line :background "#002b36"))))


     ;; Inactive modeline has tint
     ;;`(powerline-inactive2 ((t (:inherit powerline-inactive1))))

     ;; Org and outline header updates
     `(org-level-1 ((t (:height 1.25 :foreground ,my-black
                                :background "#268bd2"
                                :weight bold))))
     `(org-level-2 ((t (:height 1.15 :foreground ,my-black
                                :background "#2aa198"
                                :weight bold))))
     `(org-level-3 ((t (:height 1.05 :foreground ,my-black
                                :background "#b58900"
                                :weight bold))))

     '(outline-1 ((t (:inherit org-level-1))))
     '(outline-2 ((t (:inherit org-level-2))))
     '(outline-3 ((t (:inherit org-level-3))))
     '(outline-4 ((t (:inherit org-level-4))))))

  (when (string= 'solarized-dark (car custom-enabled-themes))
      (update-solarize-dark)))

(provide 'algernon/config/display/theme-updates)
