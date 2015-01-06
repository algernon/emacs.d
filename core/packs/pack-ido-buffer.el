;; Last updated: <2015/01/06 17:25:18 algernon@madhouse-project.org>

(ido-mode t)

(use-package ido-ubiquitous
  :init (ido-ubiquitous-mode t))

(use-package ido-vertical-mode
  :init (ido-vertical-mode 1))

(require 'ido)
(require 'ibuffer)

;; Common ignores
(add-to-list 'ido-ignore-buffers "*Messages")
(add-to-list 'ido-ignore-buffers "*Buffer")
(add-to-list 'ido-ignore-buffers "*Completions")
(add-to-list 'ido-ignore-buffers "*ftp ")
(add-to-list 'ido-ignore-buffers "^[tT][aA][gG][sS]$")
(add-to-list 'ido-ignore-buffers "*ediff")
(add-to-list 'ido-ignore-buffers "*vc#")
(add-to-list 'ido-ignore-buffers "*gnus trace")
(add-to-list 'ido-ignore-buffers "*imap log")
(add-to-list 'ido-ignore-buffers "*nnimap")
(add-to-list 'ido-ignore-buffers "^.newsrc-dribble")
(add-to-list 'ido-ignore-buffers "^.bbdb")
(add-to-list 'ido-ignore-buffers "*sent")
(add-to-list 'ido-ignore-buffers "*magit")

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(global-set-key "\C-xb" 'electric-buffer-list)
(global-set-key "\C-x\C-b" 'ido-switch-buffer)
