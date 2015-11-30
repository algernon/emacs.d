(setq gh-notify-packages '(github-notifier))

(defun gh-notify/init-github-notifier ()
  (use-package github-notifier
    :defer nil
    :ensure t
    :init
    (progn
      (load (concat user-emacs-directory "private/etc/gh-notifier.el"))
      (github-notifier-mode 1))))
