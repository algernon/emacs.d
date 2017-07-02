;;;; ~/.emacs.d/ -- algernon's Emacs configuration     -*- no-byte-compile: t -*-
;; Last updated: <2017/07/02 15:09:57 algernon@madhouse-project.org>
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

(defconst algernon-fonts-packages
  '(
    all-the-icons
    all-the-icons-dired
    ))

(defun algernon-fonts/init-all-the-icons-dired ()
  (use-package all-the-icons-dired))

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
      ;;                         
      #xf07c #xf0c9 #xf0c4 #xf0cb #xf017 #xf101)

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
  ;; Both all-the-icons-icon-alist and all-the-icons-mode-icon-alist
  ;; need to be updated for either modification to take effect.
  (with-eval-after-load 'all-the-icons
    (add-to-list
     'all-the-icons-icon-alist
     '("\\.hy$" all-the-icons-fileicon "lisp" :face all-the-icons-orange))
    (add-to-list
     'all-the-icons-icon-alist
     '("\\.ino$" all-the-icons-fileicon "arduino" :face all-the-icons-blue))
    (add-to-list
     'all-the-icons-icon-alist
     '("\\.markdown$" all-the-icons-octicon "markdown" :v-adjust 0.0 :face all-the-icons-lblue))
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

(defun algernon-modeline/post-init-all-the-icons ()
  (algernon/config/display/fontsets)
  (algernon/config/display/font-locks)
  (algernon/config/display/extra-syntax-highlighting))
