(defconst feed-reader-packages '(elfeed))

;; This requires my fork of elfeed for now, find it on GitHub[1]. It will work
;; with upstream elfeed too, but the behaviour will not be the same.
;;
;; [1]: https://github.com/algernon/elfeed

(defun feed-reader/stats ()
  "Count the number of entries and feeds being currently displayed."
  (if (and elfeed-search-filter-active elfeed-search-filter-overflowing)
      (list 0 0 0)
    (cl-loop with feeds = (make-hash-table :test 'equal)
             for entry in elfeed-search-entries
             for feed = (elfeed-entry-feed entry)
             for url = (elfeed-feed-url feed)
             count entry into entry-count
             count (elfeed-tagged-p 'unread entry) into unread-count
             do (puthash url t feeds)
             finally
             (cl-return
              (list unread-count entry-count (hash-table-count feeds))))))

(defun feed-reader/db-stats ()
  (list (hash-table-count elfeed-db-feeds)
        (length url-queue)
        (cl-count-if #'url-queue-buffer url-queue)))

(defun feed-reader/search-print (entry)
  "Print ENTRY to the buffer."

  (let* ((feed-width 16)
         (tags-width 24)

         (title (or (elfeed-meta entry :title) (elfeed-entry-title entry) ""))
         (title-faces (elfeed-search--faces (elfeed-entry-tags entry)))
         (feed (elfeed-entry-feed entry))
         (feed-title
          (when feed
            (or (elfeed-meta feed :title) (elfeed-feed-title feed))))
         (tags (mapcar #'symbol-name (elfeed-entry-tags entry)))
         (tags-str (concat "[" (mapconcat 'identity tags ",") "]"))
         (title-width (- (window-width) feed-width tags-width 4))
         (title-column (elfeed-format-column
                        title (elfeed-clamp
                               elfeed-search-title-min-width
                               title-width
                               title-width)
                        :left))
         (tag-column (elfeed-format-column
                      tags-str (elfeed-clamp (length tags-str) tags-width tags-width)
                      :left))
         (feed-column (elfeed-format-column
                       feed-title (elfeed-clamp feed-width feed-width feed-width)
                       :left)))

    (insert (propertize feed-column 'face 'elfeed-search-feed-face) " ")
    (insert (propertize tag-column 'face 'elfeed-search-tag-face) " ")
    (insert (propertize title 'face title-faces 'kbd-help title))))

(defun feed-reader/search-header ()
  "Returns the string to be used as the Elfeed header."
  (let* ((separator-left (intern (format "powerline-%s-%s"
                                         (powerline-current-separator)
                                         (car powerline-default-separator-dir))))
         (separator-right (intern (format "powerline-%s-%s"
                                          (powerline-current-separator)
                                          (cdr powerline-default-separator-dir)))))
    (if (zerop (elfeed-db-last-update))
        (elfeed-search--intro-header)
      (let* ((db-time (seconds-to-time (elfeed-db-last-update)))
             (update (format-time-string "%Y-%m-%d %H:%M:%S %z" db-time))
             (stats (feed-reader/stats))
             (search-filter (cond
                             (elfeed-search-filter-active
                              "")
                             (elfeed-search-filter
                              elfeed-search-filter)
                             ("")))
             (lhs (list
                   (powerline-raw (concat search-filter " ") 'powerline-active1 'l)
                   (funcall separator-right 'powerline-active1 'mode-line)))
             (center (list
                      (funcall separator-left 'mode-line 'powerline-active2)
                      (destructuring-bind (unread entry-count feed-count) stats
                        (let ((content (format " %d/%d:%d" unread entry-count feed-count)))
                          (when url-queue
                            (destructuring-bind (total-feeds queue-length in-progress) (feed-reader/db-stats)
                              (setf content (concat content (format " (* %.0f%%%%)"
                                                                    (* (/ (- total-feeds (+ queue-length
                                                                                            in-progress))
                                                                          total-feeds 1.0) 100))))))
                          (propertize content
                                      'face 'powerline-active2)))
                      (funcall separator-right 'powerline-active2 'mode-line)))
             (rhs (list
                   (funcall separator-left 'mode-line 'powerline-active1)
                   (powerline-raw (concat " " update) 'powerline-active1 'r))))

        (concat (powerline-render lhs)
                (powerline-fill-center nil (/ (powerline-width center) 2.0))
                (powerline-render center)
                (powerline-fill nil (powerline-width rhs))
                (powerline-render rhs))))))

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

      (elfeed-setup-split-pane)

      (defconst feed-reader/update-timer
        (run-with-timer 1 (* 60 60) #'elfeed-update))

      (setq-default elfeed-max-connections 2
                    elfeed-search-filter "+unread")

      (setf url-queue-timeout 30)

      (setq elfeed-search-header-function #'feed-reader/search-header
            elfeed-search-print-entry-function #'feed-reader/search-print))))
