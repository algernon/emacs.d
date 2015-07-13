;;; huan.madhouse-project.org.el -- Storage

;; Copyright (C) 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/07/13 16:56:34 algernon@madhouse-project.org>

(use-package material-theme
  :ensure t)

(load-theme 'material)
(sml/setup)
(use-package smart-mode-line-powerline-theme
  :ensure t
  :init (sml/apply-theme 'powerline))
(setq mode-line-end-spaces (make-string 7 #x20)
      sml/mode-width 'right)

(provide 'users/algernon/hosts/huan.madhouse-project.org)
