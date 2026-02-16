to add new dotfiles, do this

1. get the dotfile location in you home folder
2. copy the dotfile in the same structure in the dotfiles/ folder 

```bash
cp -r /home/username/.config/rofi /home/username/dotfiles/.config
```

3. make sure you're not gonna overwrite any files and you dotfiles git repo is up to date
4. run `stow --adopt .` in `dotfiles/` folder
