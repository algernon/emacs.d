;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2016/10/23 08:27:38 algernon@madhouse-project.org>
;;
;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015, 2016
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

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     go
     javascript
     ruby
     better-defaults
     c-c++
     chrome
     (clojure :variables clojure-enable-fancify-symbols t)
     (colors :variables colors-colorize-identifiers 'all
             colors-enable-nyan-cat-progress-bar t)
     ;;debian-changelog
     elfeed
     emacs-lisp
     ;;eyebrowse
     fancy-narrower
     git
     github
     gnus
     helm
     html
     (hy :variables hy-enable-fancify-symbols t)
     (latex :variables latex-enable-auto-fill t)
     markdown
     nlinum
     (org :variables org-enable-github-support t)
     python
     (ranger :variables
             ranger-show-preview t)
     search-engine
     semantic
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'eshell
            shell-enable-smart-eshell t)
     smex
     spell-checking
     ;;syntax-checking
     themes-megapack
     (version-control :variables
                      version-control-global-margin t
                      version-control-diff-tool 'git-gutter+)
     writeroom
     yaml)
   dotspacemacs-additional-packages '(highlight-leading-spaces swiper-helm feature-mode focus)
   dotspacemacs-excluded-packages '(anaconda-mode)
   dotspacemacs-download-packages 'used-but-keep-unused
   ))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-override-evil-folding 'origami
   dotspacemacs-editing-style 'vim
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-command-key ":"
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5) (projects . 10) (agenda . 5) (todos . 5) bookmarks)
   dotspacemacs-themes '(
                         solarized-dark
                         misterioso
                         subatomic
                         material
                         material-light
                         spacemacs-light
                         spacemacs-dark
                         solarized-light
                         leuven)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("mononoki"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.7)
   dotspacemacs-helm-position 'top
   dotspacemacs-enable-paste-micro-state t
   dotspacemacs-maximized-at-startup t
   dotspacemacs-scratch-mode 'lisp-interaction-mode
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-persistent-server t))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq user-mail-address "algernon@madhouse-project.org"))

(defun algernon/config-magit ()
  (setq magit-push-always-verify nil
        magit-commit-arguments '("--signoff")
        magit-post-display-buffer-hook #'(lambda ()
                                           (when (derived-mode-p 'magit-status-mode)
                                             (delete-other-windows)))))

(defun algernon/config-display-time ()
  (setq display-time-24hr-format t
        display-time-default-load-average nil)
  (display-time-mode))

(defun algernon/config-time-stamp-on-save ()
  (setq time-stamp-active t
        time-stamp-start "[lL]ast [uU]pdated:[    ]+\\\\?[\"<]+"
        time-stamp-line-limit 20
        time-stamp-format (concat "%:y/%02m/%02d %02H:%02M:%02S "
                                  user-mail-address))
  (add-hook 'write-file-hooks #'time-stamp))

(defun algernon/config-global-search-and-replace ()
  (defun algernon/global-ex-search-and-replace ()
    (interactive)
    (let ((evil-ex-substitute-global t))
      (evil-ex "%s/")))
  (define-key evil-normal-state-map "S" #'algernon/global-ex-search-and-replace))

(defun algernon/config-evil ()
  (setq evil-move-cursor-back nil))

(defun algernon/config-elfeed ()
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

(defun algernon/config-lispy-modes ()
  (define-key evil-normal-state-map ")" #'algernon/forward-sentence-or-sexp)
  (define-key evil-normal-state-map "(" #'algernon/backward-sentence-or-sexp))

(defun algernon/set-frame-zoom ()
  (interactive)
  (let ((zoom-frame/buffer 'frame))
    (zoom-in/out 1)
    (zoom-in/out 0)
    (zoom-in/out 5)))

(defun work/notes ()
  "Open the notes project"
  (interactive)
  (find-file "~/Documents/UStream/notes"))

(defun work/wip ()
  "Open the WIP"
  (interactive)
  (find-file "~/Documents/UStream/notes/wip.org"))

(defun work/sources ()
  "Open work-related sources"
  (interactive)
  (eshell-z "~/src/ustream"))

(defun algernon/config-SPC-$ ()
  (spacemacs/declare-prefix "$" "work")
  (spacemacs/set-leader-keys
    "$n" #'work/notes
    "$w" #'work/wip
    "$s" #'work/sources))

(defun algernon/config-gnus ()
  (let ((feed-file (concat user-emacs-directory "private/etc/gnus.el")))
    (if (file-exists-p feed-file)
        (load feed-file))))

(defun algernon/config-org ()
  (setq org-todo-keywords '((sequence "☛ TODO(t)" "|" "✔ DONE(d)")
                            (sequence "⚑ WAITING(w)" "|")
                            (sequence "|" "✘ CANCELED(c)"))))

(defun algernon/shorten-class-name (class)
  (let* ((parts (split-string class "\\."))
         (head (-butlast parts))
         (last (-last-item parts)))

    (concat
     (string-join (-map (lambda (component)
                          (char-to-string (string-to-char component)))
                        head)
                  ".")
     "." last)))

(defun algernon/persp-workaround ()
  (with-eval-after-load "persp-mode"

    (defun persp-remove-killed-buffers ()
      (interactive)
      (mapc #'(lambda (p)
                (when p
                  (setf (persp-buffers p)
                        (delete-if-not #'buffer-live-p
                                       (persp-buffers p)))))
            (persp-persps)))


    (run-at-time t 30 #'persp-remove-killed-buffers)))

(defun algernon/focus-mode ()
  (add-hook 'prog-mode-hook #'focus-mode))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq popwin:close-popup-window-timer-interval 0.1)

  (require 'zoom-frm)

  (algernon/config-magit)
  (algernon/config-display-time)
  (algernon/config-time-stamp-on-save)
  (algernon/config-global-search-and-replace)
  (algernon/config-evil)
  (algernon/config-elfeed)
  (algernon/config-lispy-modes)
  (algernon/config-gnus)
  (algernon/persp-workaround)
  ;;(algernon/focus-mode)
  ;;(algernon/set-frame-zoom)
  (add-hook 'after-make-frame-functions (lambda (buffer)
                                          (run-with-timer 2 nil
                                                          (lambda ()
                                                            ;(algernon/set-frame-zoom)
                                                            (spacemacs/toggle-maximize-frame)
                                                            (shell-command "wmctrl -r 'Edit with Emacs FRAME' -e 0,0,0,1920,1080; wmctrl -a 'Edit with Emacs FRAME'")))))
  (algernon/config-SPC-$)
  (algernon/config-org)

  (with-current-buffer "*scratch*"
    (lisp-interaction-mode))

  (evil-leader/set-key "q#" #'server-edit)
  (define-key evil-normal-state-map (kbd "M-/") #'swiper-helm)

  (global-vi-tilde-fringe-mode 0)
  (spacemacs/toggle-nyan-cat-progress-bar-off)
  (setq custom-file (concat user-emacs-directory "private/etc/custom.el")
        paradox-github-token t
        scroll-margin 3))
