CONTAINERS=/home/mkijowski/containers
alias vtkpy="singularity exec $CONTAINERS/vtk.simg python"

alias ghidra="singularity exec $CONTAINERS/r2ghidra.sif ghidra"
alias r2="singularity exec $CONTAINERS/r2ghidra.sif r2"

alias avrdude="singularity exec $CONTAINERS/avrdude.sif avrdude"
alias qmk="singularity exec $CONTAINERS/avrdude.sif qmk"

alias gitgraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias ggpg="gpg --no-default-keyring --keyring s26-ceg3400.gpg"

# singularity build --sandbox ./kali/ docker://kalilinux/kali-rolling
#   sudo apt update && sudo apt install kali-linux-headless ophcrack-cli \
#   && gunzip /usr/share/wordlists/rockyou.tgz \
#   && mkdir  /usr/share/wordlists/xpspecial && wget xpspecial (~6GB!)
alias kali="singularity shell $CONTAINERS/kali.sif"
alias kali2="singularity exec $CONTAINERS/kali.sif"
alias john="singularity exec $CONTAINERS/kali.sif john"
alias binwalk="singularity exec $CONTAINERS/kali.sif binwalk"

# singularity build $CONTAINERS/volatility2.sif docker://oste/volatility2:amd64
alias vol2="singularity exec $CONTAINERS/volatility2.sif python2 /opt/volatility/vol.py"

#singularity build $CONTAINERS/volatility3.sif docker://sk4la/volatility3
alias vol3="singularity exec $CONTAINERS/volatility3.sif volatility3"
