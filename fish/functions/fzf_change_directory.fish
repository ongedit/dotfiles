function fzf_change_directory
    if [ ! -n "$argv" ]
        set --local dir (fd --hidden --type directory . --exclude node_modules | fzf_down --preview 'echo {} | tr -d \'()\' | awk \'{printf "%s ",  $2} {print  $1}\' | xargs -r exa --tree --icons')

        if [ ! -z "$dir" ]
            cd "$dir"
            exa --tree --icons
        end
    else
        mkdir -p "$argv"
        cd "$argv"
    end
end