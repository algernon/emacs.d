;;; ~/.emacs.d/ -- algernon's Emacs configuration

;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015
;; Gergely Nagy <algernon@bonehunter.rulez.org>

;; Author: Gergely Nagy <algernon@bonehunter.rulez.org>
;; Maintainer: Gergely Nagy <algernon@bonehunter.rulez.org>
;; Created: 2000-08-03
;; Keywords: local
;; Last updated: <2015/01/06 12:10:50 algernon@madhouse-project.org>

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

;;; Commentary:

;; This is my .emacs file. There are many like it but this one is
;; mine. My .emacs file is my best friend. It is my life. I must
;; master it as I must master my life. Without me, my .emacs file is
;; useless. Without my .emacs file I am useless. I must code my .emacs
;; file true. I must code faster than my enemy, who is trying to
;; kill(1) me. I must kill(1) him before he kill(1)s me. I will.
;; Before God I swear this creed: my .emacs file and myself are
;; defenders of my country, we are the masters of my enemy, we are the
;; saviours of my life. So be it, until there is no enemy, but peace.
;;
;; Amen.
;; (by Edward O'Connor <ted@oconnor.cx>)

;;; History:

;; Ancient history is in CVS, somewhere - but that's not
;; interesting. This whole thing has been rewritten around the time I
;; imported it into git. Then it was developed as part of my private
;; $HOME repository, and then extracted out into its own repo.
;;
;; From that point onward, see the git log.

;;; Code:

(when (<= emacs-major-version 23)
  (add-to-list 'load-path "~/.emacs.d/compat"))

(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun packages-maybe-install (packages)
  "Install a list of packages, unless they're already installed."

  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun add-to-list* (the-list &rest elements)
  "Add a set of ELEMENTS to THE-LIST, prepend by default, append
   if APPEND is non-nil."

  (mapcar (lambda (x) (add-to-list the-list x)) elements))

(defun is-presentingp ()
  (interactive)
  (not (= (length (getenv "PRESENTING")) 0)))

;; Customisation goes to ~/.emacs.d/custom.el
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load custom-file))

;; Dispatch to local snippets.
;;
;; Loads ~/.emacs.d/users/$USER/settings.el, ~/.emacs.d/core/*,
;; ~/.emacs.d/hosts/$HOSTNAME.el, then ~/.emacs.d/users/$USER.el, and
;; then ~/.emacs.d/users/$USER/*
(setq aec-system-config (concat user-emacs-directory "hosts/"
                                system-name ".el")
      aec-user-config (concat user-emacs-directory "users/"
                              user-login-name ".el")
      aec-user-dir (concat user-emacs-directory "users/"
                           user-login-name)
      aec-core-dir (concat user-emacs-directory "core"))
(add-to-list 'load-path aec-core-dir)
(add-to-list 'load-path aec-user-dir)

(when (file-exists-p (concat aec-user-dir "/settings.el"))
  (load (concat aec-user-dir "/settings.el")))
(when (file-exists-p aec-core-dir)
  (mapc 'load (directory-files aec-core-dir nil "^[^#].*el$")))
(when (file-exists-p aec-system-config) (load aec-system-config))
(when (file-exists-p aec-user-config) (load aec-user-config))
(when (file-exists-p aec-user-dir)
  (mapc 'load (directory-files aec-user-dir nil "^[^#].*el$")))
