;;; packages.el --- distraction-free packages File for Spacemacs
;;
;; Copyright (c) 2015, 2017, 2018 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq distraction-free-packages
      '(
        olivetti
        ))

(defun distraction-free/init-olivetti ()
  (use-package olivetti
    :config (progn
              (spacemacs/set-leader-keys
                "wOw" 'olivetti-mode
                "wOs" 'olivetti-shrink
                "wOe" 'olivetti-expand
                "wOm" 'hidden-mode-line-mode)

              (add-hook 'magit-status-mode-hook #'algernon/olivetti-hook)
              (add-hook 'text-mode-hook #'algernon/olivetti-hook)
              (add-hook 'dired-mode-hook #'algernon/olivetti-hook)
              (add-hook 'prog-mode-hook #'algernon/olivetti-hook))))
