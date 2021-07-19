SHELL := /bin/bash
PLATFORM := $(shell uname -o)
GNU_LINUX := GNU/Linux
GNU_LINUX_DEPENDENCY_PACKAGES := coreutils gnupg2 pwgen nano tree xclip
CYGWIN := Cygwin
MSYS := Msys

install: installation-4-$(PLATFORM)
uninstall: uninstall-4-$(PLATFORM)

## GNU Linux targets
installation-4-$(GNU_LINUX): gnu-linux-depends-install install-script

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

## Cygwin targets
installation-4-$(CYGWIN): install-script
uninstall-4-$(CYGWIN): install-script

## Msys targets
installation-4-$(MSYS): install-script
uninstall-4-$(MSYS): install-script

## Common targets
install-script:
	install -m 755 ./spm /usr/bin/
uninstall-script:
	rm /usr/bin/spm
