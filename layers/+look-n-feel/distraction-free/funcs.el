;;; packages.el --- distraction-free packages File for Spacemacs
;;
;; Copyright (c) 2015, 2017 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(when (configuration-layer/package-usedp 'olivetti)
  (defun algernon/olivetti-hook ()
    (interactive)

    (message "Olivetti turned on")
    ;;(olivetti-set-width 100)
    (hidden-mode-line-mode)
    (spacemacs/toggle-vi-tilde-fringe-off)
    (olivetti-mode 1))

  (defun turn-on-variable-pitch-mode ()
    (interactive)

    (variable-pitch-mode 1)))
