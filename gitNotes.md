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
