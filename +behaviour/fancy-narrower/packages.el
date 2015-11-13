;;; packages.el --- fancy-narrow layer packages File for Spacemacs
;;
;; Copyright (c) 2015 Gergely Nagy
;;
;; Author: Gergely Nagy <algernon@madhouse-project.org>
;; URL: https://github.com/algernon/spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq fancy-narrower-packages
      '(
        fancy-narrow
        ))

(defun fancy-narrower/init-fancy-narrow ()
  "Initialize fancy-narrow"

  (use-package fancy-narrow
    :defer t
    :init (progn
            (defun fancy-narrow-or-widen-dwim (p)
              "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, subtree, or defun, whichever applies
first.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
              (interactive "P")
              (declare (interactive-only))
              (cond ((and (fancy-narrow-active-p) (not p)) (fancy-widen))
                    ((region-active-p)
                     (fancy-narrow-to-region (region-beginning) (region-end)))
                    ((derived-mode-p 'org-mode) (org-fancy-narrow-to-subtree))
                    (t (fancy-narrow-to-defun))))

            (evil-leader/set-key
              "nr" #'fancy-narrow-to-region
              "np" #'fancy-narrow-to-page
              "nf" #'fancy-narrow-to-defun
              "nw" #'fancy-widen
              "ni" #'fancy-narrow-or-widen-dwim))))
