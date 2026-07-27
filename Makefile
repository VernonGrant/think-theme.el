THEME      := think-theme.el
THEMES_DIR := $(HOME)/.emacs.d/themes

.PHONY: install uninstall

install:
	@mkdir -p $(THEMES_DIR)
	@cp $(THEME) $(THEMES_DIR)/$(THEME)
	@echo "Installed $(THEME) to $(THEMES_DIR)"

uninstall:
	@rm -f $(THEMES_DIR)/$(THEME)
	@echo "Removed $(THEME) from $(THEMES_DIR)"
