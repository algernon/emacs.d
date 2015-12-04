(setq feed-reader-packages
      '(elfeed
        (elfeed-goodies :location (recipe :fetcher github
                                          :repo "algernon/elfeed-goodies"))
        ))

(defun feed-reader/init-elfeed ()
  (use-package elfeed
    :commands elfeed
    :init (evil-leader/set-key "af" #'elfeed)
    :config
    (progn
      (spacemacs|evilify-map elfeed-search-mode-map
        :mode elfeed-search-mode
        :eval-after-load elfeed-search
        :bindings
        "c"  'elfeed-db-compact
        "gr" 'elfeed-update
        "o"  'elfeed-load-opml
        "q"  'quit-window
        "r"  'elfeed-search-update--force)

      (spacemacs|evilify-map elfeed-show-mode-map
        :mode elfeed-show-mode
        :eval-after-load elfeed-show
        :bindings
        "q" 'quit-window
        "n" 'elfeed-show-next
        "p" 'elfeed-show-prev)

      (evil-set-initial-state #'elfeed-show-mode 'emacs)

      (defconst feed-reader/update-timer
        (run-with-timer 1 (* 60 60) #'elfeed-update))

      (setq-default elfeed-max-connections 2
                    elfeed-search-filter "+unread"
                    elfeed-goodies/wide-threshold 0.25
                    elfeed-goodies/entry-pane-position 'bottom
                    elfeed-goodies/entry-pane-size 0.85)

      (setf url-queue-timeout 30)

      )))

(defun feed-reader/init-elfeed-goodies ()
  (use-package elfeed-goodies
    :commands elfeed-goodies/setup
    :init (spacemacs|use-package-add-hook elfeed
            :post-config (elfeed-goodies/setup))))
