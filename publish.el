(require 'ox-publish)

(setq org-publish-project-alist
      '(("readme"
	 :auto-sitemap nil
	 :html-metadata-timestamp-format "%Y-%m-%d %H:%M"
	 :html-validation-link nil
         :publishing-function org-html-publish-to-html
         :recursive nil
         :base-directory "./"
         :base-extension "org"
	 :exclude "^inline\.css\.org$"
         :publishing-directory "./")
        ("all" :components ("readme"))))
