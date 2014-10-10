;; Last updated: <2014/10/08 10:04:46 algernon@madhouse-project.org>

(defun fullscreen (&optional f)
  (interactive)
  (shell-command (concat "wmctrl -i -r " (frame-parameter f 'outer-window-id) " -btoggle,maximized_vert,maximized_horz")))

(when (and (eq window-system 'x)
           (not (is-presentingp)))
  (fullscreen))

(global-set-key [f11] 'fullscreen)
