;; Last updated: <2014/10/02 07:58:08 algernon@madhouse-project.org>

(defun fullscreen (&optional f)
  (interactive)
  (shell-command (concat "wmctrl -i -r " (frame-parameter nil 'outer-window-id) " -btoggle,maximized_vert,maximized_horz")))

(when (and (eq window-system 'x)
           (not (is-presentingp)))
  (fullscreen))

(global-set-key [f11] 'fullscreen)
