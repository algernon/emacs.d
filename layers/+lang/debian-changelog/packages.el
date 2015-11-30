;; This file is a bit of a hack, since d-c-m is from a package...

(defun debian-changelog/disable-aggressive-indent ()
  (interactive)

  (aggressive-indent-mode -1))

(require 'debian-changelog-mode)

(evil-leader/set-key-for-mode 'debian-changelog-mode
  "ma" #'debian-changelog-add-entry
  "mb" #'debian-changelog-close-bug
  "mc" #'debian-changelog-finalise-and-save
  "md" #'debian-changelog-distribution
  "me" #'debian-changelog-unfinalise-last-version
  "mf" #'debian-changelog-finalise-last-version
  "mu" #'debian-changelog-urgency
  "mv" #'debian-changelog-add-version
  "mn" #'outline-next-visible-heading
  "mp" #'outline-previous-visible-heading)

(add-hook 'debian-changelog-mode-hook #'debian-changelog/disable-aggressive-indent)
(add-hook 'debian-changelog-mode-hook #'evil-normal-state)
