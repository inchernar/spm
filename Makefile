SHELL := /bin/bash
PLATFORM := $(shell uname -o)
# Supported platforms
GNU_LINUX_PLATFORM := GNU/Linux
CYGWIN_PLATFORM := Cygwin
MSYS_PLATFORM := Msys
# Platform dependent targets
GLP_DEPENDENCY_PACKAGES := coreutils pwgen gnupg2 tree xclip

# General targets
install: installation-4-$(PLATFORM)
uninstall: uninstall-4-$(PLATFORM)

# GNU Linux targets
installation-4-$(GNU_LINUX_PLATFORM): install-script gnu-linux-depends-install

gnu-linux-depends-install:
	# apt install -y $(GLP_DEPENDENCY_PACKAGES)
	for pckg in $(GLP_DEPENDENCY_PACKAGES); do \
		is_install=$$(apt -qq list --installed $$pckg 2>/dev/null | wc -l); \
		if [[ $$is_install == 1 ]]; then \
			echo -e "\033[1;32m\xE2\x9C\x94\033[0m $$pckg"; \
		else \
			echo -e "\033[1;31m\xE2\x9C\x95\033[0m $$pckg"; \
			apt install -y $$pckg; \
		fi; \
		# echo ; \
	done; \

uninstall-4-$(GNU_LINUX_PLATFORM): uninstall-script

# Cygwin targets
installation-4-$(CYGWIN_PLATFORM): install-script
uninstall-4-$(CYGWIN_PLATFORM): install-script

# Msys targets
installation-4-$(MSYS_PLATFORM): install-script
uninstall-4-$(MSYS_PLATFORM): install-script

# Common targets
install-script:
	echo "cp ./spm /usr/bin/spm"
uninstall-script:
	echo "rm /usr/bin/spm"
