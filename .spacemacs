;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2019/04/01 11:56:36 gergo@csillger.hu>
;;
;; Copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2010, 2011,
;;               2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019
;; Gergely Nagy

;; Author: Gergely Nagy
;; Maintainer: Gergely Nagy
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
                             distraction-free
                             evil-goggles
                             fancy-narrower
                             git
                             github
                             search-engine
                             semantic
                             smex
                             spell-checking
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
                             javascript
                             (latex :variables latex-enable-auto-fill t)
                             lua
                             markdown
                             (org :variables org-enable-github-support t)
                             (python :variables
                                     python-sort-imports-on-save t
                                     python-test-runner 'pytest)
                             racket
                             react
                             ruby
                             rust
                             (shell :variables
                                    shell-default-height 30
                                    shell-default-position 'bottom
                                    shell-default-shell 'eshell
                                    shell-enable-smart-eshell t)
                             typescript
                             yaml)

      algernon/layers/apps '(elfeed
                             gnus
                             restclient)

      algernon/layers/misc '(ansible
                             beacon
                             docker
                             emojify
                             finance
                             nginx
                             systemd)

      algernon/layers/personal '(;; +behaviour
                                 algernon-behaviour

                                 ;; +lang
                                 algernon-clojurescript
                                 algernon-markdown
                                 algernon-org
                                 algernon-python
                                 algernon-semantic

                                 ;; +apps
                                 algernon-dired
                                 algernon-elfeed
                                 algernon-eshell
                                 algernon-gnus
                                 algernon-magit
                                 algernon-neotree
                                 algernon-notmuch

                                 ;; +look-n-feel
                                 algernon-fonts
                                 algernon-look-n-feel
                                 algernon-modeline))

(setq algernon/additional-packages '(bats-mode
                                     boxquote
                                     brutalist-theme
                                     bison-mode
                                     dpkg-dev-el
                                     eink-theme
                                     elcord
                                     feature-mode
                                     google-c-style
                                     highlight-leading-spaces
                                     magithub
                                     minimap
                                     origami
                                     package-lint
                                     paredit
                                     powerthesaurus
                                     (prettify-utils
                                      :location (recipe :fetcher github
                                                        :repo "Ilazki/prettify-utils.el"))
                                     pretty-mode
                                     rainbow-mode))

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
   dotspacemacs-excluded-packages '(anaconda-mode
                                    clj-refactor
                                    rainbow-delimiters
                                    tern)
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
   dotspacemacs-default-font '("Courier Prime Code"
                               :size 24
                               :powerline-scale 1.5)
   dotspacemacs-editing-style 'vim
   dotspacemacs-elpa-https t
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-large-file-size 50
   dotspacemacs-leader-key "SPC"
   dotspacemacs-line-numbers '(:relative nil
                               :enabled-for-modes nil)
   dotspacemacs-helm-position 'top
   dotspacemacs-highlight-delimiters 'nil
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-maximized-at-startup nil
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
   dotspacemacs-themes '(brutalist)
   dotspacemacs-whitespace-cleanup 'trailing)
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq custom-file (concat user-emacs-directory "private/etc/custom.el")
        user-mail-address "algernon@madhouse-project.org"))

(defun dotspacemacs/user-config ()
  (global-vi-tilde-fringe-mode 0)
  (set-fringe-mode 32)
  (spacemacs/toggle-centered-point-globally-on)
  (setq-default truncate-lines t)
  (setq elcord-display-buffer-details nil)

  (set-face-attribute 'fixed-pitch nil
                      :family "Courier Prime Code"
                      :weight 'light
                      :height 146)
  (set-face-attribute 'variable-pitch nil
                      :family "EtBembo"
                      :weight 'light
                      :height 146)

  (global-set-key (kbd "M-^") #'powerthesaurus-lookup-word-dwim)

  (spacemacs/toggle-truncate-lines-on)
  (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'elfeed-show-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (evil-define-minor-mode-key 'motion 'visual-line-mode (kbd "<down>") 'evil-next-visual-line)
  (evil-define-minor-mode-key 'motion 'visual-line-mode (kbd "<up>") 'evil-previous-visual-line)

  (setq helm-bookmark-map (make-keymap))

  (add-hook 'c++-mode-hook #'google-set-c-style)
  (add-hook 'c++-mode-hook #'google-make-newline-indent)
  (add-hook 'conf-javaprop-mode #'turn-off-variable-pitch-mode)

  ;; FIXME: Move these to a layer!
  (spacemacs/set-leader-keys "t M" 'minimap-mode)

  (eval-after-load 'origami
    '(progn
       (defun rb-show-only (buffer point)
         (interactive (list (current-buffer) (point)))
         (progn (origami-show-only-node buffer point)
                (when (minimap-active-current-buffer-p)
                  (minimap-new-minimap))))

       (spacemacs/set-leader-keys "n TAB" 'origami-toggle-node)
       (spacemacs/set-leader-keys "n o" 'rb-show-only)
       (define-key evil-insert-state-map [(control tab)] 'origami-toggle-node))))
