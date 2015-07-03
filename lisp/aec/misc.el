;; Last updated: <2015/07/03 11:13:47 algernon@madhouse-project.org>

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d"
                                                pos))))

(setq safe-local-variable-values '((encoding . utf-8)
                                   (ispell-dictionary . "magyar")
                                   (ispell-dictionary . "british")))

(defun insert-rfc-date ()
  "Inserts RFC2822 formatted date at point"
  (interactive)

  (insert (format-time-string "%a, %e %b %Y %H:%M:%S %z")))

(use-package try
  :ensure t)

(use-package paradox
  :ensure t)

(provide 'aec/misc)
