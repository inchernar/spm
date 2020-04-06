**spm** - password manager that uses GnuPG for symmetric encryption.

```
Usage:
  spm [command]
Commands:
  help, --help, -h      print this message
  init                  initialize spm storage
  ls                    show all encrypted files
  enc [file]            encrypt new file
  dec [file]            decrypt encrypted file
  del [file]            delete chosen file
  edit [file]           edit existing encrypted file
  version               print spm version
```

At initializing `spm` creates `.spm_storage` folder in user's home directory. That keeps encrypted files with credentials.

Requirements:
* bash
* gpg
* nano

From version 0.6 you can use `/etc/spm.conf` to override script variables (like `STORAGE_FOLDER`).