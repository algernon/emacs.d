;; Last updated: <2014/01/29 12:09:05 algernon@madhouse-project.org>

(packages-maybe-install '(guide-key))

(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-o"))
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)
