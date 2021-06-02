# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
# Clion addition
PATH=$PATH:"/ebs/skryabin/clion"
# Tool path
PATH="$PATH:/ebs/skryabin/sdktude"
# CLion my won setup
PATH="$PATH:/ebs/skryabin/clion"
export PATH
