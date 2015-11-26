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
        (let ((buff (get-buffer-create "*elfeed-entry*")))
          (with-current-buffer buff
            (elfeed-show-mode)
            (setq elfeed-show-entry entry)
            (elfeed-show-refresh))
          (if elfeed-show-entry-hook
              (run-hook-with-args 'elfeed-show-entry-hook buff entry)
            (switch-to-buffer buff))))

      (defun popwin:elfeed-show-entry (buff entry)
        (popwin:popup-buffer buff
                             :position 'right
                             :width 0.5
                             :dedicated t
                             :noselect nil
                             :stick t))
      (add-hook 'elfeed-show-entry-hook #'popwin:elfeed-show-entry)

      (defun elfeed-show-next ()
        "Show the next item in the elfeed-search buffer."
        (interactive)
        (if elfeed-kill-entry-hook
            (run-hooks 'elfeed-kill-entry-hook)
          (elfeed-kill-buffer))
        (with-current-buffer (elfeed-search-buffer)
          (call-interactively #'elfeed-search-show-entry)))

      (defun elfeed-show-prev ()
        "Show the previous item in the elfeed-search buffer."
        (interactive)
        (if elfeed-kill-entry-hook
            (run-hooks 'elfeed-kill-entry-hook)
          (elfeed-kill-buffer))
        (with-current-buffer (elfeed-search-buffer)
          (forward-line -2)
          (call-interactively #'elfeed-search-show-entry)))

      (defun popwin:elfeed-kill-buffer ()
        (interactive)
        (let ((window (get-buffer-window (get-buffer "*elfeed-entry*"))))
          (kill-buffer (get-buffer "*elfeed-entry*"))
          (delete-window window)))

      (add-hook 'elfeed-kill-entry-hook #'popwin:elfeed-kill-buffer)

      ;; (defconst feed-reader/update-timer
      ;;   (run-with-timer 1 (* 60 60) #'elfeed-update))

      (setf url-queue-timeout 30))))
