;; Last updated: <2015/06/26 12:38:47 algernon@madhouse-project.org>

;; These were borrowed (and slightly tweaked) from http://bzg.fr/emacs-strip-tease.html

(defun mode-line-in-header ()
  (interactive)
  (if (not header-line-format)
      (setq header-line-format (or mode-line-format hide-mode-line))
    (setq header-line-format nil))
  (force-mode-line-update))
(global-set-key (kbd "C-s-SPC") 'mode-line-in-header)

(defvar-local hidden-mode-line-mode nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))
(global-set-key "\C-wz" #'hidden-mode-line-mode)

(provide 'aec/packs/mode-line)
