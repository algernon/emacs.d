;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/07/04 15:44:15 algernon@madhouse-project.org>
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

;;; Aliases & commands

(defun eshell/up (dir)
  (eshell-up dir))

(defun eshell/pk (dir)
  (eshell-up-peek dir))

(defun eshell/l (&rest args)
  (eshell/ls "-l" args))

(defun eshell/la (&rest args)
  (eshell/ls "-la" args))

(defun eshell/e (file)
  (find-file file))

(defun eshell/d (&rest args)
  (if (null args)
      (neotree)
    (neotree-dir (pop args))))

;;; Theme

(defun epe-theme-algernon ()
  "A eshell-prompt dakrone theme, slightly customised."
  (setq eshell-prompt-regexp "^[^#\n❯]* ❯[#]* ")
  (let* ((pwd-repl-home (lambda (pwd)
                          (let* ((home (expand-file-name (getenv "HOME")))
                                 (home-len (length home)))
                            (if (and
                                 (>= (length pwd) home-len)
                                 (equal home (substring pwd 0 home-len)))
                                (concat "~" (substring pwd home-len))
                              pwd))))
         (shrink-paths (lambda (p-lst)
                         (if (> (length p-lst) 3) ;; shrink paths deeper than 3 dirs
                             (concat
                              (mapconcat (lambda (elm)
                                           (if (zerop (length elm)) ""
                                             (substring elm 0 1)))
                                         (butlast p-lst 3)
                                         "/")
                              "/"
                              (mapconcat (lambda (elm) elm)
                                         (last p-lst 3)
                                         "/"))
                           (mapconcat (lambda (elm) elm)
                                      p-lst
                                      "/")))))
    (concat "\n"
     (when (epe-remote-p)
       (epe-colorize-with-face
        (concat (epe-remote-user) "@" (epe-remote-host) " ")
        'epe-remote-face))
     (when epe-show-python-info
       (when (fboundp 'epe-venv-p)
         (when (and (epe-venv-p) venv-current-name)
           (epe-colorize-with-face (concat "(" venv-current-name ") ") 'epe-venv-face))))
     (epe-colorize-with-face (funcall
                              shrink-paths
                              (split-string
                               (funcall pwd-repl-home (eshell/pwd)) "/"))
                             'epe-dir-face)
     (when (epe-git-p)
       (concat
        " "
        (epe-colorize-with-face
         (concat (epe-git-branch)
                 (epe-git-dirty))
         'epe-remote-face)
        (when (or (epe-git-behind-p)
                  (not (= (epe-git-unpushed-number) 0)))
          " ")
        (when (epe-git-behind-p)
          (epe-colorize-with-face "⇣" 'epe-git-face))
        (unless (= (epe-git-unpushed-number) 0)
          (epe-colorize-with-face "⇡" 'epe-git-face))))
     (epe-colorize-with-face "\n❯" 'epe-symbol-face)
     " ")))
