;; Last updated: <2013/04/09 16:48:13 algernon@madhouse-project.org>

(defun what-face (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d"
                                                pos))))

(setq safe-local-variable-values '((encoding . utf-8)
                                   (ispell-dictionary . "magyar")
                                   (ispell-dictionary . "british")))
