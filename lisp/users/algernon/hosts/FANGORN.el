;;; FANGORN.el -- Windows desktop

;; Copyright (C) 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/07/02 06:53:51 algernon@madhouse-project.org>

(setq inhibit-eol-conversion t)

(use-package material-theme
  :ensure t)

(load-theme 'material)
(sml/setup)
(use-package smart-mode-line-powerline-theme
  :ensure t
  :init (sml/apply-theme 'powerline))
(setq mode-line-end-spaces (make-string 7 #x20)
      sml/mode-width 'right)

(set-default-font
 "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-utf-8")

(set-fontset-font "fontset-default" '(#xf000 . #xf23a) "FontAwesome")

(provide 'users/algernon/hosts/FANGORN)
