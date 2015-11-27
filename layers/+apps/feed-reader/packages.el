(defconst feed-reader-packages '(elfeed))

(defun feed-reader/init-elfeed ()
  (use-package elfeed
    :commands elfeed
    :defer t
    :init (evil-leader/set-key "af" #'elfeed)
    :pin manual
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
      (defvar elfeed-show-entry-switch #'switch-to-buffer
        "Function to call to display and switch to the feed entry buffer.
Defaults to `switch-to-buffer'.")

      (defvar elfeed-show-entry-delete #'elfeed-kill-buffer
        "Function called when quitting from the elfeed-entry
buffer. Does not take any arguments.

Defaults to `elfeed-kill-buffer'.")

      (defun elfeed-show-entry (entry)
        "Display ENTRY in the current buffer."
        (let ((buff (get-buffer-create "*elfeed-entry*")))
          (with-current-buffer buff
            (elfeed-show-mode)
            (setq elfeed-show-entry entry)
            (elfeed-show-refresh))
          (funcall elfeed-show-entry-switch buff)))

      (defun elfeed-show-next ()
        "Show the next item in the elfeed-search buffer."
        (interactive)
        (funcall elfeed-show-entry-delete)
        (with-current-buffer (elfeed-search-buffer)
          (call-interactively #'elfeed-search-show-entry)))

      (defun elfeed-show-prev ()
        "Show the previous item in the elfeed-search buffer."
        (interactive)
        (funcall elfeed-show-entry-delete)
        (with-current-buffer (elfeed-search-buffer)
          (forward-line -2)
          (call-interactively #'elfeed-search-show-entry)))

      ;; Terrible hack ends here.

      (defun popwin:elfeed-show-entry (buff)
        (popwin:popup-buffer buff
                             :position 'right
                             :width 0.5
                             :dedicated t
                             :noselect nil
                             :stick t))

      (defun popwin:elfeed-kill-buffer ()
        (interactive)
        (let ((window (get-buffer-window (get-buffer "*elfeed-entry*"))))
          (kill-buffer (get-buffer "*elfeed-entry*"))
          (delete-window window)))

      (setq elfeed-show-entry-switch #'popwin:elfeed-show-entry
            elfeed-show-entry-delete #'popwin:elfeed-kill-buffer)

      (defconst feed-reader/update-timer
        (run-with-timer 1 (* 60 60) #'elfeed-update))

      (setq-default elfeed-max-connections 2
                    elfeed-search-filter "+unread")

      (setf url-queue-timeout 30))))
