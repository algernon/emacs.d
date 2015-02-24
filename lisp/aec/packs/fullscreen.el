;; Last updated: <2015/02/24 09:43:54 algernon@madhouse-project.org>

(defun fullscreen (&optional f)
  (interactive)
  (modify-frame-parameters f `((fullscreen . maximized))))

(when (and (eq window-system 'x)
           (not (is-presentingp)))
  (fullscreen))

(global-set-key [f11] 'fullscreen)

(provide 'aec/packs/fullscreen)
