CONTAINERS=/home/mkijowski/.containers
GRADING=/home/mkijowski/git/grading-scripts

alias vtkpy="singularity exec ~/.singularity/vtk.simg python"
alias ghidra="singularity exec ~/.singularity/r2ghidra.sif ghidra"
alias r2="singularity exec ~/.singularity/r2ghidra.sif r2"
alias avrdude="singularity exec ~/.singularity/avrdude.sif avrdude"
alias qmk="singularity exec ~/.singularity/avrdude.sif qmk"

alias ggpg="gpg --no-default-keyring --keyring s26-ceg3400.gpg"
alias gitgraph="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias grade=". ~/.env && python $GRADING/claude/autograder.py"
alias review="bash $GRADING/claude/review.sh"
alias gradegraph="python $GRADING/claude/plot_grades.py"
alias post-grades="bash $GRADING/claude/feedback-poster.sh"

alias wifi="nmcli connection up cslab"
alias secrettunnel="nmcli connection up cslab"
alias pandoc="apptainer exec ~/.containers/ubuntu-apptainer/ pandoc"
alias morse="morsecodepy"

alias vol2="singularity exec $CONTAINERS/volatility2.sif python2 /opt/volatility/vol.py"
alias vol3="singularity exec $CONTAINERS/volatility3.sif volatility3"
alias john="singularity exec $CONTAINERS/kali-writable/ john"
alias tshark="singularity exec $CONTAINERS/kali-writable/ tshark"
alias hashid="singularity exec ~/.containers/kali-writable/ hashid"
alias kali="singularity shell ~/.containers/kali-writable/"
alias python2="singularity exec ~/.containers/kali-writable/ python2"
alias whereami="cat /etc/os-release"
alias uncompyle6="singularity exec ~/.containers/uncompyle6.sif uncompyle6"
#alias ="singularity exec ~/.containers/kali.sif "
