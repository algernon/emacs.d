;;; mirkwood.el -- desktop VM

;; Copyright (C) 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/08/20 13:53:11 algernon@madhouse-project.org>

(use-package material-theme
  :ensure t)

(load-theme 'material)
(sml/setup)
(use-package smart-mode-line-powerline-theme
  :ensure t
  :init (sml/apply-theme 'powerline))
(setq mode-line-end-spaces (make-string 7 #x20)
      sml/mode-width 'right)

(provide 'users/algernon/hosts/mirkwood)
