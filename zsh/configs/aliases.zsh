# aliases
alias ls='ls --color=auto'

alias ni=nvim
alias nif='ni $(rg --files | fzf -m || echo +qa)'

alias update_pacman_mirrors='sudo reflector --sort rate --protocol https --fastest 50 --number 100 --save /etc/pacman.d/mirrorlist'

alias transd='transmission-daemon --paused --download-dir ~/mda/downloads'
alias transcli='transmission-remote-cli'

alias fehf='feh -.'
