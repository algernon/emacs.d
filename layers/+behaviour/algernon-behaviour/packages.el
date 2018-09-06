;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2018/09/06 09:38:33 algernon@madhouse-project.org>
;;
;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015, 2016, 2017, 2018
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

(defconst algernon-behaviour-packages
  '(
    dired-narrow
    electric-operator
    evil
    focus
    swiper-helm
    ))

(defun algernon-behaviour/init-dired-narrow ()
  (use-package dired-narrow
    :bind (:map dired-mode-map
                ("/" . dired-narrow))))

(defun algernon-behaviour/init-electric-operator ()
  (use-package electric-operator
    :config (progn
              (add-hook 'c-mode-hook #'electric-operator-mode)
              (add-hook 'c++-mode-hook #'electric-operator-mode))))

(defun algernon-behaviour/init-focus ()
  (use-package focus
    :config (progn
              (add-hook 'hy-mode-hook #'focus-mode)
              (add-hook 'clojure-mode-hook #'focus-mode)
              (add-hook 'emacs-lisp-mode-hook #'focus-mode)

              (setq focus-mode-to-thing
                    '((lisp-interaction-mode . defun)
                      (emacs-lisp-mode . defun)
                      (hy-mode . defun)
                      (clojure-mode . defun)
                      (clojurescript-mode . defun)

                      (prog-mode . defun)
                      (text-mode . sentence)))

              (evil-leader/set-key "to" #'focus-mode)
              (evil-leader/set-key "tO" #'focus/toggle-highlight))))

(defun algernon-behaviour/init-swiper-helm ()
  (use-package swiper-helm))

(defun algernon-behaviour/post-init-evil ()
  (defun algernon/forward-sentence-or-sexp (&optional count)
    (interactive)
    (if (member major-mode '(hy-mode clojure-mode emacs-lisp-mode))
        (sp-forward-sexp count)
      (evil-forward-sentence-begin count)))

  (defun algernon/backward-sentence-or-sexp (&optional count)
    (interactive)
    (if (member major-mode '(hy-mode clojure-mode emacs-lisp-mode))
        (sp-backward-sexp count)
      (evil-backward-sentence-begin count)))

  (defun algernon/global-ex-search-and-replace ()
    (interactive)
    (let ((evil-ex-substitute-global t))
      (evil-ex "%s/")))

  (define-key evil-normal-state-map (kbd "M-/") #'swiper-helm)
  (define-key evil-normal-state-map ")" #'algernon/forward-sentence-or-sexp)
  (define-key evil-normal-state-map "(" #'algernon/backward-sentence-or-sexp)
  (define-key evil-normal-state-map "S" #'algernon/global-ex-search-and-replace)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (evil-leader/set-key "q#" #'server-edit)
  (setq evil-move-cursor-back nil
        evil-escape-key-sequence "sd"))
