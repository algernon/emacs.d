;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-

;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015
;; Gergely Nagy <algernon@bonehunter.rulez.org>

;; Author: Gergely Nagy <algernon@bonehunter.rulez.org>
;; Maintainer: Gergely Nagy <algernon@madhouse-project.org>
;; Created: 2000-08-03
;; Keywords: local
;; Last updated: <2015/01/08 13:18:39 algernon@madhouse-project.org>

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

(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

(defun is-presentingp ()
  (interactive)
  (not (= (length (getenv "PRESENTING")) 0)))

(use-package auto-compile
  :init (progn
          (setq load-prefer-newer t)
          (require 'auto-compile)
          (auto-compile-on-load-mode 1)
          (auto-compile-on-save-mode 1)))

;; Customisation goes to ~/.emacs.d/custom.el
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file)
    (load (file-name-sans-extension custom-file)))

;; Dispatch to local snippets.
;;
;; Loads ~/.emacs.d/lisp/users/$USER/settings.el, then
;; ~/.emacs.d/lisp/aec/*, and finally ~/.emacs.d/lisp/users/$USER/*.
(defun aec-require (path &optional noerror)
  (when (file-exists-p (concat user-emacs-directory "/lisp/" path))
    (mapc
     (lambda (name)
       (require (intern (concat path "/"
                                (file-name-sans-extension name)))
                nil noerror))
     (directory-files (concat user-emacs-directory
                              "lisp/" path)
                      nil "^[^#].*el$"))))

(add-to-list 'load-path (concat user-emacs-directory "/lisp"))

(require (intern (concat "users/" user-login-name "/settings"))
         nil t)

(require 'aec/misc)
(require 'aec/keybindings)
(require 'aec/ui)
(require 'aec/packs)

(aec-require (concat "users/" user-login-name) t)
