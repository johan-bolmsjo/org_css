TARGETS := inline.css.org org-mini.css README.html

.PHONY: all
all: $(TARGETS)

inline.css.org: org.css
	@echo Generating $@
	@echo '#+HTML_HEAD: <style type="text/css">' > $@
	@echo -n '#+HTML_HEAD: ' >> $@
	@yui-compressor $< >> $@
	@echo >> $@
	@echo '#+HTML_HEAD: </style>' >> $@

org-mini.css: org.css
	@echo Generating $@
	@yui-compressor $< > $@

README.html: README.org inline.css.org
	emacs --batch --load publish.el --funcall org-publish-all

$(TARGETS): $(MAKEFILE_LIST)
