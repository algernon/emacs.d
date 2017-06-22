;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/06/18 11:58:53 algernon@madhouse-project.org>
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

(defun algernon/config/apps/elfeed ()
  (let ((feed-file (concat user-emacs-directory "private/etc/feeds.el")))
    (if (file-exists-p feed-file)
        (load feed-file)))

  (defface algernon/elfeed-tag-nsfw-face
    '((t :foreground "#bc8f8f"))
    "Face used for NSFW tagged posts."
    :group 'elfeed)

  (defface algernon/elfeed-tag-planet-face
    '((t :inherit font-lock-constant-face))
    "Face used for PLANET tagged posts."
    :group 'elfeed)

  (defface algernon/elfeed-tag-9gag-face
    '((t :inherit font-lock-constant-face))
    "Face used for 9GAG tagged posts."
    :group 'elfeed)

  (defface algernon/elfeed-tag-fun-face
    '((t :inherit font-lock-function-name-face))
    "Face used for FUN tagged posts."
    :group 'elfeed)

  (setq elfeed-search-face-alist
        '((unread elfeed-search-unread-title-face)
          (nsfw algernon/elfeed-tag-nsfw-face)
          (9gag algernon/elfeed-tag-9gag-face)
          (fun algernon/elfeed-tag-fun-face)
          (planet algernon/elfeed-tag-planet-face)))

  (spacemacs|use-package-add-hook elfeed
    :post-config (progn
                   (defconst feed-reader/update-timer
                     (run-with-timer 1 (* 60 60)
                                     (lambda ()
                                       (elfeed-unjam)
                                       (elfeed-update))))

                   (setq elfeed-max-connections 2
                         elfeed-search-filter "+unread -9gag -comic"
                         elfeed-goodies/wide-threshold 0.25
                         elfeed-goodies/entry-pane-position 'top
                         elfeed-goodies/entry-pane-size 0.85
                         elfeed-goodies/show-mode-padding 50
                         elfeed-goodies/html-decode-title-tags '(:all))

                   (evilified-state-evilify-map elfeed-show-mode-map
                     :mode elfeed-show-mode
                     :eval-after-load elfeed-show
                     :bindings
                     "q" 'quit-window
                     "n" 'elfeed-show-next
                     "p" 'elfeed-show-prev)
                   )

    )


  (setf url-queue-timeout 30))

(provide 'algernon/config/apps/elfeed)