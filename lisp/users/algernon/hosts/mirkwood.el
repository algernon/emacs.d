;;; mirkwood.el -- desktop VM

;; Copyright (C) 2015
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2015/10/17 11:48:04 algernon@madhouse-project.org>

(use-package material-theme
  :ensure t)

(load-theme 'material)

(use-package spaceline
  :ensure t
  :init (progn
          (require 'spaceline-config)
          (spaceline-spacemacs-theme)))

(provide 'users/algernon/hosts/mirkwood)
