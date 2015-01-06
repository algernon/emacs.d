;; Last updated: <2015/01/06 13:31:14 algernon@madhouse-project.org>

(use-package time-stamp
  :init (add-hook 'write-file-hooks '(lambda ()
                                       (time-stamp)))
  :config (setq time-stamp-active t
                time-stamp-start "[lL]ast [uU]pdated:[ 	]+\\\\?[\"<]+"
                time-stamp-line-limit 20
                time-stamp-format (concat "%:y/%02m/%02d %02H:%02M:%02S "
                                          user-mail-address)))
