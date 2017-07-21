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
  (defun olivetti ()
    "Integrate `olivetti-mode' and `spacemacs/toggle-maximize-buffer'."
    (interactive)
    (if olivetti-mode
        (spacemacs/toggle-maximize-buffer)
      (spacemacs/toggle-maximize-buffer)
      (olivetti-mode 1)))

  (defun olivetti-end (&rest args)
    "Advise `spacemacs/toggle-maximize-buffer' to disable olivetti."
    (olivetti-mode 0)))
