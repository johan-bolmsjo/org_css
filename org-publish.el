(require 'ox-publish)

;; Export options:
;; - https://orgmode.org/manual/Export-Settings.html
;; - https://orgmode.org/manual/Publishing-options.html

(setq org-export-with-toc nil)
(setq org-export-with-section-numbers 0)
(setq org-export-headline-levels 4)
(setq org-export-with-author nil)
(setq org-export-time-stamp-file nil)
(setq org-export-with-sub-superscripts nil)
(setq org-export-with-date nil)
(setq org-html-head-include-default-style nil)
(setq org-html-metadata-timestamp-format "%Y-%m-%d")
(setq org-html-validation-link nil)

(load (expand-file-name "org-main-optimized.css.el" "."))
;;(load (expand-file-name "org-font-optimized.css.el" "."))
(setq org-html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://bitmaster.se/css/org-font-optimized.css\" />")

(setq org-publish-project-alist
      '(("readme"
         :auto-sitemap nil
         :publishing-function org-html-publish-to-html
         :recursive nil
         :base-directory "./"
         :base-extension "org"
         :publishing-directory "./")
        ("all" :components ("readme"))))
