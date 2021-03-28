# dotfiles

for use with GNU stow

## `cheat`
`cheat` is configured to place all personal cheatsheets within `./cheat/.config/cheat/cheatsheets/personal` for tracking. to ignore the unnecessary deployment of these, use:
```bash
stow --ignore=.config/cheat/cheatsheets/personal cheat
```



---
TODO:
- refactor bash completion to better suit XDG when `bash-completion` >= 2.9. [info](https://serverfault.com/a/831184)

