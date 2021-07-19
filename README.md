**spm** - simple password manager that uses GnuPG for symmetric encryption.

```
Usage:
  spm [command]
Commands:
  help, --help, -h          print this message
  create user-config        create file for user's configuration
  create key-storage        create key storage in specified location
  ls                        show all records in key storage
  new  [record]             create new record
  view [record]             view specified record
  move [record]             move or rename specified record
  edit [record]             edit specified record
  rm   [record]             remove specified record
  cpl, copy-login [record]  copy record's login on the clipboard
  cpp, copy-pass  [record]  copy record's password on the clipboard
  new-folder    [folder]    create new folder
  rename-folder [folder]    edit specified folder name
  rm-folder     [folder]    remove specified folder
  cc, clear-clipboard       clearing the clipboard
  config                    print spm aggregated config
  version                   print spm version
```

## Requirements

**spm** is written for use in **bash** or its emulators (cygwin, etc.)

Dependencies:
* `gnupg2`
* `coreutils` (`sha256sum` utility)
* `nano`
* `pwgen`
* `tree`
* `xclip`

## GnuPG settings

Highly recommended to install a console program for master-password entering `pinentry-curses` or `pinentry-tty`.

For example, in Debian you can install it by command:

```bash
sudo apt install pinentry-curses.
```

and configure it using commands:

```bash
echo "pinentry-program /usr/bin/pinentry-curses" > ~/.gnupg/gpg-agent.conf
gpgconf --reload gpg-agent
```
