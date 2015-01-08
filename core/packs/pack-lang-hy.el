;; Last updated: <2015/01/08 11:10:16 algernon@madhouse-project.org>

(defun aec-hy-mode-prettify ()
  "Prettify (fn) and (lambda) in Hy mode."

  (push '("fn" . ?ƒ) prettify-symbols-alist)
  (push '("lambda" . ?λ) prettify-symbols-alist))

(use-package hy-mode
  :ensure t
  :defer t
  :init (progn
          (add-hook 'hy-mode-hook #'turn-on-auto-fill)
          (add-hook 'hy-mode-hook #'aec-hy-mode-prettify)
          (add-hook 'hy-mode-hook #'prettify-symbols-mode)))
