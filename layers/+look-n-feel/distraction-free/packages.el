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
    :init (progn
            (spacemacs/set-leader-keys
              "wo" 'olivetti
              "wOs" 'olivetti-shrink
              "wOe" 'olivetti-expand
              "wOm" 'olivetti-toggle-hide-mode-line)
            (setq olivetti-body-width 0.75
                  olivetti-hide-mode-line t))
    :config (advice-add 'spacemacs/toggle-maximize-buffer
                        :after (lambda (&rest args) (olivetti-mode 0)))))
