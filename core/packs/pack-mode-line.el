;; Last updated: <2014/01/23 17:48:19 algernon@madhouse-project.org>

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
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode RET to make the mode-line appear."))))

;; Activate hidden-mode-line-mode
(when (and (eq window-system 'x)
           (boundp 'debian-emacs-flavor)
           (eq debian-emacs-flavor 'emacs-snapshot))
  (mode-line-in-header)
  (hidden-mode-line-mode 1))
