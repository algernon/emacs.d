;; Last updated: <2013/04/01 12:22:11 algernon@madhouse-project.org>

(setq aec-core-pack-dir (concat aec-core-dir "/packs"))
(add-to-list 'load-path aec-core-pack-dir)

(mapc 'load (directory-files aec-core-pack-dir nil "^[^#].*el$"))
