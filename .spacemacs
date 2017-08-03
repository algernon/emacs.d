;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/08/03 09:24:20 algernon@madhouse-project.org>
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

;;; History:

;; Ancient history is in CVS, somewhere - but that's not
;; interesting. This whole thing has been rewritten around the time I
;; imported it into git. Then it was developed as part of my private
;; $HOME repository, and then extracted out into its own repo.
;;
;; From that point onward, see the git log.

;;; Code:

(setq algernon/layers/core '(better-defaults
                             (colors :variables colors-colorize-identifiers 'all
                                     colors-enable-nyan-cat-progress-bar t)
                             distraction-free
                             evil-goggles
                             fancy-narrower
                             git
                             github
                             search-engine
                             semantic
                             smex
                             spell-checking
                             ;;syntax-checking
                             themes-megapack
                             typography
                             (version-control :variables
                                              version-control-global-margin t
                                              version-control-diff-tool 'git-gutter+)
                             writegood)

      algernon/layers/lang '(c-c++
                             (clojure :variables clojure-enable-fancify-symbols t)
                             emacs-lisp
                             go
                             html
                             ;;(hy :variables hy-enable-fancify-symbols t)
                             javascript
                             (latex :variables latex-enable-auto-fill t)
                             markdown
                             (org :variables org-enable-github-support t)
                             (python :variables
                                     python-sort-imports-on-save t
                                     python-test-runner 'pytest)
                             ruby
                             (shell :variables
                                    shell-default-height 30
                                    shell-default-position 'bottom
                                    shell-default-shell 'eshell
                                    shell-enable-smart-eshell t)
                             typescript
                             yaml)

      algernon/layers/apps '(chrome
                             elfeed
                             gnus
                             restclient)

      algernon/layers/misc '(beacon
                             docker
                             emojify
                             nginx
                             systemd)

      algernon/layers/personal '(;; +behaviour
                                 algernon-behaviour

                                 ;; +lang
                                 algernon-clojurescript
                                 algernon-org
                                 algernon-python
                                 algernon-semantic

                                 ;; +apps
                                 algernon-elfeed
                                 algernon-eshell
                                 algernon-gnus
                                 algernon-magit
                                 algernon-neotree

                                 ;; +look-n-feel
                                 algernon-fonts
                                 algernon-look-n-feel
                                 algernon-modeline))

(setq algernon/additional-packages '(doom-themes
                                     flatui-theme
                                     (github-modern-theme
                                      :location (recipe :fetcher github
                                                        :repo "philiparvidsson/GitHub-Modern-Theme-for-Emacs"))
                                     feature-mode
                                     highlight-leading-spaces
                                     package-lint
                                     paredit
                                     (prettify-utils
                                      :location (recipe :fetcher github
                                                        :repo "Ilazki/prettify-utils.el"))
                                     pretty-mode))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers (append algernon/layers/core
                                             algernon/layers/lang
                                             algernon/layers/apps
                                             algernon/layers/misc

                                             algernon/layers/personal)
   dotspacemacs-additional-packages algernon/additional-packages
   dotspacemacs-excluded-packages '(anaconda-mode clj-refactor)
   dotspacemacs-download-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-command-key ":"
   dotspacemacs-default-font '("Hack"
                               :size 24
                               :powerline-scale 1.5)
   dotspacemacs-editing-style 'vim
   dotspacemacs-elpa-https t
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-large-file-size 5
   dotspacemacs-leader-key "SPC"
   dotspacemacs-line-numbers '(:relative t
                               :enabled-for-modes nil)
   dotspacemacs-helm-position 'top
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-maximized-at-startup t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-override-evil-folding 'origami
   dotspacemacs-persistent-server t
   dotspacemacs-scratch-mode 'lisp-interaction-mode
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-startup-lists '((recents . 5) (projects . 10) (agenda . 5) (todos . 5) bookmarks)
   dotspacemacs-themes '(github-modern
                         solarized-dark
                         solarized-light
                         spacemacs-light
                         spacemacs-dark
                         material
                         leuven
                         doom-one
                         doom-molokai)
   dotspacemacs-whitespace-cleanup 'trailing))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq custom-file (concat user-emacs-directory "private/etc/custom.el")
        user-mail-address "algernon@madhouse-project.org"))

(defun dotspacemacs/user-config ()
  (global-vi-tilde-fringe-mode 0)
  (spacemacs/toggle-nyan-cat-progress-bar-off)

  ;; FIXME: This should work in the layer, but it doesn't.
  (when (configuration-layer/package-usedp 'olivetti)
    (spacemacs/set-leader-keys "wo" 'olivetti)))
