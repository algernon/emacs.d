;;; packages.el --- centered-window Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq centered-window-packages
    '(
      centered-window-mode
      ))

(setq centered-window-excluded-packages '())

(defun centered-window/init-centered-window-mode ()
  "Initialize centered-window"

  (when (fboundp #'set-fringe-mode)
    (use-package centered-window-mode
      :ensure t
      :defer t
      :init (progn

                (defun spacemacs/centered-window-mode ()
                  (interactive)

                  (evil-leader/set-key "t*" 'centered-window-mode))

              (evil-leader/set-key "t*" 'spacemacs/centered-window-mode)
              (centered-window-mode)))))
