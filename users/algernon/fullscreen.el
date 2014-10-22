;; Last updated: <2014/10/22 15:34:17 algernon@madhouse-project.org>

(defun fullscreen (&optional f)
  (interactive)
  (modify-frame-parameters f `((fullscreen . maximized))))

(when (and (eq window-system 'x)
           (not (is-presentingp)))
  (fullscreen))

(global-set-key [f11] 'fullscreen)
