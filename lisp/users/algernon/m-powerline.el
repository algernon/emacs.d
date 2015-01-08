;; Last updated: <2015/01/08 12:38:08 algernon@madhouse-project.org>

;; Replace the modeline with powerline
(defun aec-powerline ()
  (interactive)
  (when (and window-system
             (not (is-presentingp)))
    (add-to-list 'load-path (concat user-emacs-directory
                                    "packages/emacs-powerline"))
    (require 'powerline)
    (set-face-attribute 'mode-line nil
                        :background "#586e75"
                        :foreground "black"
                        :box nil)
    (set-face-attribute 'mode-line-inactive nil
                        :foreground "#93a1a1"
                        :box nil)

    (setq powerline-color1 "#073642")
    (setq powerline-color2 "#002b36")

    (defun bombadil-powerline-make-fill
        (color)
      (let ((plface (powerline-make-face color)))
        (if (eq 'right (get-scroll-bar-mode))
            (propertize " " 'display '((space :align-to (- right-fringe 40)))
                        'face plface)
          (propertize " " 'display '((space :align-to (- right-fringe 43)))
                      'face plface))))

    (setq-default
     mode-line-format
     (list "%e"
           '(:eval (concat
                    (powerline-rmw            'left   nil)
                    (powerline-buffer-id      'left   nil
                                              powerline-color1)
                    (powerline-major-mode     'left
                                              powerline-color1)
                    (powerline-minor-modes    'left
                                              powerline-color1)
                    (powerline-narrow         'left        powerline-color1
                                              powerline-color2)
                    (powerline-vc             'center
                                              powerline-color2)
                    (bombadil-powerline-make-fill      powerline-color2)
                    (powerline-row         'right       powerline-color1
                                           powerline-color2)
                    (powerline-make-text      ":"          powerline-color1)
                    (powerline-column         'right
                                              powerline-color1)
                    (powerline-narrow 'right powerline-color2 powerline-color1)
                    (powerline-make-text (format-mode-line
                                          mode-line-misc-info) powerline-color2)
                    (powerline-percent        'right  powerline-color1
                                              powerline-color2 )
                    (powerline-narrow 'right nil powerline-color1)
                    (powerline-make-text      "  "    nil)))))))

(provide 'users/algernon/m-powerline)
