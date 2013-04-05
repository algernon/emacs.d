;;; bombadil.el -- bombadil extras

;; Copyright (C) 2011, 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/04/05 12:37:54 algernon@madhouse-project.org>

(require 'gnus)

(setq gnus-select-method '(nnimap "algernon@madhouse-project.org"
                                  (nnimap-address "imap.madhouse-project.org")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)
                                  (nnimap-user
                                   "algernon@madhouse-project.org")))

(setq gnus-secondary-select-methods
      '((nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.lists.madhouse-project.org")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))
;        (nntp "madhouse-project.org"
;             (nntp-port-number 8119))
))

(setq gnus-posting-styles
      '((".*"
         (organization "The MadHouse Project")
         (eval (setq message-sendmail-extra-arguments '("-a" "madhouse")))
         ("Bcc" "algernon@madhouse-project.org")
         (address "algernon@madhouse-project.org"))
        ))

;; (setq gnus-select-method '(nnimap "lists@madhouse-project.org"
;;                                   (nnimap-stream shell)
;;                                   (imap-shell-program "/usr/lib/dovecot/imap")))

;(setq gnus-select-method '(nntp "madhouse-project.org"
;                                (nntp-port-number 8119)))

(when (and window-system
           (>= emacs-major-version 24))
  (load-theme 'solarized-dark))

;; Replace the modeline with powerline
(when window-system
  (add-to-list 'load-path (concat user-emacs-directory
                                  "packages/emacs-powerline"))
  (require 'powerline)
  (set-face-attribute 'mode-line nil
                      :background "#586e75"
                      :foreground "black"
                      :box nil)
  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#93a1a1"
                      :box nil)

  (setq powerline-color1 "#073642")
  (setq powerline-color2 "#002b36")

  (defun bombadil-powerline-make-fill
    (color)
    (let ((plface (powerline-make-face color)))
      (if (eq 'right (get-scroll-bar-mode))
          (propertize " " 'display '((space :align-to (- right-fringe 40)))
                      'face plface)
        (propertize " " 'display '((space :align-to (- right-fringe 43)))
                    'face plface))))

  (setq-default
   mode-line-format
   (list "%e"
         '(:eval (concat
                  (powerline-rmw            'left   nil)
                  (powerline-buffer-id      'left   nil
                                            powerline-color1)
                  (powerline-major-mode     'left
                                            powerline-color1)
                  (powerline-minor-modes    'left
                                            powerline-color1)
                  (powerline-narrow         'left        powerline-color1
                                            powerline-color2)
                  (powerline-vc             'center
                                            powerline-color2)
                  (bombadil-powerline-make-fill      powerline-color2)
                  (powerline-row         'right       powerline-color1
                                         powerline-color2)
                  (powerline-make-text      ":"          powerline-color1)
                  (powerline-column         'right
                                            powerline-color1)
                  (powerline-narrow 'right powerline-color2 powerline-color1)
                  (powerline-make-text (format-mode-line
                                        mode-line-misc-info) powerline-color2)
                  (powerline-percent        'right  powerline-color1
                                            powerline-color2 )
                  (powerline-narrow 'right nil powerline-color1)
                  (powerline-make-text      "  "    nil))))))
