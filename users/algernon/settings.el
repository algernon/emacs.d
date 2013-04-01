;; Last updated: <2013/04/01 12:59:38 algernon@madhouse-project.org>

(setq user-mail-address "algernon@madhouse-project.org"
      add-log-file-name-function nil
      add-log-full-name "Gergely Nagy"
      add-log-keep-changes-together t
      add-log-mailing-address "algernon@madhouse-project.org"
      auto-save-list-file-prefix "~/tmp/.backups/.saves-"
      backup-directory-alist (quote (("." . "~/tmp/.backups")))
      browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium"
      default-justification 'left
      debian-changelog-mailing-address "algernon@madhouse-project.org"
      display-time-24hr-format t
      display-time-interval 10
      display-time-string-forms (quote ((if (and (not display-time-format) display-time-day-and-date) (format-time-string "%a %b %e " now) "") (format-time-string (or display-time-format (if display-time-24hr-format "%T" "%-I:%M%p")) now)))
      frame-background-mode 'dark
      indent-tabs-mode nil
      kept-new-versions 10
      kept-old-versions 10
      remote-shell-program "/usr/bin/ssh"
      require-final-newline t
      safe-local-variable-values (quote ((ispell-dictionary . "magyar") (ispell-dictionary . "british")))
      tramp-default-method "scp"
      vc-diff-switches "-u"
      version-control t)

(display-time-mode)
(set-default 'indicate-empty-lines t)