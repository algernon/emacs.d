;; Last updated: <2015/09/21 11:20:28 algernon@madhouse-project.org>

(require 'eshell)
(require 'em-smart)
(require 'em-term)

(add-to-list 'eshell-visual-commands "htop")
(setq eshell-where-to-jump 'begin
      eshell-review-quick-commands nil
      eshell-smart-space-goes-to-end t
      eshell-buffer-shorthand t)

(use-package eshell-git-prompt
  :ensure t
  :init (eshell-git-prompt-use-theme 'powerline))

(defun eshell/mkbuilddir (&optional dir)
  (setq dir (or dir "b"))
  (unless (file-directory-p dir)
    (eshell/mkdir dir))
  (eshell/cd dir)
  (unless (file-exists-p ".gitignore")
    (with-temp-file ".gitignore"
      (insert "*\n"))))

(provide 'aec/packs/eshell)
