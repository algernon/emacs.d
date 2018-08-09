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
        writeroom-mode
        ))

(defun distraction-free/init-writeroom-mode ()
  (use-package writeroom-mode
    :config (progn
              (spacemacs/set-leader-keys
                "wOw" 'writeroom-mode
                "wOs" 'writeroom-decrease-width
                "wOe" 'writeroom-increase-width
                "wOm" 'writeroom-toggle-mode-line)

              (add-hook 'prog-mode-hook #'writeroom-mode)
              (add-hook 'magit-status-mode-hook #'writeroom-mode)
              (add-hook 'dired-mode-hook #'writeroom-mode)
              (add-hook 'text-mode-hook #'writeroom-mode))))
