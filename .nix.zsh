

nix-pkg-path(){
    nix eval nixpkgs.$1.outPath | sed 's/\"//g' 
}


alias sage="$(echo /nix/store/pw*sage-8.9/bin/sage)"
