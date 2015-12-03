(defconst feed-reader-packages '(elfeed))

(defun feed-reader/init-elfeed ()
  (use-package elfeed
    :defer t
    :commands elfeed
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
               (kbd "p") #'previous-line)

      (evilify elfeed-show-mode elfeed-show-mode-map
               (kbd "q") #'elfeed-kill-buffer)

      (defconst feed-reader/update-timer
        (run-with-timer 1 (* 60 60) #'elfeed-update))

      (setq-default elfeed-max-connections 2
                    elfeed-search-filter "+unread"
                    elfeed-goodies/wide-threshold 0.25
                    elfeed-goodies/entry-pane-position 'bottom
                    elfeed-goodies/entry-pane-size 0.85)

      (setf url-queue-timeout 30)

      (use-package elfeed-goodies
        :load-path "~/src/personal/elfeed-goodies"
        :pin manual
        :config (elfeed-goodies/setup)))))

(defun feed-reader/init-elfeed-goodies ())
