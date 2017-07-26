;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/07/26 11:58:57 algernon@madhouse-project.org>
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

(defconst algernon-eshell-packages
  '(
    eshell
    eshell-prompt-extras
    eshell-up
    ))

(defun algernon-eshell/init-eshell-up ()
  (use-package eshell-up))

(defun algernon-eshell/post-init-eshell-prompt-extras ()
  (use-package eshell-prompt-extras
    :config (setq eshell-prompt-function #'epe-theme-algernon
                  eshell-banner-message "")))

(defun algernon-eshell/post-init-eshell ()
  (use-package eshell
    :config (progn
              ;; Hooks
              (add-hook 'eshell-mode-hook (lambda ()
                                            (define-key evil-insert-state-map (kbd "C-d")
                                              #'eshell-life-is-too-much)))

              ;; Aliases & commands

              (defun eshell/x ()
                (eshell/exit))

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

              (defun eshell/mcd (dir)
                (eshell/mkdir dir)
                (eshell/cd dir))

              (defun eshell/d (&rest args)
                (if (null args)
                    (neotree)
                  (neotree-dir (pop args))))

              (defun algernon/git-grep (&rest args)
                (interactive)

                (let* ((command (format "git grep -n %s" (s-join " " args)))
                       (buffer (generate-new-buffer "*git-grep*"))
                       (buffer-name (format "#<buffer %s>" buffer)))
                  (with-current-buffer buffer
                    (insert (format "-*- mode: grep; default-directory: \"%s\" -*-\n\n%s\n"
                                    (eshell/pwd) command)))
                  (eshell-printn buffer-name)
                  (eshell-do-eval
                   (eshell-parse-command (format "*%s >>%s" command buffer-name))
                   t)
                  (with-current-buffer buffer
                    (funcall 'grep-mode)
                    (goto-char (point-min))
                    (switch-to-buffer buffer))))

              (defun algernon/git-log (&rest args)
                (let ((branch-or-file (car args)))
                  (message branch-or-file)
                  (if branch-or-file
                      (if (f-file-p branch-or-file)
                          (magit-log (list "HEAD") '()
                                     (mapcar (lambda (f) (concat (eshell/pwd) "/" f))
                                             args))
                        (magit-log (list branch-or-file) '()
                                   (mapcar (lambda (f) (concat (eshell/pwd) "/" f))
                                           (cdr args))))
                    (magit-log-head)))
                (eshell/echo))

              (defun eshell/git (command &rest args)
                (pcase command
                  ("log" (apply #'algernon/git-log args))
                  ("status" (progn
                              (magit-status)
                              (eshell/echo)))
                  ("grep" (apply #'algernon/git-grep args))
                  (_ (let ((command (s-join " " (append (list "git" command) args))))
                       (message command)
                       (shell-command-to-string command)))))

              (defun eshell/magit (&rest args)
                (apply #'eshell/git args)))))
