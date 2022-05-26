TARGETS := inline.css.org org-mini.css

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

$(TARGETS): $(MAKEFILE_LIST)
