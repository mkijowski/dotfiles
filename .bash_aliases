CONTAINERS=/home/mkijowski/containers
alias vtkpy="singularity exec $CONTAINERS/vtk.simg python"
alias ghidra="singularity exec $CONTAINERS/r2ghidra.sif ghidra"
alias r2="singularity exec $CONTAINERS/r2ghidra.sif r2"
alias avrdude="singularity exec $CONTAINERS/avrdude.sif avrdude"
alias qmk="singularity exec $CONTAINERS/avrdude.sif qmk"

alias gitgraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias ggpg="gpg --no-default-keyring --keyring s26-ceg3400.gpg"

alias kali="singularity shell $CONTAINERS/kali/"
alias john="singularity exec $CONTAINERS/kali/ john"
alias binwalk="singularity exec $CONTAINERS/kali/ binwalk"
