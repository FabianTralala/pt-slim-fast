# pt-slim-fast
The zsh script `pt-slim-fast.sh` removes some 3rd party integrations and demo material from a fresh Pro Tools install, then starts the Avid Link Uninstaller. See code for details.

macOS only.

## how to run

Download the repo or copy the script code into a new text file.
Don't forget to set the executable flag:
```
chmod +x path/to/scriptfile
```

To be able to remove files from `/library` and `/usr/local/share`, the script has to run with admin privileges (sudo). If you're not sure what that means or how to do it, you probably shouldn't run the script this way. 

It's okay to run it with normal user rights - it just won't be able to delete some files and complain about it:
```
/absolute/path/to/scriptfile
```

Tested with PT 2025.10 and 2025.12
