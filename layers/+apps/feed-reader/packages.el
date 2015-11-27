(defconst feed-reader-packages '(elfeed))

;; This requires my fork of elfeed for now, find it on GitHub[1]. It will work
;; with upstream elfeed too, but the behaviour will not be the same.
;;
;; [1]: https://github.com/algernon/elfeed

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
