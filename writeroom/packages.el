;;; packages.el --- writeroom Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq writeroom-packages
      '(
        writeroom-mode
        ))

(defun writeroom/init-writeroom-mode ()
  "Initialize writeroom-mode"

  (use-package writeroom-mode
    :defer t
    :init (progn
            (defun spacemacs/writeroom-mode ()
              (interactive)

              (evil-leader/set-key "tW" #'writeroom-mode))
            (evil-leader/set-key "tW" #'spacemacs/writeroom-mode))))
