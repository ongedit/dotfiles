# docs setup
# fisher install meaningful-ooo/sponge
# fisher install pure-fish/pure

if status is-interactive
    and not set -q TMUX
    if tmux has-session -t inbox
        exec tmux attach-session -t inbox
    else
        tmux new-session -s inbox
    end
end

set -U fish_greeting

set -gx DENO_INSTALL $HOME/.deno
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -gx GEM_HOME $HOME/gems
set -gx PNPM_HOME $HOME/.local/share/pnpm

set -gx EDITOR nvim
set -gx VISUAL $EDITOR
set -gx MANPAGER $EDITOR +Man!

set -gx PATH $DENO_INSTALL/bin $PNPM_HOME $HOME/.npm/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin $HOME/.local/bin $HOME/bin $HOME/dotfiles/bin $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/gems/bin $(yarn global bin) $PATH

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# rose pine dawn support
set -gx FZF_DEFAULT_OPTS "
 --color=fg:#575279,bg:#fffaf3,hl:#9893a5
 --color=fg+:#797593,bg+:#faf4ed,hl+:#797593
 --color=info:#56949f,prompt:#56949f,pointer:#907aa9
 --color=marker:#d7827e,spinner:#b4637a,header:#d7827e"

alias bat='bat --theme=GitHub'
alias m='mpv --loop-playlist --shuffle *'
alias ser='browser_sync_start_server'
alias tree='exa --tree --icons'
alias x='chmod +x'

alias c='clear -x'
alias q='exit'

alias r='rm -rf'
alias rr='sudo rm -rf'
alias t='trash'

alias d='fzf_change_directory'
alias dd='cd $HOME; fzf_change_directory'
alias e='fzf_edit_file'
alias ee='cd $HOME; fzf_edit_file'
alias E='fzf_edit_file_sudo'
alias ej='fzf_emoji'
alias fzf_down='fzf --reverse --preview-window=top'
alias o='fzf_open'
alias g='fzf_rg'

alias f='yay -Ss'
alias i='yay -S --noconfirm'
alias u='yay -R --noconfirm'
alias uu='yay -R --noconfirm'

alias a='git add -A; git commit'
alias aa='git add -A; git commit -m "auto commit"'
alias am='git add -A; git commit --amend --no-edit'
alias cdr='change_directory_to_git_root'
alias gc='clone_change_dir_to_repo'
alias l='git pull'
alias ll='git pull -f'
alias p='git push'
alias pp='git push -f'
alias s='git status -sb'

alias ...='cd .. ; cd .. ; ls'
alias ..='cd .. ; ls'
alias doc='cd ~/Documents ; ls'
alias dow='cd ~/Downloads ; ls'
alias la='exa --all --icons'
alias ls='exa --long --all --icons'
alias tmp='cd /tmp'

fnm env --use-on-cd | source
#starship init fish | source
