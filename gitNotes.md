#### Install diff/history tools:
```
sudo apt-get install kdiff3 gitk
```

For gitk on Arch
```
sudo pacman -S git tk
```

#### Git config defaults (`~/.gitconfig`):
```
[credential]
  helper = cache --timeout=36000000
[core]
  editor = nvim
[diff]
  guitool = kdiff3
[difftool "kdiff3"]
  trustExitCode = false
[difftool]
  prompt = false
```

Set the current user info:
```bash
git config --global user.name "Paulo Nogueira"
git config --global user.email "paulondc@gmail.com"
```
