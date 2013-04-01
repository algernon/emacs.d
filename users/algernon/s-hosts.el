;; Last updated: <2013/04/01 17:33:28 algernon@madhouse-project.org>

(let ((user-host-file (concat aec-user-dir "/hosts/" system-name ".el")))
  (when (file-exists-p user-host-file)
    (load user-host-file)))
