(defconst feed-reader-packages '(elfeed))

(defun feed-reader/init-elfeed ()
  (use-package elfeed
    :commands elfeed
    :defer t
    :init (evil-leader/set-key "af" #'elfeed)
    :config
    (progn
      (evil-set-initial-state #'elfeed-search-mode 'emacs)
      (evil-set-initial-state #'elfeed-show-mode 'emacs)

      (defun feed-reader/search-mode-browse-external-browser ()
        (interactive)

        (let ((browse-url-browser-function 'browse-url-default-browser))
          (call-interactively #'elfeed-show-visit)))

      (evilify elfeed-search-mode elfeed-search-mode-map
               (kbd "q") #'quit-window
               (kbd "G") #'elfeed-search-fetch
               (kbd "g") #'elfeed-search-update--force
               (kbd "n") #'next-line
               (kbd "p") #'previous-line
               (kbd "&") #'feed-reader/search-mode-browse-external-browser)

      (evilify elfeed-show-mode elfeed-show-mode-map
               (kbd "q") #'elfeed-kill-buffer
               (kbd "&") #'feed-reader/search-mode-browse-external-browser)

      ;; Terrible hack for Elfeed split pane view
      (defun elfeed-show-entry (entry)
        "Display ENTRY in the current buffer."
        (let ((title (elfeed-entry-title entry)))
          (split-window-right-and-focus)
          (switch-to-buffer (get-buffer-create (format "*elfeed %s*" title)))
          (unless (eq major-mode 'elfeed-show-mode)
            (elfeed-show-mode))
          (setq elfeed-show-entry entry)
          (elfeed-show-refresh)))

      (defun elfeed-kill-buffer ()
        "Kill the current buffer."
        (interactive)
        (evil-window-left 1)
        (kill-buffer (other-buffer))
        (delete-other-windows))

      ;; (defconst feed-reader/update-timer
      ;;   (run-with-timer 1 (* 60 60) #'elfeed-update))

      (setf url-queue-timeout 30))))
