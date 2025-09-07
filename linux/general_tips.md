## General Tips

### nano
- Ctrl + O, enter saves the file
- Ctrl + X exits the editor

### chmod
- Changes a file’s permission bits
- E.g. `chmod 600 filename` means:
    - Owner can read (4) and write (2) → 4 + 2 = 6
    - Group can do nothing → 0
    - Others can do nothing → 0
- Nobody else on the system can list or open it
- root could read it only by explicitly elevating privileges via sudo

### chown
- Changes a file’s ownership
- E.g. `chown username:username filename` sets both the user owner and the group owner to username, meaning username is the only account with the read/write rights granted via `chmod 600`
