# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export https_proxy=http://10.158.100.1:8080
export http_proxy=http://10.158.100.1:8080
export no_proxy=localhost,127.0.0.0,127.0.1.1,local.home,http://linux.int.net.nokia.com,nsn-net.net
# XZ will use all core while operating
export XZ_DEFAULTS='--threads=0'
# LibArchive path
#export PKG_CONFIG_PATH=~/usr/lib/pkgconfig:~/usr/lib64/pkgconfig:~/usr/include

#PATH=$PATH:/opt/coverity/x86_64/2017.SP1-3/bin
# add soft app to the path
#PATH=$PATH:~/usr/bin:~/usr/lib:~/usr/lib64

# alias for work dir /var/fpwork/skryabin 

# Setup environments to build 5G L2-LO
export PARALLEL_BUILD_JOBS=$(($(nproc) / 2))
export BB_NUMBER_THREADS=$(($(nproc) / 2))
# Set locale for Yocto
export LANG=en_US.UTF-8
# Tool path
export PATH="$PATH:/ebs/skryabin/sdktude"
# CLion my won setup
export PATH="$PATH:/ebs/skryabin/clion/bin"

#alias to save and restore CLion config durinf git clean
alias gitclean='saveclion; git clean -xdff && git submodule foreach --recursive git clean -xdff; restoreclion'

export GNB_SOURCE_PATH="/ebs/$USER/gnb"

function saveclion
{
  \mkdir -p ~/clion-save/common/sct/tickler
  \mkdir -p ~/clion-save/uplane/sct/tickler
  \mkdir -p ~/clion-save/uplane/sct/cpp_testsuites
  \mkdir -p ~/clion-save/uplane/L2-PS
  \cp -rf $GNB_SOURCE_PATH/common/sct/tickler/.idea ~/clion-save/common/sct/tickler
  \cp -rf $GNB_SOURCE_PATH/uplane/sct/tickler/.idea ~/clion-save/uplane/sct/tickler
  \cp -rf $GNB_SOURCE_PATH/uplane/sct/cpp_testsuites/.idea ~/clion-save/uplane/sct/cpp_testsuites
  \cp -rf $GNB_SOURCE_PATH/uplane/L2-PS/.idea ~/clion-save/uplane/L2-PS
}
 
function restoreclion
{
  \cp -rf ~/clion-save/common/sct/tickler/.idea $GNB_SOURCE_PATH/common/sct/tickler
  \cp -rf ~/clion-save/uplane/sct/tickler/.idea $GNB_SOURCE_PATH/uplane/sct/tickler
  \cp -rf ~/clion-save/uplane/sct/cpp_testsuites/.idea $GNB_SOURCE_PATH/uplane/sct/cpp_testsuites
  \cp -rf ~/clion-save/uplane/L2-PS/.idea $GNB_SOURCE_PATH/uplane/L2-PS
}
