;; Last updated: <2015/01/06 15:57:24 algernon@madhouse-project.org>

(add-hook 'write-file-hooks '(lambda ()
                               (time-stamp)))
(setq time-stamp-active t
      time-stamp-start "[lL]ast [uU]pdated:[ 	]+\\\\?[\"<]+"
      time-stamp-line-limit 20
      time-stamp-format (concat "%:y/%02m/%02d %02H:%02M:%02S "
                                user-mail-address))
