# dotfiles

https://drewdevault.com/2019/12/30/dotfiles.html

## Setting up new pc

```bash
cd ~
git init
git remote add origin git@github.com:pmysiak/dotfiles.git
git fetch
git checkout -f main
```

## Add something to repository

By default everything is ignored by .gitignore

```bash
git add .zshrc
```

