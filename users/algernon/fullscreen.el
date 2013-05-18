;; Last updated: <2013/04/02 02:10:32 algernon@madhouse-project.org>

(defun fullscreen (&optional f)
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                              '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                              '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

(when (and (eq window-system 'x)
           (not (is-presentingp)))
  (fullscreen))

(global-set-key [f11] 'fullscreen)
