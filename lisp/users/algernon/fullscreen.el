;; Last updated: <2015/01/08 12:37:55 algernon@madhouse-project.org>

(defun fullscreen (&optional f)
  (interactive)
  (modify-frame-parameters f `((fullscreen . maximized))))

(when (and (eq window-system 'x)
           (not (is-presentingp)))
  (fullscreen))

(global-set-key [f11] 'fullscreen)

(provide 'users/algernon/fullscreen)
