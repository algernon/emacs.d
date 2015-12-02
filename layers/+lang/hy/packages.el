;;; packages.el --- Hy layer for Spacemacs
;;
;; Copyright (C) 2015 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;;
;; This file is NOT part of GNU Emacs.
;;
;;; License: GPLv3

(setq hy-packages '(hy-mode))

(defun hy/init-hy-mode ()
  (use-package hy-mode
    :defer t
    :config
    (progn
      (when hy-enable-fancify-symbols
        (hy/fancify-symbols #'hy-mode)))))
