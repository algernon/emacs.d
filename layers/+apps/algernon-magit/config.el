;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/07/24 09:48:44 algernon@madhouse-project.org>
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

(spacemacs|use-package-add-hook magit
    :post-config
    (progn
      (setq-default git-magit-status-fullscreen t)
      (set-face-attribute 'magit-hash nil
                          :foreground "#3390ff")
      (setq magit-commit-arguments '("--signoff")
            magit-display-buffer-function (lambda (buffer)
                                            (display-buffer
                                             buffer
                                             (cond ((and (derived-mode-p 'magit-mode)
                                                         (eq (with-current-buffer buffer major-mode)
                                                             'magit-status-mode))
                                                    nil)
                                                   ((memq (with-current-buffer buffer major-mode)
                                                          '(magit-process-mode
                                                            magit-revision-mode
                                                            magit-stash-mode))
                                                    nil)
                                                   ((memq (with-current-buffer buffer major-mode)
                                                          '(magit-diff-mode))
                                                    '(display-buffer-at-bottom))
                                                   (t
                                                    '(display-buffer-same-window)))))
            magit-push-always-verify nil
            magit-post-display-buffer-hook #'(lambda ()
                                               (when (derived-mode-p 'magit-status-mode)
                                                 (delete-other-windows))))))
