SHELL := /bin/bash
PLATFORM := $(shell uname -o)
# Supported platforms
GNU_LINUX := GNU/Linux
CYGWIN := Cygwin
MSYS := Msys
# Platform dependent targets
GNU_LINUX_DEPENDENCY_PACKAGES := coreutils gnupg2 pwgen nano tree xclip

# General targets
install: installation-4-$(PLATFORM)
uninstall: uninstall-4-$(PLATFORM)

# GNU Linux targets
installation-4-$(GNU_LINUX): install-script gnu-linux-depends-install

gnu-linux-depends-install:
	for pckg in $(GNU_LINUX_DEPENDENCY_PACKAGES); do \
		is_install=$$(apt -qq list --installed $$pckg 2>/dev/null | wc -l); \
		if [[ $$is_install == 1 ]]; then \
			echo -e "\033[1;32m\xE2\x9C\x94\033[0m $$pckg"; \
		else \
			echo -e "\033[1;31m\xE2\x9C\x95\033[0m $$pckg"; \
			apt install -y $$pckg; \
		fi; \
	done; \

uninstall-4-$(GNU_LINUX): uninstall-script

# Cygwin targets
installation-4-$(CYGWIN): install-script
uninstall-4-$(CYGWIN): install-script

# Msys targets
installation-4-$(MSYS): install-script
uninstall-4-$(MSYS): install-script

# Common targets
install-script:
	echo "cp ./spm /usr/bin/spm"
uninstall-script:
	echo "rm /usr/bin/spm"
