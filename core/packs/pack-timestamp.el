;; Last updated: <2015/01/08 10:45:13 algernon@madhouse-project.org>

(add-hook 'write-file-hooks #'time-stamp)
(setq time-stamp-active t
      time-stamp-start "[lL]ast [uU]pdated:[ 	]+\\\\?[\"<]+"
      time-stamp-line-limit 20
      time-stamp-format (concat "%:y/%02m/%02d %02H:%02M:%02S "
                                user-mail-address))
