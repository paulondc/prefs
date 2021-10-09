#### Install diff/history tools:
```
sudo apt-get install kdiff3 gitk
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
