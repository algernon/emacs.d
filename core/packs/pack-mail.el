;; Last updated: <2014/10/22 16:06:07 algernon@madhouse-project.org>

(add-to-list 'load-path (concat user-emacs-directory "packages/"))
(add-to-list 'load-path
             (expand-file-name "~/.local/share/emacs/site-lisp/gnus"))

(require 'gnus-switch)
(require 'bbdb nil t)

(setq-default
 gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f %* %B%9{%up%}%s%)\n"
 gnus-summary-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
 gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
 gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
 gnus-sum-thread-tree-false-root ""
 gnus-sum-thread-tree-indent " "
 gnus-sum-thread-tree-leaf-with-other "├► "
 gnus-sum-thread-tree-root ""
 gnus-sum-thread-tree-single-leaf "╰► "
 gnus-sum-thread-tree-vertical "│"
 gnus-agent nil
 gnus-agent-cache nil
 gnus-article-sort-functions (quote ((not
                                      gnus-article-sort-by-number)))
 gnus-visible-headers (quote ("^From:" "^Newsgroups:" "^Subject:"
                              "^Date:" "^Followup-To:" "^Reply-To:"
                              "^Organization:" "^Summary:"
                              "^Keywords:" "^To:" "^[BGF]?Cc:"
                              "^Posted-To:" "^Mail-Copies-To:"
                              "^Mail-Followup-To:" "^Apparently-To:"
                              "^Gnus-Warning:" "^Resent-From:"
                              "^X-Debian-PR-Package:"))
 gnus-subscribe-newsgroup-method 'gnus-subscribe-interactively
 gnus-subscribe-hierarchical-interactive t
 gnus-level-unsubscribed 5
 gnus-gcc-mark-as-read t
 gnus-read-active-file 'some
 gnus-ignored-newsgroups ""
 gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date)
 gnutls-min-prime-bits 1024)

(setq mm-discouraged-alternatives '("text/html" "text/richtext")
      gnus-buttonized-mime-types '("multipart/alternative" "multipart/signed")
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
      message-subscribed-address-functions '(gnus-find-subscribed-addresses))

(copy-face 'bold 'aec-blue-bold)
(set-face-foreground 'aec-blue-bold "ForestGreen")
(setq gnus-face-9 'aec-blue-bold)

(global-set-key "\C-xm" 'gnus-switch)

(defun aec-gnus-get-new-news ()
  (interactive)
  (gnus-group-get-new-news 5))

(add-hook 'gnus-group-mode-hook '(lambda ()
                                   (local-set-key (kbd "g")
                                                  'aec-gnus-get-new-news)))

(defun aec-setup-hl-line ()
  (hl-line-mode 1))

(add-hook 'gnus-summary-mode-hook 'aec-setup-hl-line)
(add-hook 'gnus-group-mode-hook 'aec-setup-hl-line)

;; Layout
(setq gnus-topic-line-format "%i[ %u&topic-line; ] %v\n")

(defun gnus-user-format-function-topic-line (dummy)
  (let ((topic-face (if (zerop total-number-of-articles)
                        'font-lock-comment-face
                      'font-lock-keyword-face)))
    (propertize
     (format "%s %d" name total-number-of-articles)
     'face topic-face)))

(gnus-add-configuration
 '(article
   (horizontal 1.0
               (vertical 25
                         (group 1.0))
               (vertical 1.0
                         (summary 0.25 point)
                         (article 1.0)))))
(gnus-add-configuration
 '(summary
   (horizontal 1.0
               (vertical 25
                         (group 1.0))
               (vertical 1.0
                         (summary 1.0 point)))))

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; BBDB integration
(when (featurep 'bbdb)
  (bbdb-initialize 'gnus 'message)
  (setq bbdb-send-mail-style 'gnus
        bbdb-complete-name-full-completion t
        bbdb-completion-type 'primary-or-name
        bbdb-complete-name-allow-cycling t
        bbdb-offer-save t
        bbdb-use-pop-up nil
        bbdb-electric-p t
        bbdb-silent-running nil))
