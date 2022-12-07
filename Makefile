TARGETS := \
	org-full-optimized.css \
	org-full-optimized.css.el \
	org-main-optimized.css \
	org-main-optimized.css.el \
	org-font-optimized.css \
	org-font-optimized.css.el \
	README.html

.PHONY: all
all: $(TARGETS)

org-full-optimized.css.el : ELISP_VAR := org-html-head
org-main-optimized.css.el : ELISP_VAR := org-html-head
org-font-optimized.css.el : ELISP_VAR := org-html-head-extra

org-full.css : org-main.css org-font.css
	@echo Generating $@
	@cat $^ > $@

%.css.el : %.css
	@echo Generating $@
	@rm -f $@
	@echo -n '(setq $(ELISP_VAR) "<style type=\"text/css\">' >> $@
	@sed 's,",\\",g' $< >> $@
	@echo '</style>")' >> $@

%-optimized.css : %.css
	@echo Generating $@
	@yui-compressor $< > $@

# Touch README.org because org-publish is "clever" and refuse to build it.
# We know better ...
README.html: README.org org-main-optimized.css.el org-font-optimized.css.el org-publish.el
	@touch README.org
	emacs --batch --load org-publish.el --funcall org-publish-all

$(TARGETS): $(MAKEFILE_LIST)
