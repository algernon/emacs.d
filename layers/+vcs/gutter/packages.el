;;; packages.el --- gutter Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq gutter-packages
      '(
        git-gutter
        ))

(defun gutter/init-git-gutter ()
  "Initialize git-gutter"

  (use-package git-gutter
    :defer t
    :init (progn
            (setq-default git-gutter:added-sign "⚫"
                          git-gutter:modified-sign "⚫"
                          git-gutter:deleted-sign "⚫"
                          git-gutter:window-size 2)
            (global-git-gutter-mode t)
            (evil-leader/set-key
              "ghr" #'git-gutter:revert-hunk
              "ghN" #'git-gutter:previous-hunk
              "ghn" #'git-gutter:next-hunk
              "ghs" #'git-gutter:stage-hunk))))
