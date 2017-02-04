# Simple setup script invoker for bash with completion
# Author: Lukas Nellen
#
# Setup scripts are in $HOME/setup.d
# They get sourced to modify the current shell's environment
#
# Special case if $PYENV set to point to a directory with python virtual envs:
#   setup py "the-env"
# will activate the python environment "the-env" in ${PYENV}
#
# Configure automatic name completion 

_setup_complete () {
    local cur="$2"
    local prev="$3"
    if [ ${COMP_CWORD} -gt 1 -a -f "${HOME}/.setup.d/${COMP_WORDS[1]}.compgen" ]
    then
	COMPREPLY=( $(bash "${HOME}/.setup.d/${COMP_WORDS[1]}.compgen" "${cur}" "${prev}") )
    else
	COMPREPLY=( $(builtin cd $HOME/.setup.d && \
		   compgen -f -X "*[~.]*" -- "${cur}" ) )
    fi
}

function setup () {
    script=$1
    shift
    source $HOME/.setup.d/${script} "$@"
}

complete -o nospace -F _setup_complete setup
