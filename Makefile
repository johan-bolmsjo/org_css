.DEFAULT_GOAL := inline.css.org

$(.DEFAULT_GOAL): org.css
	@echo Generating $@
	$(file >$@,$(org_preamble))
	@echo '#+OPTIONS: org-html-head-include-default-style:nil' > $@
	@echo '#+HTML_HEAD: <style type="text/css">' >> $@
	@echo -n '#+HTML_HEAD: ' >> $@
	@yui-compressor $< >> $@
	@echo >> $@
	@echo '#+HTML_HEAD: </style>' >> $@
