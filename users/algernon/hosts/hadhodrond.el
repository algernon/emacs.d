;;; hadhodrond.el -- hadhodrond (formerly moria) extras

;; Copyright (C) 2011, 2012, 2013
;; Gergely Nagy <algernon@madhouse-project.org>

;; Last updated: <2013/04/03 01:02:04 algernon@madhouse-project.org>

(setq gnus-select-method '(nnimap "mail.balabit"
                                  (nnimap-stream network)
                                  (nnimap-server-port 143)))

(setq gnus-secondary-select-methods
      '((nnimap "lists@madhouse-project.org"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl)
                (nnimap-user "lists@madhouse-project.org"))
        (nntp "nntpgit@balabit"
              (nntp-address "localhost")
              (nntp-port-number 8119))
        ))

(setq gnus-posting-styles
      '((".*"
         (address "algernon@balabit.hu")
         (organization "BalaBit IT Security Ltd")
         (eval (setq message-sendmail-extra-arguments '("-a" "balabit")))
         ("Bcc" "algernon@balabit.hu"))
        ))

(when (and window-system
           (>= emacs-major-version 24))
  (load-theme 'solarized-dark))

;; Replace the modeline with powerline
(when (and window-system
           (not (is-presentingp)))
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
