CONTAINERS=/home/mkijowski/.containers

#########################
#### Grading aliases ####
#########################
GRADING=/home/mkijowski/git/grading-scripts

alias grade=". ~/.env && python $GRADING/claude/autograder.py"
alias review="bash $GRADING/claude/review.sh"
alias gradegraph="python $GRADING/claude/plot_grades.py"
alias post-grades="bash $GRADING/claude/feedback-poster.sh"
alias ggpg="gpg --no-default-keyring --keyring s26-ceg3400.gpg"

###############################
#### Cybersecurity aliases ####
###############################
alias ghidra="singularity exec $CONTAINERS/r2ghidra.sif ghidra"
alias r2="singularity exec $CONTAINERS/r2ghidra.sif r2"
alias uncompyle6="singularity exec $CONTAINERS/uncompyle6.sif uncompyle6"
# singularity build $CONTAINERS/volatility2.sif docker://oste/volatility2:amd64
alias vol2="singularity exec $CONTAINERS/volatility2.sif python2 /opt/volatility/vol.py"
#singularity build $CONTAINERS/volatility3.sif docker://sk4la/volatility3
alias vol3="singularity exec $CONTAINERS/volatility3.sif volatility3"

# singularity build --sandbox ./kali/ docker://kalilinux/kali-rolling
#   sudo apt update && sudo apt install kali-linux-headless ophcrack-cli \
#   && gunzip /usr/share/wordlists/rockyou.tgz \
#   && mkdir  /usr/share/wordlists/xpspecial && wget xpspecial (~6GB!)
alias kali="singularity shell $CONTAINERS/kali.sif"
alias john="singularity exec $CONTAINERS/kali.sif john"
alias binwalk="singularity exec $CONTAINERS/kali.sif binwalk"
alias tshark="singularity exec $CONTAINERS/kali.sif tshark"
alias hashid="singularity exec $CONTAINERS/kali.sif hashid"
alias python2="singularity exec $CONTAINERS/kali.sif python2"

#####################
#### Dev aliases ####
#####################
alias vtkpy="singularity exec $CONTAINERS/vtk.simg python"
alias avrdude="singularity exec $CONTAINERS/avrdude.sif avrdude"
alias qmk="singularity exec $CONTAINERS/avrdude.sif qmk"
alias gitgraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias pandoc="apptainer exec ~/.containers/ubuntu-apptainer/ pandoc"
alias whereami="cat /etc/os-release"

