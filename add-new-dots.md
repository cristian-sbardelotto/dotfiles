### to add new dotfiles, do this

1. copy the dotfile that's in your home folder in the same structure in the dotfiles/ folder 

```bash
cp -r /home/username/.config/<config-folder-name> /home/username/dotfiles/.config
```

2. make sure you're not gonna overwrite any files and you dotfiles git repo is up to date
3. run `stow --adopt .` in `dotfiles/` folder

> DISCLAIMER: from now on, remember that the main file is in the `dotfiles` folder, and you have to change exclusively this one.
