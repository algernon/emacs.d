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
  (defun olivetti ()
    "Integrate `olivetti-mode' and `spacemacs/toggle-maximize-buffer'."
    (interactive)
    (if olivetti-mode
        (spacemacs/toggle-maximize-buffer)
      (spacemacs/toggle-maximize-buffer)
      (olivetti-mode 1)))

  (use-package olivetti
    :config (progn
              (spacemacs/set-leader-keys
                "wo" 'olivetti
                "wOs" 'olivetti-shrink
                "wOe" 'olivetti-expand
                "wOm" 'olivetti-toggle-hide-mode-line)
              (setq olivetti-hide-mode-line t)
              (setq-default olivetti-body-width 0.75)

              (add-hook 'prog-mode-hook #'turn-on-olivetti-mode)
              (add-hook 'magit-status-mode-hook #'turn-on-olivetti-mode)
              (add-hook 'dired-mode-hook #'turn-on-olivetti-mode)
              (add-hook 'text-mode-hook #'turn-on-olivetti-mode)

              (advice-add 'spacemacs/toggle-maximize-buffer :after 'olivetti-end))))
