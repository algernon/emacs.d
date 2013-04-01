;; Last updated: <2013/04/01 12:56:51 algernon@madhouse-project.org>

(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun packages-maybe-install (packages)
  "Install a list of packages, unless they're already installed."

  (dolist (p packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun add-to-list* (the-list &rest elements)
  "Add a set of ELEMENTS to THE-LIST, prepend by default, append
   if APPEND is non-nil."

  (mapcar (lambda (x) (add-to-list the-list x)) elements))

;; Dispatch to local snippets.
;;
;; Loads ~/.emacs.d/$USER/settings.el, ~/.emacs.d/core/*,
;; ~/.emacs.d/$HOSTNAME.el, then ~/.emacs.d/$USER.el, and then
;; ~/.emacs.d/$USER/*
(setq aec-system-config (concat user-emacs-directory system-name ".el")
      aec-user-config (concat user-emacs-directory user-login-name ".el")
      aec-user-dir (concat user-emacs-directory user-login-name)
      aec-core-dir (concat user-emacs-directory "core"))
(add-to-list 'load-path aec-core-dir)
(add-to-list 'load-path aec-user-dir)

(when (file-exists-p (concat aec-user-dir "/settings.el"))
  (load (concat aec-user-dir "/settings.el")))
(when (file-exists-p aec-core-dir)
  (mapc 'load (directory-files aec-core-dir nil "^[^#].*el$")))
(when (file-exists-p aec-system-config) (load aec-system-config))
(when (file-exists-p aec-user-config) (load aec-user-config))
(when (file-exists-p aec-user-dir)
  (mapc 'load (directory-files aec-user-dir nil "^[^#].*el$")))
