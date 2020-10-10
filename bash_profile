# alias ctags ~/opt/ctags/bin/ctags

# First up let's stash away out base working path
basepath=${PATH}

# So now we need to set some environment variables
# But none of this seems to work all that well/at all.
export SBCL_HOME=~/opt/sbcl/lib/sbcl
export CCL_DEFAULT_DIRECTORY=~/opt/ccl
export VIM_APP_DIR=~/bin
export VISUAL=vim
export EDITOR=${VISUAL}


extpath=${extpath}:~/bin:~/opt/elixir/bin::~/opt/otp/bin
extpath=${extpath}:~/opt/ocaml/bin:~/opt/opam/bin
extpath=${extpath}:~/opt/sbcl/bin:~/opt/ccl/scripts
extpath=${extpath}:~/opt/scala/bin:~/opt/activator
extpath=${extpath}:~/Applications/SWI-Prolog.app/Contents/MacOS/
extpath=${extpath}:~/Applications/Julia-0.3.3.app/Contents/Resources/julia/bin/
extpath=${extpath}:~/npm-global/bin


# Setting PATH for Python 3.4
# The orginal version is saved in .bash_login.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
# export PATH

# Setting PATH for Python 3.5
# The orginal version is saved in .bash_login.pysave
extpath="/Library/Frameworks/Python.framework/Versions/3.5/bin:${extpath}"

PATH=${extpath}:${basepath}
export PATH

# Functions to make working with go just that little bit easier

function gopath {
	PATH=$1/bin:${extpath}:${basepath}
	export GOPATH=$1
}
function gocurrent {
	gopath $(pwd)
}

gopath ${HOME}/experiments/gopl

# OPAM configuration
. /Users/barry/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

function resetocaml {
	eval `opam config env`
}

