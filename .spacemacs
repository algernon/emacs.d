;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/06/18 10:20:48 algernon@madhouse-project.org>
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

;;;; Spacemacs settings

(setq algernon/layers/core '(better-defaults
                             (colors :variables colors-colorize-identifiers 'all
                                     colors-enable-nyan-cat-progress-bar t)
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
                             writeroom)

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
                             (ranger :variables
                                     ranger-show-preview t)
                             restclient)

      algernon/layers/misc '(docker
                             nginx
                             systemd))

(setq algernon/additional-packages '(all-the-icons-dired
                                     all-the-icons-ivy
                                     doom-themes
                                     dracula-theme
                                     evil-goggles
                                     feature-mode
                                     focus
                                     highlight-leading-spaces
                                     (prettify-utils
                                      :location (recipe :fetcher github
                                                        :repo "Ilazki/prettify-utils.el"))
                                     pretty-mode
                                     spaceline-all-the-icons
                                     swiper-helm
                                     virtualenvwrapper))

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
                                             algernon/layers/misc)
   dotspacemacs-additional-packages algernon/additional-packages
   dotspacemacs-excluded-packages '(anaconda-mode)
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
   dotspacemacs-leader-key "SPC"
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
   dotspacemacs-themes '(solarized-dark
                         misterioso
                         subatomic
                         material
                         material-light
                         spacemacs-light
                         spacemacs-dark
                         solarized-light
                         leuven
                         dracula
                         doom-one
                         doom-molokai)
   dotspacemacs-whitespace-cleanup 'trailing))

;;;; Spacemacs user-init & user-config

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (setq custom-file (concat user-emacs-directory "private/etc/custom.el")
        user-mail-address "algernon@madhouse-project.org"))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (algernon/config/display)

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
  ;;(algernon/focus-mode)
  ;;(algernon/set-frame-zoom)

  (algernon/config-SPC-$)
  (algernon/config-org)

  (evil-leader/set-key "q#" #'server-edit)
  (define-key evil-normal-state-map (kbd "M-/") #'swiper-helm)

  (setq paradox-github-token t))

;;;; User config

(defun algernon/config/display ()
  (add-hook 'after-make-frame-functions
            (lambda (buffer)
              (run-with-timer 2 nil
                              (lambda ()
                                ;;(algernon/set-frame-zoom)
                                (spacemacs/toggle-maximize-frame)
                                (shell-command "wmctrl -r 'Edit with Emacs FRAME' -e 0,0,0,1920,1080; wmctrl -a 'Edit with Emacs FRAME'")))))

  (global-vi-tilde-fringe-mode 0)
  (spacemacs/toggle-nyan-cat-progress-bar-off)
  (setq scroll-margin 3)


  (algernon/config/display/fontsets)
  (algernon/config/display/font-locks)
  (algernon/config/display/all-the-icons)
  (algernon/config/display/extra-syntax-highlighting)
  (algernon/config/display/modeline)
  (algernon/config/display/theme-updates))

;;;; Modeline

(defun algernon/config/display/modeline ()
  "Minimalistic spaceline-all-the-icons configuration."

  (use-package spaceline-all-the-icons
    :after spaceline  ; eval-after-load doesn't work for this setup
    :config (progn
              ;; Initialization
              (spaceline-all-the-icons--setup-neotree)
              (spaceline-all-the-icons-theme)

              ;; Configuration
              (setq spaceline-highlight-face-func 'spaceline-highlight-face-default
                    powerline-text-scale-factor 1.1
                    powerline-default-separator 'bar
                    spaceline-all-the-icons-icon-set-modified 'chain
                    spaceline-all-the-icons-icon-set-window-numbering 'circle
                    spaceline-all-the-icons-separator-type 'cup
                    spaceline-all-the-icons-separators-type 'cup
                    spaceline-all-the-icons-primary-separator "")

              ;; Toggles
              (spaceline-toggle-all-the-icons-buffer-size-off)
              (spaceline-toggle-all-the-icons-buffer-position-off)
              (spaceline-toggle-all-the-icons-vc-icon-off)
              (spaceline-toggle-all-the-icons-vc-status-on)
              (spaceline-toggle-all-the-icons-git-status-on)
              (spaceline-toggle-all-the-icons-flycheck-status-off)
              (spaceline-toggle-all-the-icons-time-on)
              (spaceline-toggle-all-the-icons-battery-status-off)
              (spaceline-toggle-hud-off))))

(defun algernon/config/display/fontsets ()
  "Set right fonts for missing and all-the-icons unicode points."

  ;; Fira code ligatures. Fira Code Symbol is a different font than Fira Code!
  ;; You can use any font you wish with just the ligatures, I use Hack.
  (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")

  (defun set-icon-fonts (CODE-FONT-ALIST)
    "Utility to associate unicode points with a chosen font.

CODE-FONT-ALIST is an alist of a font and unicode points to force to use it."
    (mapc (lambda (x)
            (let ((font (car x))
                  (codes (cdr x)))
              (mapc (lambda (code)
                      (set-fontset-font t `(,code . ,code) font))
                    codes)))
          CODE-FONT-ALIST))

  ;; NOTE The icons you see are not the correct icons until this is evaluated
  (set-icon-fonts
   '(("fontawesome"
      ;;              
      #xf07c #xf0c9 #xf0c4 #xf0cb)

     ("all-the-icons"
      ;;    
      #xe907 #xe928)

     ("github-octicons"
      ;;                          
      #xf091 #xf059 #xf076 #xf075 #xe192  #xf016)

     ("Symbola"
      ;; 𝕊    ⨂      ∅      ⟻    ⟼     ⊙      𝕋       𝔽
      #x1d54a #x2a02 #x2205 #x27fb #x27fc #x2299 #x1d54b #x1d53d
      ;; 𝔹    𝔇       𝔗
      #x1d539 #x1d507 #x1d517))))

(defun algernon/config/display/font-locks ()
  "Enable following font-locks for appropriate modes."

  (defun -add-font-lock-kwds (FONT-LOCK-ALIST)
    "Add unicode font lock replacements.

FONT-LOCK-ALIST is an alist of a regexp and the unicode point to replace with.
Used as: (add-hook 'a-mode-hook (-partial '-add-font-lock-kwds the-alist))"
    (defun -build-font-lock-alist (REGEX-CHAR-PAIR)
      "Compose region for each REGEX-CHAR-PAIR in FONT-LOCK-ALIST."
      `(,(car REGEX-CHAR-PAIR)
        (0 (prog1 ()
             (compose-region
              (match-beginning 1)
              (match-end 1)
              ,(concat "	"
                       (list (cadr REGEX-CHAR-PAIR))))))))
    (font-lock-add-keywords nil (mapcar '-build-font-lock-alist FONT-LOCK-ALIST)))

  (defun add-font-locks (FONT-LOCK-HOOKS-ALIST)
    "Utility to add font lock alist to many hooks.

FONT-LOCK-HOOKS-ALIST is an alist of a font-lock-alist and its desired hooks."
    (mapc (lambda (x)
            (lexical-let ((font-lock-alist (car x))
                          (mode-hooks (cdr x)))
              (mapc (lambda (mode-hook)
                      (add-hook mode-hook
                                (-partial '-add-font-lock-kwds font-lock-alist)))
                    mode-hooks)))
          FONT-LOCK-HOOKS-ALIST))

  (add-font-locks
   `((,fira-font-lock-alist        prog-mode-hook  org-mode-hook)
     (,python-font-lock-alist      python-mode-hook)
     (,emacs-lisp-font-lock-alist  emacs-lisp-mode-hook)
     (,hy-font-lock-alist          hy-mode-hook))))

;;;;; Fira-font-locks

(defconst fira-font-lock-alist
  '(;;;; OPERATORS
    ;;;;; Pipes
    ("\\(<|\\)" #Xe14d) ("\\(<>\\)" #Xe15b) ("\\(<|>\\)" #Xe14e) ("\\(|>\\)" #Xe135)

    ;;;;; Brackets
    ("\\(<\\*\\)" #Xe14b) ("\\(<\\*>\\)" #Xe14c) ("\\(\\*>\\)" #Xe104)
    ("\\(<\\$\\)" #Xe14f) ("\\(<\\$>\\)" #Xe150) ("\\(\\$>\\)" #Xe137)
    ("\\(<\\+\\)" #Xe155) ("\\(<\\+>\\)" #Xe156) ("\\(\\+>\\)" #Xe13a)

    ;;;;; Equality
    ("\\(!=\\)" #Xe10e) ("\\(!==\\)"         #Xe10f) ("\\(=/=\\)" #Xe143)
    ("\\(/=\\)" #Xe12c) ("\\(/==\\)"         #Xe12d)
    ("\\(===\\)"#Xe13d) ("[^!/]\\(==\\)[^>]" #Xe13c)

    ;;;;; Equality Special
    ("\\(||=\\)"  #Xe133) ("[^|]\\(|=\\)" #Xe134)
    ("\\(~=\\)"   #Xe166)
    ("\\(\\^=\\)" #Xe136)
    ("\\(=:=\\)"  #Xe13b)

    ;;;;; Comparisons
    ("\\(<=\\)" #Xe141) ("\\(>=\\)" #Xe145)
    ("\\(</\\)" #Xe162) ("\\(</>\\)" #Xe163)

    ;;;;; Shifts
    ("[^-=]\\(>>\\)" #Xe147) ("\\(>>>\\)" #Xe14a)
    ("[^-=]\\(<<\\)" #Xe15c) ("\\(<<<\\)" #Xe15f)

    ;;;;; Dots
    ("\\(\\.-\\)"    #Xe122) ("\\(\\.=\\)" #Xe123)
    ("\\(\\.\\.<\\)" #Xe125)

    ;;;;; Hashes
    ("\\(#{\\)"  #Xe119) ("\\(#(\\)"   #Xe11e) ("\\(#_\\)"   #Xe120)
    ("\\(#_(\\)" #Xe121) ("\\(#\\?\\)" #Xe11f) ("\\(#\\[\\)" #Xe11a)

    ;;;; REPEATED CHARACTERS
    ;;;;; 2-Repeats
    ("\\(||\\)" #Xe132)
    ("\\(!!\\)" #Xe10d)
    ("\\(%%\\)" #Xe16a)
    ("\\(&&\\)" #Xe131)

    ;;;;; 2+3-Repeats
    ("\\(##\\)"       #Xe11b) ("\\(###\\)"         #Xe11c) ("\\(####\\)" #Xe11d)
    ("\\(--\\)"       #Xe111) ("\\(---\\)"         #Xe112)
    ("\\({-\\)"       #Xe108) ("\\(-}\\)"          #Xe110)
    ("\\(\\\\\\\\\\)" #Xe106) ("\\(\\\\\\\\\\\\\\)" #Xe107)
    ("\\(\\.\\.\\)"   #Xe124) ("\\(\\.\\.\\.\\)"   #Xe126)
    ("\\(\\+\\+\\)"   #Xe138) ("\\(\\+\\+\\+\\)"   #Xe139)
    ("\\(//\\)"       #Xe12f) ("\\(///\\)"         #Xe130)
    ("\\(::\\)"       #Xe10a) ("\\(:::\\)"         #Xe10b)

    ;;;; ARROWS
    ;;;;; Direct
    ("[^-]\\(->\\)" #Xe114) ("[^=]\\(=>\\)" #Xe13f)
    ("\\(<-\\)"     #Xe152)
    ("\\(-->\\)"    #Xe113) ("\\(->>\\)"    #Xe115)
    ("\\(==>\\)"    #Xe13e) ("\\(=>>\\)"    #Xe140)
    ("\\(<--\\)"    #Xe153) ("\\(<<-\\)"    #Xe15d)
    ("\\(<==\\)"    #Xe158) ("\\(<<=\\)"    #Xe15e)
    ("\\(<->\\)"    #Xe154) ("\\(<=>\\)"    #Xe159)

    ;;;;; Branches
    ("\\(-<\\)"  #Xe116) ("\\(-<<\\)" #Xe117)
    ("\\(>-\\)"  #Xe144) ("\\(>>-\\)" #Xe148)
    ("\\(=<<\\)" #Xe142) ("\\(>>=\\)" #Xe149)
    ("\\(>=>\\)" #Xe146) ("\\(<=<\\)" #Xe15a)

    ;;;;; Squiggly
    ("\\(<~\\)" #Xe160) ("\\(<~~\\)" #Xe161)
    ("\\(~>\\)" #Xe167) ("\\(~~>\\)" #Xe169)
    ("\\(-~\\)" #Xe118) ("\\(~-\\)"  #Xe165)

    ;;;; MISC
    ("\\(www\\)"                   #Xe100)
    ("\\(<!--\\)"                  #Xe151)
    ("\\(~@\\)"                    #Xe164)
    ("[^<]\\(~~\\)"                #Xe168)
    ("\\(\\?=\\)"                  #Xe127)
    ("[^=]\\(:=\\)"                #Xe10c)
    ("\\(/>\\)"                    #Xe12e)
    ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
    ("[^:=]\\(:\\)[^:=]"           #Xe16c)
    ("\\(<=\\)"                    #Xe157)))

;;;;; Language-font-locks

(defconst emacs-lisp-font-lock-alist
  ;; Outlines not using * so better overlap with in-the-wild packages.
  ;; Intentionally not requiring BOL for eg. fira config modularization
  '(("\\(^;;;\\)"                   ?■)
    ("\\(^;;;;\\)"                  ?○)
    ("\\(^;;;;;\\)"                 ?✸)
    ("\\(^;;;;;;\\)"                ?✿)))

(defconst python-font-lock-alist
  ;; Outlines
  '(("\\(^# \\*\\)[ \t\n]"          ?■)
    ("\\(^# \\*\\*\\)[ \t\n]"       ?○)
    ("\\(^# \\*\\*\\*\\)[ \t\n]"    ?✸)
    ("\\(^# \\*\\*\\*\\*\\)[^\\*]"  ?✿)))

(defconst hy-font-lock-alist
  ;; Outlines
  '(("\\(^;; \\*\\)[ \t\n]"          ?■)
    ("\\(^;; \\*\\*\\)[ \t\n]"       ?○)
    ("\\(^;; \\*\\*\\*\\)[ \t\n]"    ?✸)
    ("\\(^;; \\*\\*\\*\\*\\)[^\\*]"  ?✿)

    ;; self does not work as a prettify symbol for hy, unlike python
    ("\\(self\\)"   ?⊙)))

;;;; All-the-icons

(defun algernon/config/display/all-the-icons ()
  "Add hylang icon to all-the-icons for neotree and modeline integration."

  ;; Both all-the-icons-icon-alist and all-the-icons-mode-icon-alist
  ;; need to be updated for either modification to take effect.
  (with-eval-after-load 'all-the-icons
    (add-to-list
     'all-the-icons-icon-alist
     '("\\.hy$" all-the-icons-fileicon "lisp" :face all-the-icons-orange))
    (add-to-list
     'all-the-icons-mode-icon-alist
     '(hy-mode all-the-icons-fileicon "lisp" :face all-the-icons-orange))))

;;;; Extra-syntax-highlighting

(defun algernon/config/display/extra-syntax-highlighting ()
  "Extra syntax highlighting for desired keywords."

  (defun hy-extra-syntax ()
    (font-lock-add-keywords
     nil '(;; self is not defined by hy-mode as a keyword
         ("\\<\\(self\\)" . 'font-lock-constant-face)

         ;; Highlight entire line for decorators
         ("\\(#@.*$\\)" . 'font-lock-function-name-face)

         ;; Syntax highlighting for reader-macros
         ("\\(#.\\)" . 'font-lock-function-name-face)

         ;; Highlight with macros
         ("\\(with[^ ]*\\)" . 'font-lock-keyword-face)

         ;; Highlight functions after specific macros
         ("\-fixture \\([^ ]*\\)" 1 'font-lock-function-name-face)
         ("\-fixtures \\([^ ]*\\)" 1 'font-lock-function-name-face)

         ;; Fixture macros
         ("\\(deffixture\\)" . 'font-lock-keyword-face)
         ("deffixture \\([^ ]*\\)" 1 'font-lock-function-name-face)

         ;; Asserts
         ("(\\(assert[^ ]*\\)" 1 font-lock-keyword-face))))

  (add-hook 'hy-mode-hook 'hy-extra-syntax))

(defun algernon/config/display/theme-updates ()
  "Face configuration for themes, atm solarized-light."

  (defun update-solarize-dark ()
    (custom-theme-set-faces
     'solarized-dark

     ;; Makes matching parens obvious
     `(sp-show-pair-match-face ((t (:inherit sp-show-pair-match-face
                                             :background "#586e75"))))

     ;; active modeline has no colors
     ;;`(mode-line ((t (:inherit mode-line :background "#002b36"))))
     ;;`(mode-line-inactive ((t (:inherit mode-line :background "#002b36"))))
     ;;`(spaceline-highlight-face ((t (:inherit mode-line :background "#002b36"))))
     ;;`(powerline-active1 ((t (:inherit mode-line :background "#002b36"))))
     ;;`(powerline-active2 ((t (:inherit mode-line :background "#002b36"))))


     `(mode-line ((t (:inherit mode-line :height 1.0))))
     ;;`(spaceline-highlight-face ((t (:inherit mode-line :background "#ff2b36"
     ;;                                         :height 1.0))))

     ;; Inactive modeline has tint
     `(powerline-inactive2 ((t (:inherit powerline-inactive1))))

     ;; Org and outline header updates
     `(org-level-1 ((t (:height 1.25 :foreground ,my-black
                                :background "#268bd2"
                                :weight bold))))
     `(org-level-2 ((t (:height 1.15 :foreground ,my-black
                                :background "#2aa198"
                                :weight bold))))
     `(org-level-3 ((t (:height 1.05 :foreground ,my-black
                                :background "#b58900"
                                :weight bold))))

     '(outline-1 ((t (:inherit org-level-1))))
     '(outline-2 ((t (:inherit org-level-2))))
     '(outline-3 ((t (:inherit org-level-3))))
     '(outline-4 ((t (:inherit org-level-4))))
     ))

  (setq my-black "#1b1b1e")

  (defun update-solarize-light ()
    (custom-theme-set-faces
     'solarized-light

     ;; Makes matching parens obvious
     `(sp-show-pair-match-face ((t (:inherit sp-show-pair-match-face
                                             :background "light gray"))))

     ;; active modeline has no colors
     `(mode-line ((t (:inherit mode-line :background "#fdf6e3"))))
     `(mode-line-inactive ((t (:inherit mode-line :background "#fdf6e3"))))
     `(spaceline-highlight-face ((t (:inherit mode-line :background "#fdf6e3"))))
     `(powerline-active1 ((t (:inherit mode-line :background "#fdf6e3"))))
     `(powerline-active2 ((t (:inherit mode-line :background "#fdf6e3"))))

     ;; Inactive modeline has tint
     `(powerline-inactive2 ((t (:inherit powerline-inactive1))))

     ;; Org and outline header updates
     `(org-level-1 ((t (:height 1.25 :foreground ,my-black
                                :background "#C9DAEA"
                                :weight bold))))
     `(org-level-2 ((t (:height 1.15 :foreground ,my-black
                                :background "#7CDF64"
                                :weight bold))))
     `(org-level-3 ((t (:height 1.05 :foreground ,my-black
                                :background "#F8DE7E"
                                :weight bold))))

     '(outline-1 ((t (:inherit org-level-1))))
     '(outline-2 ((t (:inherit org-level-2))))
     '(outline-3 ((t (:inherit org-level-3))))
     '(outline-4 ((t (:inherit org-level-4))))

     `(org-todo ((t (:foreground ,my-black :weight extra-bold
                                 :background "light gray"))))
     `(org-priority ((t (:foreground ,my-black :weight bold
                                     :background "light gray"))))
     ))

  (if (string= 'solarized-dark (car custom-enabled-themes))
      (update-solarize-dark)
    (update-solarize-light)))

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

(defun algernon/focus-mode ()
  (add-hook 'prog-mode-hook #'focus-mode))
