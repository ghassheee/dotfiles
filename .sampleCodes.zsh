nix-sample () {
    if [[ -s shell.nix ]] ; then
        if [[ -s default.nix ]] ; then 
            cat $DOT/nix-shell_sample.nix > shell-sample.nix
        else 
            cat $DOT/nix-shell_sample.nix > default.nix
        fi
    else 
        cat $DOT/nix-shell_sample.nix > shell.nix
    fi
}
