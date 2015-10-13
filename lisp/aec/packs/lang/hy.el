;; Last updated: <2015/08/13 10:59:31 algernon@madhouse-project.org>

(defun aec-hy-mode-prettify ()
  "Prettify (fn) and (lambda) in Hy mode."

  (push '("fn" . ?ƒ) prettify-symbols-alist)
  (push '("lambda" . ?λ) prettify-symbols-alist))

(defun hy-xi-fontify ()
  "Prettify (xi) to (xᵢ) in Hy mode."
  (interactive)

  (font-lock-add-keywords
   'hy-mode
   `(("\\(x\\([0-9]\\)\\)"
      (0 (progn
           (compose-region (match-beginning 2)
                           (match-end 2)
                           (replace-regexp-in-string
                            "[0-9]"
                            (lambda (v) (format "%c" (+ (string-to-number v)
                                                   8320)))
                            (match-string 2)))
           nil)))
     ("\\(xi\\)"
      (0 (progn
           (compose-region (match-beginning 1)
                           (match-end 1) "ξ")
           nil))))))

(use-package hy-mode
  :ensure t
  :defer t
  :init (progn
          (add-hook 'hy-mode-hook #'turn-on-auto-fill)
          (add-hook 'hy-mode-hook #'aec-hy-mode-prettify)
          (add-hook 'hy-mode-hook #'prettify-symbols-mode)
          (hy-xi-fontify)))

(provide 'aec/packs/lang/hy)
