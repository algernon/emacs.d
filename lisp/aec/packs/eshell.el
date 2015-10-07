;; Last updated: <2015/09/22 15:24:06 algernon@madhouse-project.org>

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

(use-package eshell-z
  :ensure t)

(defun eshell/mkbuilddir (&optional dir)
  (setq dir (or dir "b"))
  (unless (file-directory-p dir)
    (eshell/mkdir dir))
  (eshell/cd dir)
  (unless (file-exists-p ".gitignore")
    (with-temp-file ".gitignore"
      (insert "*\n"))))

(defun eshell/e (&rest args)
  "Invoke `find-file' on the file.
    \"e +42 foo\" also goes to line 42 in the buffer."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
          (find-file file)
          (goto-line line))
      (find-file (pop args)))))

(defalias 'eshell/v 'view-file)

(setenv "EDITOR" "emacsclient")

(provide 'aec/packs/eshell)
