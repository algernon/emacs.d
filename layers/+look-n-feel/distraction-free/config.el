;;; config.el --- distraction-free packages File for Spacemacs
;;
;; Copyright (c) 2015, 2017, 2018 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq-default olivetti-body-width 90)

(add-hook 'text-mode-hook #'turn-on-variable-pitch-mode)
(add-hook 'yaml-mode-hook #'turn-off-variable-pitch-mode)
