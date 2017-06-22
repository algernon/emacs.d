;;; packages.el --- evil-goggles Layer packages File for Spacemacs
;;
;; Copyright (c) 2017 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/emacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq evil-goggles-packages '(evil-goggles))

(defun evil-goggles/init-evil-goggles-mode ()
  "Initialize evil-goggles-mode"

  (use-package evil-goggles
    :ensure t
    :config
    (evil-goggles-mode)

    ;; optionally use diff-mode's faces; as a result, deleted text
    ;; will be highlighed with `diff-removed` face which is typically
    ;; some red color (as defined by the color theme)
    ;; other faces such as `diff-added` will be used for other actions
    (evil-goggles-use-diff-faces)))
